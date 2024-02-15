part of 'startup_cubit.dart';

sealed class StartupState extends Equatable {
  const StartupState();

  @override
  List<Object> get props => [];
}

final class StartupLoading extends StartupState {
  const StartupLoading();
}

final class StartupCompleted extends StartupState {
  const StartupCompleted();
}

final class StartupFailure extends StartupState {
  final String message;

  const StartupFailure(this.message);

  @override
  List<Object> get props => [message];
}
