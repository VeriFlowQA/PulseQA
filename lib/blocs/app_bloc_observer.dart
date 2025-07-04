import 'package:flutter_bloc/flutter_bloc.dart';

/// Logs all BLoC events and state changes – helpful in QA/debug environments.
class AppBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    print('[Bloc Event] ${bloc.runtimeType} -> $event');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('[Bloc Change] ${bloc.runtimeType} -> $change');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('[Bloc Error] ${bloc.runtimeType} -> $error');
    super.onError(bloc, error, stackTrace);
  }
}
