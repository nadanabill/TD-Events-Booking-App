import 'package:flutter/material.dart';

import '../../../../core/helpers/spaces.dart';
import '../../../home/ui/widgets/event_item_widget.dart';

class EventListWidget extends StatelessWidget {
  const EventListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView.separated(
        itemBuilder: (context, index) => const EventItemWidget(),
        separatorBuilder: (context, index) => verticalSpace(15),
        itemCount: 10,
      ),
    );
  }
}
