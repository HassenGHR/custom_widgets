import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  final Widget child;
  final double maxSlide;

  const CustomDrawer({Key? key, required this.child, this.maxSlide = 250})
      : super(key: key);

  static _CustomDrawerState? of(BuildContext context) {
    return context.findAncestorStateOfType<_CustomDrawerState>();
  }

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool _canBeDragged = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  void open() => _animationController.forward();
  void close() => _animationController.reverse();
  void toggle() => _animationController.isDismissed ? open() : close();

  void _onDragStart(DragStartDetails details) {
    bool isDragOpenFromLeft = _animationController.isDismissed &&
        details.globalPosition.dx < 60; // Allow drag from edge

    bool isDragCloseFromRight = _animationController.isCompleted &&
        details.globalPosition.dx > widget.maxSlide - 60;

    _canBeDragged = isDragOpenFromLeft || isDragCloseFromRight;
  }

  void _onDragUpdate(DragUpdateDetails details) {
    if (_canBeDragged) {
      double delta = details.primaryDelta! / widget.maxSlide;
      _animationController.value += delta;
    }
  }

  void _onDragEnd(DragEndDetails details) {
    if (_animationController.isDismissed || _animationController.isCompleted) {
      return;
    }

    if (details.velocity.pixelsPerSecond.dx.abs() >= 365.0) {
      double visualVelocity = details.velocity.pixelsPerSecond.dx /
          MediaQuery.of(context).size.width;
      _animationController.fling(velocity: visualVelocity);
    } else if (_animationController.value < 0.5) {
      close();
    } else {
      open();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: close,
      onHorizontalDragStart: _onDragStart,
      onHorizontalDragUpdate: _onDragUpdate,
      onHorizontalDragEnd: _onDragEnd,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          double slide = widget.maxSlide * _animationController.value;
          return Stack(
            children: [
              Transform.translate(
                offset: Offset(slide, 0),
                child: Container(
                  width: widget.maxSlide,
                  color: Colors.blue,
                  child: Column(
                    children: [
                      const SizedBox(height: 100),
                      ListTile(
                        leading: const Icon(Icons.home, color: Colors.white),
                        title: const Text("Home",
                            style: TextStyle(color: Colors.white)),
                        onTap: close,
                      ),
                      ListTile(
                        leading:
                            const Icon(Icons.settings, color: Colors.white),
                        title: const Text("Settings",
                            style: TextStyle(color: Colors.white)),
                        onTap: close,
                      ),
                    ],
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(slide, 0),
                child: widget.child,
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
