import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:td_events_booking/features/home/ui/layout_main_screen.dart';
import 'package:td_events_booking/features/home/ui/widgets/drawer_widget.dart';

final drawerController = ZoomDrawerController();

class Layout extends StatefulWidget {
  const Layout({super.key});

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ZoomDrawer(
        shadowLayer1Color: const Color(0x35BCBCBC),
        shadowLayer2Color: const Color(0x35BCBCBC),
        controller: drawerController,
        showShadow: true,
        menuScreen: const DrawerWidget(),
        style: DrawerStyle.defaultStyle,
        angle: 0.0,
        borderRadius: 40.0,
        menuScreenOverlayColor: Colors.white,
        mainScreen: const LayoutMainScreen(),
      ),
    );
  }
}
