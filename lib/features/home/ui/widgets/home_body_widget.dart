import 'package:flutter/material.dart';

import '../../../../core/constants/app_strings.dart';
import 'events_list_widget.dart';
import 'invite_card_widget.dart';
import 'text_row_widget.dart';

class HomeBodyWidget extends StatelessWidget {
  const HomeBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TextRowWidget(text: AppStrings.upcomingEvents),
        const EventsListWidget(),
        const InviteCardWidget(),
        TextRowWidget(text: AppStrings.nearbyEvents),
      ],
    );
  }
}
