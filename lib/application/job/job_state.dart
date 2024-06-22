part of 'job_bloc.dart';

@freezed
class JobState with _$JobState {
  const factory JobState.initial() = _Initial;
  const factory JobState.loading() = _JobStateLoading;
  const factory JobState.loggedIn(String token) = _LoggedIn;
  const factory JobState.error(String message) = _JobStateError;
}
