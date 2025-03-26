import 'package:flutter/material.dart';

class FlightsStepper extends StatefulWidget {
  const FlightsStepper({super.key});

  @override
  State<FlightsStepper> createState() => _FlightsStepperState();
}

class _FlightsStepperState extends State<FlightsStepper>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
  }

  Future<void> animateDot(Offset startOffset) async {
    OverlayEntry entry = OverlayEntry(
      builder: (context) {
        double minTop = MediaQuery.of(context).padding.top + 52;
        return AnimatedBuilder(
          animation: _animationController,
          builder: (context, child) {
            return Positioned(
              left: 76,
              top: minTop +
                  (startOffset.dy - minTop) * (1 - _animationController.value),
              child: child!,
            );
          },
          child: const Dot(),
        );
      },
    );

    Overlay.of(context).insert(entry);
    await _animationController.forward(from: 0);
    entry.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: backgroundDecoration,
        child: SafeArea(
          child: Stack(
            children: <Widget>[
              const ArrowIcons(),
              const Plane(),
              const Line(),
              Page(onOptionSelected: animateDot),
            ],
          ),
        ),
      ),
    );
  }
}

class Page extends StatelessWidget {
  final Function(Offset) onOptionSelected;

  const Page({super.key, required this.onOptionSelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OptionItem(text: "Business", onTap: onOptionSelected),
        OptionItem(text: "Personal", onTap: onOptionSelected),
        OptionItem(text: "Others", onTap: onOptionSelected),
      ],
    );
  }
}

class OptionItem extends StatefulWidget {
  final String text;
  final Function(Offset) onTap;

  const OptionItem({super.key, required this.text, required this.onTap});

  @override
  State<OptionItem> createState() => _OptionItemState();
}

class _OptionItemState extends State<OptionItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        RenderBox object = context.findRenderObject() as RenderBox;
        Offset globalPosition = object.localToGlobal(Offset.zero);
        widget.onTap(globalPosition);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Text(widget.text,
            style: const TextStyle(color: Colors.white, fontSize: 18)),
      ),
    );
  }
}

class ArrowIcons extends StatelessWidget {
  const ArrowIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 20,
      top: 50,
      child: Row(
        children: const [
          Icon(Icons.arrow_back_ios, color: Colors.white),
          SizedBox(width: 10),
          Icon(Icons.arrow_forward_ios, color: Colors.white),
        ],
      ),
    );
  }
}

class Plane extends StatelessWidget {
  const Plane({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 100,
      left: MediaQuery.of(context).size.width / 2 - 30,
      child:
          const Icon(Icons.airplanemode_active, color: Colors.white, size: 50),
    );
  }
}

class Line extends StatelessWidget {
  const Line({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 76,
      top: 150,
      bottom: 50,
      child: Container(
        width: 2,
        color: Colors.white,
      ),
    );
  }
}

class Dot extends StatelessWidget {
  const Dot({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 10,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
    );
  }
}

const BoxDecoration backgroundDecoration = BoxDecoration(
  gradient: LinearGradient(
    colors: [Colors.blueAccent, Colors.blueGrey],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  ),
);
