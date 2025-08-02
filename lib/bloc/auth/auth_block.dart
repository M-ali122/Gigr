import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repositories/auth_repositore.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({required this.authRepository}) : super(AuthInitial()) {
    on<LoginRequested>(_onLogin);
    on<SignupRequested>(_onSignup);
  }

  Future<void> _onLogin(LoginRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final success = await authRepository.login(event.email, event.password);
      if (success) {
        emit(AuthSuccess());
      } else {
        emit(AuthFailure("Invalid login credentials"));
      }
    } catch (e) {
      emit(AuthFailure("Login failed: ${e.toString()}"));
    }
  }

  Future<void> _onSignup(SignupRequested event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      final success = await authRepository.signup(event.name, event.email, event.password);
      if (success) {
        emit(AuthSuccess());
      } else {
        emit(AuthFailure("Signup failed"));
      }
    } catch (e) {
      emit(AuthFailure("Signup failed: ${e.toString()}"));
    }
  }
}
