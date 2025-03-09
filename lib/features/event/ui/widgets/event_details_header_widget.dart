import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:td_events_booking/features/event/logic/event_details_cubit.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/helpers/spaces.dart';
import '../../../../core/models/event_model.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/app_text_styles.dart';

class EventDetailsHeaderWidget extends StatelessWidget {
  final Event event;

  const EventDetailsHeaderWidget({
    super.key,
    required this.event,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      child: Stack(
        children: [
          Stack(
            children: [
              Container(
                height: 240,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(event.picture!),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_back,
                          color: AppColors.white,
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                      horizontalSpace(5),
                      Text(
                        AppStrings.eventDetails,
                        style: AppTextStyles.font24White400,
                      ),
                      const Spacer(),
                      Container(
                        width: 36.w,
                        height: 36.h,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: InkWell(
                          onTap: () {
                            context.read<EventDetailsCubit>().saveEvent(event);
                          },
                          child: Icon(
                            context.watch<EventDetailsCubit>().isSaved
                                ? Icons.bookmark_rounded
                                : Icons.bookmark_outline_rounded,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 200,
            bottom: 0,
            left: 16,
            right: 16,
            child: Container(
              height: 60,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: const [
                  BoxShadow(
                    color: AppColors.grey2,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 56.w,
                    height: 24.h,
                    color: AppColors.white,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: CircleAvatar(
                            radius: 12.r,
                            backgroundColor: AppColors.white,
                            child: Image.asset('assets/images/profile3.png'),
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: CircleAvatar(
                            backgroundColor: AppColors.white,
                            radius: 12.r,
                            child: Image.asset('assets/images/profile2.png'),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: CircleAvatar(
                            radius: 12.r,
                            backgroundColor: AppColors.white,
                            child: Image.asset('assets/images/profile1.png'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  horizontalSpace(10),
                  Text(
                    "+${event.numberOfGoing} Going",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.font12Primary500,
                  ),
                  const Spacer(),
                  Container(
                    width: 67.w,
                    height: 28.h,
                    decoration: ShapeDecoration(
                      color: AppColors.primary,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7.r)),
                    ),
                    child: Center(
                      child: Text(
                        'Invite',
                        textAlign: TextAlign.center,
                        style: AppTextStyles.font12White400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
