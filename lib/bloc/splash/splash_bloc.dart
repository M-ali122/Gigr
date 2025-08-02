import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newgigr/bloc/splash/splash_event.dart';

import '../../repositories/auth_repositore.dart';
import 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final AuthRepository authRepository;

  SplashBloc({required this.authRepository}) : super(SplashInitial()) {
    on<AppStarted>(_onAppStarted);
  }

  Future<void> _onAppStarted(AppStarted event, Emitter<SplashState> emit) async {
    await Future.delayed(const Duration(seconds: 2)); // simulate loading

    final isLoggedIn = await authRepository.isLoggedIn();

    if (isLoggedIn) {
      emit(SplashAuthenticated());
    } else {
      emit(SplashUnauthenticated());
    }
  }
}
