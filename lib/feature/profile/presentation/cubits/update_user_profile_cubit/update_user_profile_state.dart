import 'package:ketaby/feature/profile/data/model/profile_model.dart';

abstract class UpdateUserProfileState {}

class UpdateUserProfileInitialState extends UpdateUserProfileState {}

class UpdateUserProfileLoadingState extends UpdateUserProfileState {}

class UpdateUserProfileSuccessState extends UpdateUserProfileState {
  final ProfileModel profileModel;

  UpdateUserProfileSuccessState(this.profileModel);
}

class UpdateUserProfileFailureState extends UpdateUserProfileState {
  final String error;

  UpdateUserProfileFailureState(this.error);
}
