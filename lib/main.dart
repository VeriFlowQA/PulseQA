import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pulseqa/app.dart';
import 'package:pulseqa/config/test_config.dart';
import 'package:pulseqa/blocs/app_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Optional: Load mock configs or override endpoints in testing mode
  await TestConfig.init();

  // Set BLoC observer for logging & debugging
  Bloc.observer = AppBlocObserver();

  runApp(const PulseQAApp());
}
