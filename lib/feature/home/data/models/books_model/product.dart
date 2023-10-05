import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int? id;
  final String? name;
  final String? description;
  final String? price;
  final int? discount;
  final num? priceAfterDiscount;
  final int? stock;
  final int? bestSeller;
  final String? image;
  final String? category;

  const Product({
    this.id,
    this.name,
    this.description,
    this.price,
    this.discount,
    this.priceAfterDiscount,
    this.stock,
    this.bestSeller,
    this.image,
    this.category,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'] as int?,
        name: json['name'] as String?,
        description: json['description'] as String?,
        price: double.parse(json['price']).toString(),
        discount: json['discount'] as int?,
        priceAfterDiscount:
        (double.parse(json['price']) * json['discount'] / 100).toDouble(),
        stock: json['stock'] as int?,
        bestSeller: json['best_seller'] as int?,
        image: json['image'] as String?,
        category: json['category'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'price': price,
        'discount': discount,
        'price_after_discount': priceAfterDiscount,
        'stock': stock,
        'best_seller': bestSeller,
        'image': image,
        'category': category,
      };

  @override
  List<Object?> get props {
    return [
      id,
      name,
      description,
      price,
      discount,
      priceAfterDiscount,
      stock,
      bestSeller,
      image,
      category,
    ];
  }
}
