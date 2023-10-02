import 'package:equatable/equatable.dart';

class Meta extends Equatable {
  final int? total;
  final int? perPage;
  final int? currentPage;
  final int? lastPage;

  const Meta({this.total, this.perPage, this.currentPage, this.lastPage});

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        total: json['total'] as int?,
        perPage: json['per_page'] as int?,
        currentPage: json['current_page'] as int?,
        lastPage: json['last_page'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'total': total,
        'per_page': perPage,
        'current_page': currentPage,
        'last_page': lastPage,
      };

  @override
  List<Object?> get props => [total, perPage, currentPage, lastPage];
}
