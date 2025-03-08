import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:td_events_booking/core/widgets/error_widget.dart';
import 'package:td_events_booking/features/all_events/logic/all_events_cubit.dart';
import 'package:td_events_booking/features/home/ui/widgets/event_item_widget.dart';
import 'package:td_events_booking/features/home/ui/widgets/text_row_widget.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/helpers/spaces.dart';
import '../../../../core/routing/routes.dart';

class EventsListWidget extends StatelessWidget {
  const EventsListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllEventsCubit, AllEventsState>(
        builder: (context, state) {
      return Column(
        children: [
          TextRowWidget(
            text: AppStrings.upcomingEvents,
            onPressed: () {
              if (state is AllEventsFailure) {
                context.read<AllEventsCubit>().getAllEvents();
              }
              Navigator.pushNamed(context, Routes.allEventsScreen,
                  arguments: context);
            },
          ),
          SizedBox(
              height: 270.h,
              child: state is AllEventsSuccess
                  ? ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount:
                          context.read<AllEventsCubit>().allEventsList.length,
                      padding: const EdgeInsets.only(
                          left: 24, right: 24, bottom: 24),
                      separatorBuilder: (context, index) => horizontalSpace(16),
                      itemBuilder: (context, index) => EventItemWidget(
                        event:
                            context.read<AllEventsCubit>().allEventsList[index],
                      ),
                    )
                  : state is AllEventsFailure
                      ? ErrorTextWidget(
                          error: state.error.message ?? "Something went wrong")
                      : const Center(child: CircularProgressIndicator())),
        ],
      );
    });
  }
}
