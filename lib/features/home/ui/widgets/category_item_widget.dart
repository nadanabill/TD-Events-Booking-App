import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helpers/spaces.dart';
import '../../../../core/themes/app_text_styles.dart';
import '../../data/models/category_models.dart';

class CategoryItemWidget extends StatelessWidget {
  final CategoryModel item;

  const CategoryItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(item.color),
        borderRadius: BorderRadius.circular(20.r),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          SvgPicture.asset(item.icon),
          horizontalSpace(9),
          Text(
            item.name,
            style: AppTextStyles.font15White400,
          ),
        ],
      ),
    );
  }
}
