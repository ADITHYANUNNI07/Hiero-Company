// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'job_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$JobEvent {
  JobModel get jobmodel => throw _privateConstructorUsedError;
  String get accessToken => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(JobModel jobmodel, String accessToken) addJob,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(JobModel jobmodel, String accessToken)? addJob,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(JobModel jobmodel, String accessToken)? addJob,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddJobEvent value) addJob,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddJobEvent value)? addJob,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddJobEvent value)? addJob,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $JobEventCopyWith<JobEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JobEventCopyWith<$Res> {
  factory $JobEventCopyWith(JobEvent value, $Res Function(JobEvent) then) =
      _$JobEventCopyWithImpl<$Res, JobEvent>;
  @useResult
  $Res call({JobModel jobmodel, String accessToken});
}

/// @nodoc
class _$JobEventCopyWithImpl<$Res, $Val extends JobEvent>
    implements $JobEventCopyWith<$Res> {
  _$JobEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jobmodel = null,
    Object? accessToken = null,
  }) {
    return _then(_value.copyWith(
      jobmodel: null == jobmodel
          ? _value.jobmodel
          : jobmodel // ignore: cast_nullable_to_non_nullable
              as JobModel,
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddJobEventImplCopyWith<$Res>
    implements $JobEventCopyWith<$Res> {
  factory _$$AddJobEventImplCopyWith(
          _$AddJobEventImpl value, $Res Function(_$AddJobEventImpl) then) =
      __$$AddJobEventImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({JobModel jobmodel, String accessToken});
}

/// @nodoc
class __$$AddJobEventImplCopyWithImpl<$Res>
    extends _$JobEventCopyWithImpl<$Res, _$AddJobEventImpl>
    implements _$$AddJobEventImplCopyWith<$Res> {
  __$$AddJobEventImplCopyWithImpl(
      _$AddJobEventImpl _value, $Res Function(_$AddJobEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? jobmodel = null,
    Object? accessToken = null,
  }) {
    return _then(_$AddJobEventImpl(
      null == jobmodel
          ? _value.jobmodel
          : jobmodel // ignore: cast_nullable_to_non_nullable
              as JobModel,
      null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AddJobEventImpl implements _AddJobEvent {
  const _$AddJobEventImpl(this.jobmodel, this.accessToken);

  @override
  final JobModel jobmodel;
  @override
  final String accessToken;

  @override
  String toString() {
    return 'JobEvent.addJob(jobmodel: $jobmodel, accessToken: $accessToken)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddJobEventImpl &&
            (identical(other.jobmodel, jobmodel) ||
                other.jobmodel == jobmodel) &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken));
  }

  @override
  int get hashCode => Object.hash(runtimeType, jobmodel, accessToken);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddJobEventImplCopyWith<_$AddJobEventImpl> get copyWith =>
      __$$AddJobEventImplCopyWithImpl<_$AddJobEventImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(JobModel jobmodel, String accessToken) addJob,
  }) {
    return addJob(jobmodel, accessToken);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(JobModel jobmodel, String accessToken)? addJob,
  }) {
    return addJob?.call(jobmodel, accessToken);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(JobModel jobmodel, String accessToken)? addJob,
    required TResult orElse(),
  }) {
    if (addJob != null) {
      return addJob(jobmodel, accessToken);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddJobEvent value) addJob,
  }) {
    return addJob(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddJobEvent value)? addJob,
  }) {
    return addJob?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddJobEvent value)? addJob,
    required TResult orElse(),
  }) {
    if (addJob != null) {
      return addJob(this);
    }
    return orElse();
  }
}

abstract class _AddJobEvent implements JobEvent {
  const factory _AddJobEvent(
      final JobModel jobmodel, final String accessToken) = _$AddJobEventImpl;

