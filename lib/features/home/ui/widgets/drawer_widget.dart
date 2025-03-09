import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:td_events_booking/core/constants/app_assets.dart';
import 'package:td_events_booking/core/constants/app_strings.dart';
import 'package:td_events_booking/core/helpers/spaces.dart';
import 'package:td_events_booking/core/themes/app_text_styles.dart';
import 'package:td_events_booking/features/home/data/models/drawer_model.dart';
import 'package:td_events_booking/features/home/ui/widgets/drawer_item_widget.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 40,
              backgroundImage: AssetImage("assets/images/profile4.png"),
            ),
            verticalSpace(10),
            Text(
              "Ashfak Sayem",
              style: AppTextStyles.font18Black500,
            ),
            verticalSpace(30),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => DrawerItemWidget(
                drawerItem: drawerItems[index],
              ),
              separatorBuilder: (context, index) => verticalSpace(15),
              itemCount: drawerItems.length,
            ),
            const Spacer(),
            InkWell(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color(0xffFEF2E9),
                ),
                height: 46.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      AppSvgs.upgrade,
                    ),
                    horizontalSpace(10),
                    Text(
                      AppStrings.upgradePro,
                      style: AppTextStyles.font14Primary500,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
