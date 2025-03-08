import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:td_events_booking/features/home/ui/widgets/categories_list_widget.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/themes/app_colors.dart';
import 'events_list_widget.dart';
import 'home_app_bar_widget.dart';
import 'invite_card_widget.dart';
import 'text_row_widget.dart';

class HomeBodyWidget extends StatelessWidget {
  const HomeBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        toolbarHeight: 90.h,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(33),
          ),
        ),
        flexibleSpace: const SafeArea(
          child: HomeAppBarWidget(),
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(40),
          child: CategoriesListWidget(),
        ),
      ),
      body: ListView(
        children: [
          const EventsListWidget(),
          const InviteCardWidget(),
          TextRowWidget(
            text: AppStrings.nearbyEvents,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