  @override
  JobModel get jobmodel;
  @override
  String get accessToken;
  @override
  @JsonKey(ignore: true)
  _$$AddJobEventImplCopyWith<_$AddJobEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$JobState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String token) loggedIn,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String token)? loggedIn,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String token)? loggedIn,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_JobStateLoading value) loading,
    required TResult Function(_LoggedIn value) loggedIn,
    required TResult Function(_JobStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_JobStateLoading value)? loading,
    TResult? Function(_LoggedIn value)? loggedIn,
    TResult? Function(_JobStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_JobStateLoading value)? loading,
    TResult Function(_LoggedIn value)? loggedIn,
    TResult Function(_JobStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JobStateCopyWith<$Res> {
  factory $JobStateCopyWith(JobState value, $Res Function(JobState) then) =
      _$JobStateCopyWithImpl<$Res, JobState>;
}

/// @nodoc
class _$JobStateCopyWithImpl<$Res, $Val extends JobState>
    implements $JobStateCopyWith<$Res> {
  _$JobStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$JobStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'JobState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String token) loggedIn,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String token)? loggedIn,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String token)? loggedIn,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_JobStateLoading value) loading,
    required TResult Function(_LoggedIn value) loggedIn,
    required TResult Function(_JobStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_JobStateLoading value)? loading,
    TResult? Function(_LoggedIn value)? loggedIn,
    TResult? Function(_JobStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_JobStateLoading value)? loading,
    TResult Function(_LoggedIn value)? loggedIn,
    TResult Function(_JobStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements JobState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$JobStateLoadingImplCopyWith<$Res> {
  factory _$$JobStateLoadingImplCopyWith(_$JobStateLoadingImpl value,
          $Res Function(_$JobStateLoadingImpl) then) =
      __$$JobStateLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$JobStateLoadingImplCopyWithImpl<$Res>
    extends _$JobStateCopyWithImpl<$Res, _$JobStateLoadingImpl>
    implements _$$JobStateLoadingImplCopyWith<$Res> {
  __$$JobStateLoadingImplCopyWithImpl(
      _$JobStateLoadingImpl _value, $Res Function(_$JobStateLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$JobStateLoadingImpl implements _JobStateLoading {
  const _$JobStateLoadingImpl();

  @override
  String toString() {
    return 'JobState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$JobStateLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String token) loggedIn,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String token)? loggedIn,
    TResult? Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String token)? loggedIn,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_JobStateLoading value) loading,
    required TResult Function(_LoggedIn value) loggedIn,
    required TResult Function(_JobStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_JobStateLoading value)? loading,
    TResult? Function(_LoggedIn value)? loggedIn,
    TResult? Function(_JobStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_JobStateLoading value)? loading,
    TResult Function(_LoggedIn value)? loggedIn,
    TResult Function(_JobStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _JobStateLoading implements JobState {
  const factory _JobStateLoading() = _$JobStateLoadingImpl;
}

/// @nodoc
abstract class _$$LoggedInImplCopyWith<$Res> {
  factory _$$LoggedInImplCopyWith(
          _$LoggedInImpl value, $Res Function(_$LoggedInImpl) then) =
      __$$LoggedInImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String token});
}

/// @nodoc
class __$$LoggedInImplCopyWithImpl<$Res>
    extends _$JobStateCopyWithImpl<$Res, _$LoggedInImpl>
    implements _$$LoggedInImplCopyWith<$Res> {
  __$$LoggedInImplCopyWithImpl(
      _$LoggedInImpl _value, $Res Function(_$LoggedInImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? token = null,
  }) {
    return _then(_$LoggedInImpl(
      null == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoggedInImpl implements _LoggedIn {
  const _$LoggedInImpl(this.token);

  @override
  final String token;

  @override
  String toString() {
    return 'JobState.loggedIn(token: $token)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoggedInImpl &&
            (identical(other.token, token) || other.token == token));
  }

  @override
  int get hashCode => Object.hash(runtimeType, token);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoggedInImplCopyWith<_$LoggedInImpl> get copyWith =>
      __$$LoggedInImplCopyWithImpl<_$LoggedInImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String token) loggedIn,
    required TResult Function(String message) error,
  }) {
    return loggedIn(token);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String token)? loggedIn,
    TResult? Function(String message)? error,
  }) {
    return loggedIn?.call(token);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String token)? loggedIn,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loggedIn != null) {
      return loggedIn(token);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_JobStateLoading value) loading,
    required TResult Function(_LoggedIn value) loggedIn,
    required TResult Function(_JobStateError value) error,
  }) {
    return loggedIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_JobStateLoading value)? loading,
    TResult? Function(_LoggedIn value)? loggedIn,
    TResult? Function(_JobStateError value)? error,
  }) {
    return loggedIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_JobStateLoading value)? loading,
    TResult Function(_LoggedIn value)? loggedIn,
    TResult Function(_JobStateError value)? error,
    required TResult orElse(),
  }) {
    if (loggedIn != null) {
      return loggedIn(this);
    }
    return orElse();
  }
}

abstract class _LoggedIn implements JobState {
  const factory _LoggedIn(final String token) = _$LoggedInImpl;

  String get token;
  @JsonKey(ignore: true)
  _$$LoggedInImplCopyWith<_$LoggedInImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$JobStateErrorImplCopyWith<$Res> {
  factory _$$JobStateErrorImplCopyWith(
          _$JobStateErrorImpl value, $Res Function(_$JobStateErrorImpl) then) =
      __$$JobStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$JobStateErrorImplCopyWithImpl<$Res>
    extends _$JobStateCopyWithImpl<$Res, _$JobStateErrorImpl>
    implements _$$JobStateErrorImplCopyWith<$Res> {
  __$$JobStateErrorImplCopyWithImpl(
      _$JobStateErrorImpl _value, $Res Function(_$JobStateErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$JobStateErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$JobStateErrorImpl implements _JobStateError {
  const _$JobStateErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'JobState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$JobStateErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$JobStateErrorImplCopyWith<_$JobStateErrorImpl> get copyWith =>
      __$$JobStateErrorImplCopyWithImpl<_$JobStateErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String token) loggedIn,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String token)? loggedIn,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String token)? loggedIn,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_JobStateLoading value) loading,
    required TResult Function(_LoggedIn value) loggedIn,
    required TResult Function(_JobStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_JobStateLoading value)? loading,
    TResult? Function(_LoggedIn value)? loggedIn,
    TResult? Function(_JobStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_JobStateLoading value)? loading,
    TResult Function(_LoggedIn value)? loggedIn,
    TResult Function(_JobStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _JobStateError implements JobState {
  const factory _JobStateError(final String message) = _$JobStateErrorImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$JobStateErrorImplCopyWith<_$JobStateErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
