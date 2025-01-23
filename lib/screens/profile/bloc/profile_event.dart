part of 'profile_bloc.dart';

@immutable
sealed class ProfileEvent {}

class UserCommentInitEvent extends ProfileEvent {}

class UserPaymentInitEvent extends ProfileEvent {}
