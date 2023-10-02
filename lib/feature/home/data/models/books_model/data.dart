import 'package:equatable/equatable.dart';

import 'links.dart';
import 'meta.dart';
import 'product.dart';

class Data extends Equatable {
  final List<Product>? products;
  final Meta? meta;
  final Links? links;

  const Data({this.products, this.meta, this.links});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        products: (json['products'] as List<dynamic>?)
            ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
            .toList(),
        meta: json['meta'] == null
            ? null
            : Meta.fromJson(json['meta'] as Map<String, dynamic>),
        links: json['links'] == null
            ? null
            : Links.fromJson(json['links'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'products': products?.map((e) => e.toJson()).toList(),
        'meta': meta?.toJson(),
        'links': links?.toJson(),
      };

  @override
  List<Object?> get props => [products, meta, links];
}
