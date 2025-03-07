import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:td_events_booking/features/all_events/data/models/all_events_model.dart';
import 'package:td_events_booking/features/all_events/logic/all_events_cubit.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/helpers/spaces.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/app_text_styles.dart';

class EventsItemWidget extends StatelessWidget {
  final Events event;

  const EventsItemWidget({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 110.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.grey3.withOpacity(0.3),
            blurRadius: 35,
            offset: const Offset(0, 10),
            spreadRadius: 0,
          )
        ],
      ),
      padding: const EdgeInsets.only(top: 9, bottom: 9, left: 9, right: 17),
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  context
                      .read<AllEventsCubit>()
                      .eventFormattedDate(event.date!),
                  style: AppTextStyles.font13Primary400,
                ),
                Text(
                  event.title ?? 'Event Name',
                  style: AppTextStyles.font14Black400,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SvgPicture.asset(
                      AppSvgs.mapPin,
                    ),
                    horizontalSpace(4),
                    Expanded(
                      child: Text(
                        event.address ?? 'Event Address',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.font13LightGrey400,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
