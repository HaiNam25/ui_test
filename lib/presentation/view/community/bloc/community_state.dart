part of 'community_cubit.dart';

@immutable
abstract class CommunityState {}

class CommunityInitial extends CommunityState {}

class CommunityLoading extends CommunityState {}

class CommunitySuccess extends CommunityState {
  final data;
  CommunitySuccess(this.data);
}

class CommunityFailure extends CommunityState {
  final message;

  CommunityFailure(this.message);
}
