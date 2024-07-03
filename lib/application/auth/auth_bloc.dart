import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hiero_company/domain/services/auth/auth_repository.dart';
import 'package:hiero_company/infrastructure/models/usermodels.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc(this.authRepository) : super(const AuthState.initial()) {
    on<_SignUpEvent>((event, emit) async {
      emit(const AuthState.loading());
      try {
        final result = await authRepository.signup(event.companyModel);
        if (result == 'success') {
          emit(const AuthState.loggedIn(''));
        }
        emit(AuthState.error(result));
      } catch (e) {
        emit(AuthState.error(e.toString()));
      }
    });
    on<_LogInEvent>((event, emit) async {
      emit(const AuthState.loading());
      try {
        final result = await authRepository.login(event.companyModel);
        if (result == 'success') {
          emit(const AuthState.loggedIn(''));
        } else {
          emit(AuthState.error(result));
        }
      } catch (e) {
        emit(AuthState.error(e.toString()));
      }
    });
  }
}
