import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:td_events_booking/core/widgets/error_widget.dart';

import '../../../../core/constants/app_strings.dart';
import '../../../../core/helpers/spaces.dart';
import '../../../../core/themes/app_colors.dart';
import '../../../../core/themes/app_text_styles.dart';
import '../../logic/organizer_cubit.dart';
import 'organizer_profile_header_widget.dart';
import 'organizer_tap_view_widget.dart';

class OrganizerProfileBodyWidget extends StatefulWidget {
  const OrganizerProfileBodyWidget({super.key});

  @override
  State<OrganizerProfileBodyWidget> createState() =>
      _OrganizerProfileBodyWidgetState();
}

class _OrganizerProfileBodyWidgetState extends State<OrganizerProfileBodyWidget>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrganizerCubit, OrganizerState>(
      builder: (context, state) {
        if (state is OrganizerSuccess) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    OrganizerProfileHeaderWidget(
                      organizer: state.organizer.data!,
                    ),
                    verticalSpace(20),
                    TabBar(
                      dividerColor: AppColors.white,
                      unselectedLabelStyle: AppTextStyles.font16LightGrey400,
                      labelStyle: AppTextStyles.font16Primary400,
                      controller: tabController,
                      labelColor: AppColors.primary,
                      unselectedLabelColor: AppColors.grey3,
                      indicatorColor: AppColors.primary,
                      tabs: [
                        Tab(text: AppStrings.about.toUpperCase()),
                        Tab(text: AppStrings.events.toUpperCase()),
                        Tab(text: AppStrings.reviews.toUpperCase()),
                      ],
                    ),
                    verticalSpace(20),
                  ],
                ),
              ),
              Expanded(
                child: OrganizerTapViewWidget(
                  tabController: tabController,
                  organizer: state.organizer.data!,
                ),
              ),
            ],
          );
        }
        if (state is OrganizerFailure) {
          return ErrorTextWidget(error: state.error);
        }
        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
