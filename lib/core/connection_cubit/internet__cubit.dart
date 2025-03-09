import 'dart:async';
import 'dart:io';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum InternetState { connected, disconnected, unstable }

class InternetCubit extends Cubit<InternetState> {
  final Connectivity _connectivity = Connectivity();
  StreamSubscription? _subscription;
  int _failures = 0;
  Timer? _timer;

  InternetCubit() : super(InternetState.connected) {
    _monitorConnectivity();
  }

  void _monitorConnectivity() {
    _subscription = _connectivity.onConnectivityChanged.listen((result) async {
      bool hasInternet = await _hasNetworkAccess();

      if (!hasInternet) {
        _failures++;
      } else {
        _failures = 0;
      }

      if (_failures >= 3) {
        emit(InternetState.unstable);
      } else {
        emit(
            hasInternet ? InternetState.connected : InternetState.disconnected);
      }
    });

    _timer = Timer.periodic(const Duration(seconds: 5), (timer) async {
      bool hasInternet = await _hasNetworkAccess();

      if (!hasInternet) {
        _failures++;
        if (_failures >= 3) {
          emit(InternetState.unstable);
        } else {
          emit(InternetState.disconnected);
        }
      } else {
        _failures = 0;
        emit(InternetState.connected);
      }
    });
  }

  Future<bool> _hasNetworkAccess() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } catch (_) {
      return false;
    }
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    _timer?.cancel();
    return super.close();
  }
}
