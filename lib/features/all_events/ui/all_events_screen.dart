import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:td_events_booking/core/constants/app_assets.dart';
import 'package:td_events_booking/core/constants/app_strings.dart';
import 'package:td_events_booking/core/themes/app_colors.dart';

import '../../../core/themes/app_text_styles.dart';
import '../../../core/widgets/error_widget.dart';
import '../logic/all_events_cubit.dart';
import 'widgets/events_list__widget.dart';

class AllEventsScreen extends StatelessWidget {
  const AllEventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllEventsCubit, AllEventsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_rounded,
                color: AppColors.black,
              ),
            ),
            title: Text(AppStrings.events, style: AppTextStyles.font24Black400),
            centerTitle: false,
            actions: [
              InkWell(
                onTap: () {},
                child: SvgPicture.asset(
                  AppSvgs.search,
                  color: AppColors.black,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert_rounded),
              ),
              //   horizontalSpace(5),
            ],
          ),
          body: BlocBuilder<AllEventsCubit, AllEventsState>(
            builder: (context, state) {
              if (state is AllEventsSuccess) {
                return const EventListWidget();
              } else if (state is AllEventsFailure) {
                return ErrorTextWidget(
                  error: state.error.message ?? 'Unknown error occurred',
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        );
      },
    );
  }
}
