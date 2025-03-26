import 'package:animations_widgets/screens/datepicker_screen.dart';
import 'package:animations_widgets/screens/daterangepicker_screen.dart';
import 'package:animations_widgets/screens/expansiontile_screen.dart';
import 'package:animations_widgets/screens/fittedbox_screen.dart';
import 'package:animations_widgets/screens/popupmenu_screen.dart';
import 'package:animations_widgets/screens/safearea_screen.dart';
import 'package:animations_widgets/screens/slider_screen.dart';
import 'package:animations_widgets/screens/stack_screen.dart';
import 'package:animations_widgets/screens/table_screen.dart';
import 'package:animations_widgets/screens/checkboxlist_screen.dart';
import 'package:animations_widgets/screens/cupertino_menu_screen.dart';
import 'package:animations_widgets/screens/timepicker_screen.dart';

import 'package:flutter/material.dart';

class WidgetListScreen extends StatelessWidget {
  final List<Map<String, dynamic>> widgets = [
    {'name': 'Table', 'screen': TableScreen()},
    {'name': 'Stack', 'screen': StackScreen()},
    {'name': 'SafeArea', 'screen': SafeAreaScreen()},
    {'name': 'FittedBox', 'screen': FittedBoxScreen()},
    {'name': 'PopupMenuButton', 'screen': PopupMenuScreen()},
    {'name': 'Cupertino Menu', 'screen': CupertinoMenuScreen()},
    {'name': 'ExpansionTile', 'screen': ExpansionTileScreen()},
    {'name': 'CheckboxListTile', 'screen': CheckboxListScreen()},
    {'name': 'DatePicker', 'screen': DatePickerScreen()},
    {'name': 'TimePicker', 'screen': TimePickerScreen()},
    {'name': 'DateRangePicker', 'screen': DateRangePickerScreen()},
    {'name': 'Slider', 'screen': SliderScreen()},
    // {'name': 'AnimatedIcon', 'screen': AnimatedIconScreen()},
    // {'name': 'AnimatedOpacity', 'screen': AnimatedOpacityScreen()},
    // {'name': 'AnimatedRotation', 'screen': AnimatedRotationScreen()},
    // {'name': 'Hero', 'screen': HeroScreen()},
    // {'name': 'NavigationBar', 'screen': NavigationBarScreen()},
    // {'name': 'TabBar', 'screen': TabBarScreen()},
    // {'name': 'Drawer', 'screen': DrawerScreen()},
    // {'name': 'DrawerHeader', 'screen': DrawerHeaderScreen()},
    // {'name': 'FractionallySizedBox', 'screen': FractionallySizedBoxScreen()},
    // {'name': 'GridView', 'screen': GridViewScreen()},
    // {'name': 'ListView', 'screen': ListViewScreen()},
    // {'name': 'GridTile', 'screen': GridTileScreen()},
    // {'name': 'GridTileBar', 'screen': GridTileBarScreen()},
    // {'name': 'Wrap', 'screen': WrapScreen()},
    // {'name': 'OverflowBar', 'screen': OverflowBarScreen()},
    // {'name': 'FloatingActionButton', 'screen': FloatingActionButtonScreen()},
    // {'name': 'SnackBar', 'screen': SnackBarScreen()},
    // {'name': 'BottomSheet', 'screen': BottomSheetScreen()},
    // {'name': 'GestureDetector', 'screen': GestureDetectorScreen()},
    // {'name': 'Draggable', 'screen': DraggableScreen()},
    // {'name': 'DragTarget', 'screen': DragTargetScreen()},
    // {'name': 'Dismissible', 'screen': DismissibleScreen()},
    // {'name': 'ReorderableListView', 'screen': ReorderableListViewScreen()},
    // {'name': 'StreamBuilder', 'screen': StreamBuilderScreen()},
    // {'name': 'RefreshIndicator', 'screen': RefreshIndicatorScreen()},
    // {'name': 'ErrorWidget', 'screen': ErrorWidgetScreen()},
    // {'name': 'Visibility', 'screen': VisibilityScreen()},
    // {'name': 'AutoComplete', 'screen': AutoCompleteScreen()},
    // {'name': 'CircleAvatar', 'screen': CircleAvatarScreen()},
    // {'name': 'ChoiceChip', 'screen': ChoiceChipScreen()},
    // {
    //   'name': 'CupertinoSlidingSegmentedControl',
    //   'screen': CupertinoSlidingSegmentedScreen()
    // },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Widgets')),
      body: ListView.builder(
        itemCount: widgets.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(widgets[index]['name']),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => widgets[index]['screen']),
              );
            },
          );
        },
      ),
    );
  }
}
