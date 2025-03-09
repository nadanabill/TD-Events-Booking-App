import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:td_events_booking/features/all_events/logic/all_events_cubit.dart';
import 'package:td_events_booking/features/local_events/logic/local_events_cubit.dart';

import '../../../../core/constants/app_assets.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/helpers/spaces.dart';
import '../../../../core/models/event_model.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/app_text_styles.dart';
import '../../../../core/helpers/share_service.dart';

class LocalEventsItemWidget extends StatelessWidget {
  final Event event;
  final bool isSaved;

  const LocalEventsItemWidget({
    super.key,
    required this.event,
    required this.isSaved,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: (){
        getIt<ShareService>().shareEvent(event);
      },
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.eventDetailsScreen,
          arguments: {
            'eventId': event.eventId,
            'isSaved': isSaved,
          },
        );
      },
      child: Container(
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
            horizontalSpace(10),
            IconButton(
              onPressed: () {
                context.read<LocalEventsCubit>().removeEvent(event);
                context.read<AllEventsCubit>().allEventsMap[event.eventId!] =
                    false;
              },
              icon: const Icon(
                Icons.delete_outline_rounded,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
