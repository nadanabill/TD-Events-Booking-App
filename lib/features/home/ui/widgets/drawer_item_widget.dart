import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:td_events_booking/features/home/data/models/drawer_model.dart';
import 'package:td_events_booking/features/home/ui/layout.dart';

import '../../../../core/helpers/spaces.dart';
import '../../../../core/themes/app_text_styles.dart';

class DrawerItemWidget extends StatelessWidget {
  final DrawerModel drawerItem;

  const DrawerItemWidget({
    super.key,
    required this.drawerItem,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, drawerItem.router, arguments: context);
        drawerController.toggle?.call();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SvgPicture.asset(drawerItem.icon),
          horizontalSpace(10),
          Text(
            drawerItem.title,
            style: AppTextStyles.font16Black400,
          )
        ],
      ),
    );
  }
}
