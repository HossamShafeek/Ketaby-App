import 'package:equatable/equatable.dart';

import 'cart_item.dart';
import 'user.dart';

class Data extends Equatable {
	final int? id;
	final User? user;
	final String? total;
	final List<CartItem>? cartItems;

	const Data({this.id, this.user, this.total, this.cartItems});

	factory Data.fromJson(Map<String, dynamic> json) => Data(
				id: json['id'] as int?,
				user: json['user'] == null
						? null
						: User.fromJson(json['user'] as Map<String, dynamic>),
				total: json['total'].toString(),
				cartItems: (json['cart_items'] as List<dynamic>?)
						?.map((e) => CartItem.fromJson(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'user': user?.toJson(),
				'total': total,
				'cart_items': cartItems?.map((e) => e.toJson()).toList(),
			};

	@override
	List<Object?> get props => [id, user, total, cartItems];
}
