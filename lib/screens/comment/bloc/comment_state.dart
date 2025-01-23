part of 'comment_bloc.dart';

@immutable
sealed class CommentState {}

final class CommentInitial extends CommentState {}

class CommentLoadingState extends CommentState {}

class CommentSuccessState extends CommentState {}

class CommentErrorState extends CommentState {
  final String error;

  CommentErrorState({required this.error});
}
