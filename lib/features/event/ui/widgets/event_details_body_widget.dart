import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:td_events_booking/features/event/logic/event_details_cubit.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/helpers/spaces.dart';
import '../../../../core/models/event_model.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/app_text_styles.dart';
import 'details_row_widget.dart';

class EventDetailsBodyWidget extends StatelessWidget {
  final Event event;

  const EventDetailsBodyWidget({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            event.title ?? '',
            style: AppTextStyles.font35Black400,
          ),
          verticalSpace(18),
          DetailsRowWidget(
            title: context
                .read<EventDetailsCubit>()
                .eventFormattedDate(event.date),
            subtitle:
                context.read<EventDetailsCubit>().getEventDate(event.date),
            icon: AppSvgs.date,
          ),
          verticalSpace(15),
          //todo
          DetailsRowWidget(
            title: event.address ?? '',
            subtitle: '36 Guild Street London, UK ',
            icon: AppSvgs.location1,
          ),
          verticalSpace(24),
          //todo
          InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                Routes.organizerProfileScreen,
                arguments: event.organizer!.id,
              );
            },
            child: Row(
              children: [
                Container(
                  width: 44,
                  height: 44,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    image: DecorationImage(
                      image: NetworkImage(
                        event.organizer!.picture ?? AppImages.user,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                horizontalSpace(15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      event.organizer!.name ?? '',
                      style: AppTextStyles.font15Black400,
                    ),
                    Text(
                      'Organizer',
                      style: AppTextStyles.font12LightGray400,
                    )
                  ],
                ),
                const Spacer(),
                Container(
                  width: 67.w,
                  height: 28.h,
                  decoration: ShapeDecoration(
                    color: AppColors.primary.withOpacity(0.12),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.r)),
                  ),
                  child: Center(
                    child: Text(
                      AppStrings.follow,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.font12Primary400,
                    ),
                  ),
                ),
              ],
            ),
          ),
          verticalSpace(20),
          Text(
            AppStrings.aboutEvent,
            style: AppTextStyles.font18Black500,
          ),
          verticalSpace(8),
          Text(
            event.aboutEvent ?? '',
            style: AppTextStyles.font16Black400,
          ),
        ],
      ),
    );
  }
}
