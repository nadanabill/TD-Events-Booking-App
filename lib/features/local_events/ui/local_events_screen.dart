import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:td_events_booking/core/helpers/spaces.dart';
import 'package:td_events_booking/core/widgets/error_widget.dart';

import '../../../core/constants/app_strings.dart';
import '../../../core/themes/app_text_styles.dart';
import '../logic/local_events_cubit.dart';
import 'widgets/local_events_item_widget.dart';

class LocalEventsScreen extends StatelessWidget {
  const LocalEventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppStrings.events, style: AppTextStyles.font24Black400),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocBuilder<LocalEventsCubit, EventsState>(
          builder: (context, state) {
            if (state is AllEventsLocalLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is AllEventsLocalFailure) {
              return ErrorTextWidget(error: state.error.message!);
            }
            var events = context.read<LocalEventsCubit>().events;
            return ListView.separated(
              itemBuilder: (context, index) => LocalEventsItemWidget(
                event: events[index],
                isSaved: true,
              ),
              separatorBuilder: (context, index) => verticalSpace(20),
              itemCount: events.length,
            );
          },
        ),
      ),
    );
  }
}
