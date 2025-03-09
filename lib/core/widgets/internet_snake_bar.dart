import 'package:flutter/material.dart';
import 'package:td_events_booking/core/widgets/snake_bar.dart';

import '../connection_cubit/internet__cubit.dart';

void showInternetStatusSnakeBar(BuildContext context, InternetState state) {
  bool isConnected = state == InternetState.connected;
  debugPrint(!isConnected ? 'No Internet  ' : 'Internet connected  ');
  ScaffoldMessenger.of(context).clearSnackBars();

  if (state == InternetState.disconnected) {
    showSnakeBar(context, message: 'No Internet Connection', error: true);
  } else if (state == InternetState.connected) {
    showSnakeBar(context, message: 'Internet Connected', error: false);
  }
}
