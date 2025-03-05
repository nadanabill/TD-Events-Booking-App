import 'package:flutter/material.dart';
import 'package:td_events_booking/features/organizer_profile/ui/widgets/organizer_profile_body_widget.dart';

import '../../../core/themes/app_colors.dart';

class OrganizerProfileScreen extends StatelessWidget {
  const OrganizerProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: AppColors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert, color: AppColors.black),
          ),
        ],
      ),
      body: const OrganizerProfileBodyWidget(),
    );
  }
}
