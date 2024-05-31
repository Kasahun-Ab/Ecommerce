class Product {
  final String id;
  final String name;
  final String brand;
  final List<String> photos;
  final List<String> colors;
  final List<String> sizes;
  final List<Map<String, dynamic>> reviews;
  final double price;
  final String description;
  final String category;
  final String specifications;
  final String materialAndCare;

  Product({
    required this.id,
    required this.name,
    required this.brand,
    required this.photos,
    required this.colors,
    required this.sizes,
    required this.reviews,
    required this.price,
    required this.description,
    required this.category,
    required this.specifications,
    required this.materialAndCare,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json["1"],
      name: json['name'],
      brand: json['brand'],
      photos: List<String>.from(json['photos']),
      colors: List<String>.from(json['colors']),
      sizes: List<String>.from(json['sizes']),
      reviews: List<Map<String, dynamic>>.from(json['reviews']),
      price: json['price'].toDouble(),
      description: json['description'],
      category: json['category'],
      specifications: json['specifications'],
      materialAndCare: json['material_and_care'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'brand': brand,
      'photos': photos,
      'colors': colors,
      'sizes': sizes,
      'reviews': reviews,
      'price': price,
      'description': description,
      'category': category,
      'specifications': specifications,
      'material_and_care': materialAndCare,
    };
  }
}
