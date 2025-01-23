part of 'comment_bloc.dart';

@immutable
sealed class CommentEvent {}

class CommentSendEvent extends CommentEvent {
  final Comments comments;

  CommentSendEvent({required this.comments});
}
