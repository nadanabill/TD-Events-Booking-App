import 'package:flutter/material.dart';
import 'package:td_events_booking/core/widgets/default_button_widget.dart';
import 'package:td_events_booking/features/event/ui/widgets/event_details_body_widget.dart';
import 'package:td_events_booking/features/event/ui/widgets/event_details_header_widget.dart';

import '../../../core/themes/app_colors.dart';

class EventDetailsScreen extends StatelessWidget {
  const EventDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: EventDetailsHeaderWidget(
              eventImage: 'assets/images/event.png',
              guestCount: 20,
            ),
          ),
          SliverToBoxAdapter(
            child: EventDetailsBodyWidget(),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(bottom: 20, right: 20, left: 20),
        height: 58,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.transparent,
          boxShadow: [
            BoxShadow(
              color: AppColors.grey3,
              blurRadius: 10,
              spreadRadius: 15,
              offset: Offset(10, 0),
            ),
          ],
        ),
        child: DefaultButtonWidget(
          text: 'Buy Ticket \$120',
          onPressed: () {},
        ),
      ),
    );
  }
}
