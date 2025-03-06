import 'package:flutter/material.dart';
import 'package:td_events_booking/features/home/ui/widgets/bottom_bar_item_widget.dart';
import 'package:td_events_booking/features/home/ui/widgets/home_body_widget.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/helpers/spaces.dart';
import '../../../core/themes/app_colors.dart';

class LayoutMainScreen extends StatefulWidget {
  const LayoutMainScreen({super.key});

  @override
  State<LayoutMainScreen> createState() => _LayoutMainScreenState();
}

class _LayoutMainScreenState extends State<LayoutMainScreen> {
  List<Widget> tabs = [
    const HomeBodyWidget(),
    Container(),
    Container(),
    Container(),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[currentIndex],
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        onPressed: () {},
        backgroundColor: AppColors.primary,
        elevation: 20,
        child: const Icon(
          Icons.add_box_rounded,
          color: AppColors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 30,
        shadowColor: AppColors.grey,
        color: AppColors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomBarItemWidget(
              icon: AppSvgs.explore,
              title: AppStrings.explore,
              color: currentIndex == 0 ? AppColors.primary : AppColors.grey3,
              onTap: () {
                setState(
                  () {
                    if (currentIndex != 0) {
                      currentIndex = 0;
                    }
                  },
                );
              },
            ),
            BottomBarItemWidget(
              icon: AppSvgs.calendar,
              title: AppStrings.events,
              color: currentIndex == 1 ? AppColors.primary : AppColors.grey3,
              onTap: () {
                setState(
                  () {
                    if (currentIndex != 1) {
                      currentIndex = 1;
                    }
                  },
                );
              },
            ),
            horizontalSpace(40),
            BottomBarItemWidget(
              icon: AppSvgs.location,
              title: AppStrings.map,
              color: currentIndex == 2 ? AppColors.primary : AppColors.grey3,
              onTap: () {
                setState(
                  () {
                    if (currentIndex != 2) {
                      currentIndex = 2;
                    }
                  },
                );
              },
            ),
            BottomBarItemWidget(
              icon: AppSvgs.profile,
              title: AppStrings.profile,
              color: currentIndex == 3 ? AppColors.primary : AppColors.grey3,
              onTap: () {
                setState(
                  () {
                    if (currentIndex != 3) {
                      currentIndex = 3;
                    }
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
