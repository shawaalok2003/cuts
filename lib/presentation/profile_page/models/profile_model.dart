// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

/// This class defines the variables used in the [profile_page],
/// and is typically used to hold data that is passed between different parts of the application.
class ProfileModel extends Equatable {
  ProfileModel({
    this.suzaneJobs = "",
    this.email = "",
  }) {}

  String suzaneJobs;

  String email;

  ProfileModel copyWith({
    String? suzaneJobs,
    String? email,
  }) {
    return ProfileModel(
      suzaneJobs: suzaneJobs ?? this.suzaneJobs,
      email: email ?? this.email,
    );
  }

  @override
  List<Object?> get props => [suzaneJobs, email];
}
