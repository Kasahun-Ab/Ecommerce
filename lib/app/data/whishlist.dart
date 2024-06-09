// lib/models/data_model.dart
class whishlistmodel {
  final String id;
  final String userId;
  final String productId;

  whishlistmodel(
      {required this.id, required this.userId, required this.productId});
  factory whishlistmodel.fromJson(Map<String, dynamic> json) {
    return whishlistmodel(
      id: json['id'] ?? '', // If json['id'] is null, assign an empty string
      userId: json['user_id'] ??
          '', // If json['user_id'] is null, assign an empty string
      productId: json['product_id'] ??
          '', // If json['product_id'] is null, assign an empty string
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'product_id': productId,
    };
  }
}
