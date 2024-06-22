part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.signUp(CompanyModel companyModel) = _SignUpEvent;
  const factory AuthEvent.logIn(CompanyModel companyModel) = _LogInEvent;
}
