import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:td_events_booking/core/helpers/spaces.dart';

import '../../data/models/category_models.dart';
import 'category_item_widget.dart';

class CategoriesListWidget extends StatelessWidget {
  const CategoriesListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      transform: Matrix4.translationValues(0, 20, 0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(33.r),
        ),
      ),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        padding: const EdgeInsets.symmetric(horizontal: 24),
        separatorBuilder: (context, index) => horizontalSpace(11),
        itemBuilder: (BuildContext context, int index) => CategoryItemWidget(
          item: categories[index],
        ),
      ),
    );
  }
}
