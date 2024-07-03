import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hiero_company/domain/services/job/job_repository.dart';
import 'package:hiero_company/infrastructure/models/jobmodel.dart';

part 'job_event.dart';
part 'job_state.dart';
part 'job_bloc.freezed.dart';

class JobBloc extends Bloc<JobEvent, JobState> {
  final JobRepository jobRepository;
  JobBloc(this.jobRepository) : super(const JobState.initial()) {
    on<_AddJobEvent>((event, emit) async {
      emit(const JobState.loading());
      try {
        final result =
            await jobRepository.addJob(event.jobmodel, event.accessToken);
        if (result == 'success' ||
            result == 'Job opening created successfully') {
          emit(JobState.loggedIn(result));
        } else {
          emit(JobState.error(result));
        }
      } catch (e) {
        emit(JobState.error(e.toString()));
      }
    });
    on<_GetAllJobEvent>((event, emit) async {
      emit(const JobState.loading());
      try {
        final result = await jobRepository.getAllJob(event.accessToken);
        if (result is String) {
          emit(JobState.error(result));
        } else {
          emit(JobState.loggedIn(result));
        }
      } catch (e) {
        emit(JobState.error(e.toString()));
      }
    });
  }
}
