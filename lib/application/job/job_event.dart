part of 'job_bloc.dart';

@freezed
class JobEvent with _$JobEvent {
  const factory JobEvent.addJob(JobModel jobmodel, String accessToken) =
      _AddJobEvent;
}
