part of 'profile_bloc.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitialState extends ProfileState {}

// userComment
final class UserCommentLoadingState extends ProfileState {}

final class UserCommentSuccessState extends ProfileState {
  final List<UserCommentModel> userComment;

  UserCommentSuccessState({required this.userComment});
}

final class UserCommentErrorState extends ProfileState {
  final String error;

  UserCommentErrorState({required this.error});
}

//user Payment

final class UserPaymentLoading extends ProfileState {}

final class UserPaymentSuccess extends ProfileState {
  final List<UserPaymentModel> userPayment;

  UserPaymentSuccess({required this.userPayment});
}

final class UserPaymentError extends ProfileState {
  final String error;

  UserPaymentError({required this.error});
}
