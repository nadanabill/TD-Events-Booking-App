import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:td_events_booking/features/all_events/logic/all_events_cubit.dart';
import 'package:td_events_booking/features/all_events/ui/widgets/events_item_widget.dart';

import '../../../../core/helpers/spaces.dart';

class EventListWidget extends StatefulWidget {
  const EventListWidget({super.key});

  @override
  State<EventListWidget> createState() => _EventListWidgetState();
}

class _EventListWidgetState extends State<EventListWidget> {
  final ScrollController _scrollController = ScrollController();

  void _scrollListener() {
    if (_scrollController.position.pixels >=
            _scrollController.position.maxScrollExtent - 100 &&
        context.read<AllEventsCubit>().hasMorePages) {
      context.read<AllEventsCubit>().getAllEvents();
    }
  }

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllEventsCubit, AllEventsState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView.separated(
            controller: _scrollController,
            itemBuilder: (context, index) {
              if (index ==
                      context.read<AllEventsCubit>().allEventsList.length &&
                  context.read<AllEventsCubit>().hasMorePages) {
                return const Center(child: CircularProgressIndicator());
              }
              return EventsItemWidget(
                event: context.read<AllEventsCubit>().allEventsList[index],
                isSaved: context.read<AllEventsCubit>().allEventsMap[context
                        .read<AllEventsCubit>()
                        .allEventsList[index]
                        .eventId!] ??
                    false,
              );
            },
            separatorBuilder: (context, index) => verticalSpace(15),
            itemCount: context.read<AllEventsCubit>().allEventsList.length +
                (context.read<AllEventsCubit>().hasMorePages ? 1 : 0),
          ),
        );
      },
    );
  }
}
