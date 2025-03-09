import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:td_events_booking/core/widgets/default_button_widget.dart';
import 'package:td_events_booking/core/widgets/error_widget.dart';
import 'package:td_events_booking/features/event/ui/widgets/event_details_body_widget.dart';
import 'package:td_events_booking/features/event/ui/widgets/event_details_header_widget.dart';

import '../../../core/di/dependency_injection.dart';
import '../../../core/helpers/share_service.dart';
import '../logic/event_details_cubit.dart';

class EventDetailsScreen extends StatelessWidget {
  const EventDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EventDetailsCubit, EventDetailsState>(
      builder: (context, state) {
        if (state is EventDetailsSuccess) {
          final event = state.event.data;
          return Scaffold(
            body: InkWell(
              onLongPress: () {
                getIt<ShareService>().shareEvent(event);
              },
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: EventDetailsHeaderWidget(
                      event: event!,
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: EventDetailsBodyWidget(
                      event: event,
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: Container(
              margin: const EdgeInsets.only(bottom: 20, right: 20, left: 20),
              height: 58,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.transparent,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade100,
                    blurRadius: 10,
                    spreadRadius: 10,
                    offset: const Offset(10, 0),
                  ),
                ],
              ),
              child: DefaultButtonWidget(
                text: 'Buy Ticket \$${event.eventPrice}',
                onPressed: () {},
              ),
            ),
          );
        }

        if (state is EventDetailsFailure) {
          return Scaffold(
            body: ErrorTextWidget(error: state.error),
          );
        }
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}
