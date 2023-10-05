import 'package:equatable/equatable.dart';

class CartItem extends Equatable {
	final int? itemId;
	final int? itemProductId;
	final String? itemProductName;
	final String? itemProductImage;
	final String? itemProductPrice;
	final num? itemProductDiscount;
	final num? itemProductPriceAfterDiscount;
	final int? itemProductStock;
	final int? itemQuantity;
	final double? itemTotal;

	const CartItem({
		this.itemId, 
		this.itemProductId, 
		this.itemProductName, 
		this.itemProductImage, 
		this.itemProductPrice, 
		this.itemProductDiscount, 
		this.itemProductPriceAfterDiscount, 
		this.itemProductStock, 
		this.itemQuantity, 
		this.itemTotal, 
	});

	factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
				itemId: json['item_id'] as int?,
				itemProductId: json['item_product_id'] as int?,
				itemProductName: json['item_product_name'] as String?,
				itemProductImage: json['item_product_image'] as String?,
				itemProductPrice: double.parse(json['item_product_price']).toString(),
				itemProductDiscount: json['item_product_discount'] as int?,
				itemProductPriceAfterDiscount: (json['item_product_price_after_discount'] as num?)?.toDouble(),
				itemProductStock: json['item_product_stock'] as int?,
				itemQuantity: json['item_quantity'] as int?,
				itemTotal: (json['item_total'] as num?)?.toDouble(),
			);

	Map<String, dynamic> toJson() => {
				'item_id': itemId,
				'item_product_id': itemProductId,
				'item_product_name': itemProductName,
				'item_product_image': itemProductImage,
				'item_product_price': itemProductPrice,
				'item_product_discount': itemProductDiscount,
				'item_product_price_after_discount': itemProductPriceAfterDiscount,
				'item_product_stock': itemProductStock,
				'item_quantity': itemQuantity,
				'item_total': itemTotal,
			};

	@override
	List<Object?> get props {
		return [
				itemId,
				itemProductId,
				itemProductName,
				itemProductImage,
				itemProductPrice,
				itemProductDiscount,
				itemProductPriceAfterDiscount,
				itemProductStock,
				itemQuantity,
				itemTotal,
		];
	}
}
