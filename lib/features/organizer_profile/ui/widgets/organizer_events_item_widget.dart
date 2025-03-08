import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:td_events_booking/features/organizer_profile/data/models/organizer_model.dart';
import 'package:td_events_booking/features/organizer_profile/logic/organizer_cubit.dart';

import '../../../../core/helpers/spaces.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/app_text_styles.dart';

class OrganizerEventsItemWidget extends StatelessWidget {
  final OrganizerEvents event;

  const OrganizerEventsItemWidget({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 112.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.grey3.withOpacity(0.4),
            blurRadius: 25,
            offset: const Offset(0, 5),
            spreadRadius: 0,
          ),
        ],
      ),
      padding: const EdgeInsets.only(
        top: 9,
        bottom: 9,
        left: 9,
        right: 17,
      ),
      child: Row(
        children: [
          Container(
            width: 79.w,
            height: 92.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(event.picture!),
                fit: BoxFit.fill,
              ),
            ),
          ),
          horizontalSpace(15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  context.read<OrganizerCubit>().formatCustomDate(
                        event.date!,
                      ),
                  style: AppTextStyles.font13Primary400,
                ),
                Text(
                  event.title ?? '',
                  style: AppTextStyles.font18Black500,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
