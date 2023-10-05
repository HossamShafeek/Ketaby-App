import 'package:equatable/equatable.dart';

class User extends Equatable {
	final int? userId;
	final String? userName;

	const User({this.userId, this.userName});

	factory User.fromJson(Map<String, dynamic> json) => User(
				userId: json['user_id'] as int?,
				userName: json['user_name'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'user_id': userId,
				'user_name': userName,
			};

	@override
	List<Object?> get props => [userId, userName];
}
