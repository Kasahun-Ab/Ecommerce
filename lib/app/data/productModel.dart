import 'dart:convert';

class Image {
  int id;
  String path;
  String url;
  String originalImageUrl;
  String smallImageUrl;
  String mediumImageUrl;
  String largeImageUrl;

  Image({
    required this.id,
    required this.path,
    required this.url,
    required this.originalImageUrl,
    required this.smallImageUrl,
    required this.mediumImageUrl,
    required this.largeImageUrl,
  });

  factory Image.fromJson(Map<String, dynamic> json) {
    return Image(
      id: json['id'] ?? 0,
      path: json['path'] ?? '',
      url: json['url'] ?? '',
      originalImageUrl: json['original_image_url'] ?? '',
      smallImageUrl: json['small_image_url'] ?? '',
      mediumImageUrl: json['medium_image_url'] ?? '',
      largeImageUrl: json['large_image_url'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'path': path,
      'url': url,
      'original_image_url': originalImageUrl,
      'small_image_url': smallImageUrl,
      'medium_image_url': mediumImageUrl,
      'large_image_url': largeImageUrl,
    };
  }
}

class BaseImage {
  String smallImageUrl;
  String mediumImageUrl;
  String largeImageUrl;
  String originalImageUrl;

  BaseImage({
    required this.smallImageUrl,
    required this.mediumImageUrl,
    required this.largeImageUrl,
    required this.originalImageUrl,
  });

  factory BaseImage.fromJson(Map<String, dynamic> json) {
    return BaseImage(
      smallImageUrl: json['small_image_url'] ?? '',
      mediumImageUrl: json['medium_image_url'] ?? '',
      largeImageUrl: json['large_image_url'] ?? '',
      originalImageUrl: json['original_image_url'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'small_image_url': smallImageUrl,
      'medium_image_url': mediumImageUrl,
      'large_image_url': largeImageUrl,
      'original_image_url': originalImageUrl,
    };
  }
}

class Review {
  int total;
  double totalRating;
  double averageRating;
  List<double> percentage;

  Review({
    required this.total,
    required this.totalRating,
    required this.averageRating,
    required this.percentage,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      total: json['total'] ?? 0,
      totalRating: (json['total_rating'] ?? 0).toDouble(),
      averageRating: (json['average_rating'] ?? 0).toDouble(),
      percentage: List<double>.from((json['percentage'] ?? []).map((x) => x.toDouble())),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'total': total,
      'total_rating': totalRating,
      'average_rating': averageRating,
      'percentage': percentage,
    };
  }
}

class Product {
  int id;
  String sku;
  String type;
  String name;
  String urlKey;
  String price;
  String formattedPrice;
  String shortDescription;
  String description;
  List<Image> images;
  List<String> videos;
  BaseImage baseImage;
  String createdAt;
  String updatedAt;
  Review reviews;
  bool inStock;
  bool isSaved;
  bool isNew;
  bool isFeatured;
  bool isBigSale;
  bool isItemInCart;
  bool showQuantityChanger;
  String? specialPrice;
  String? formattedSpecialPrice;
  String? regularPrice;
  String? formattedRegularPrice;

  Product({
    required this.id,
    required this.sku,
    required this.type,
    required this.name,
    required this.urlKey,
    required this.price,
    required this.formattedPrice,
    required this.shortDescription,
    required this.description,
    required this.images,
    required this.videos,
    required this.baseImage,
    required this.createdAt,
    required this.updatedAt,
    required this.reviews,
    required this.inStock,
    required this.isSaved,
    required this.isNew,
    required this.isFeatured,
    required this.isBigSale,
    required this.isItemInCart,
    required this.showQuantityChanger,
    this.specialPrice,
    this.formattedSpecialPrice,
    this.regularPrice,
    this.formattedRegularPrice,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? 0,
      sku: json['sku'] ?? '',
      type: json['type'] ?? '',
      name: json['name'] ?? '',
      urlKey: json['url_key'] ?? '',
      price: json['price'] ?? '',
      formattedPrice: json['formatted_price'] ?? '',
      shortDescription: json['short_description'] ?? '',
      description: json['description'] ?? '',
      images: List<Image>.from((json['images'] ?? []).map((x) => Image.fromJson(x))),
      videos: List<String>.from(json['videos'] ?? []),
      baseImage: BaseImage.fromJson(json['base_image'] ?? {}),
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      reviews: Review.fromJson(json['reviews'] ?? {}),
      inStock: json['in_stock'] ?? false,
      isSaved: json['is_saved'] ?? false,
      isNew: json['is_new'] ?? false,
      isFeatured: json['is_featured'] ?? false,
      isBigSale: json['is_bigsale'] ?? false,
      isItemInCart: json['is_item_in_cart'] ?? false,
      showQuantityChanger: json['show_quantity_changer'] ?? false,
      specialPrice: json['special_price'],
      formattedSpecialPrice: json['formatted_special_price'],
      regularPrice: json['regular_price'],
      formattedRegularPrice: json['formatted_regular_price'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sku': sku,
      'type': type,
      'name': name,
      'url_key': urlKey,
      'price': price,
      'formatted_price': formattedPrice,
      'short_description': shortDescription,
      'description': description,
      'images': List<dynamic>.from(images.map((x) => x.toJson())),
      'videos': List<dynamic>.from(videos.map((x) => x)),
      'base_image': baseImage.toJson(),
      'created_at': createdAt,
      'updated_at': updatedAt,
      'reviews': reviews.toJson(),
      'in_stock': inStock,
      'is_saved': isSaved,
      'is_new': isNew,
      'is_featured': isFeatured,
      'is_bigsale': isBigSale,
      'is_item_in_cart': isItemInCart,
      'show_quantity_changer': showQuantityChanger,
      'special_price': specialPrice,
      'formatted_special_price': formattedSpecialPrice,
      'regular_price': regularPrice,
      'formatted_regular_price': formattedRegularPrice,
    };
  }
}

class ProductResponse {
  List<Product> data;

  ProductResponse({
    required this.data,
  });

  factory ProductResponse.fromJson(Map<String, dynamic> json) {
    return ProductResponse(
      data: List<Product>.from((json['data'] ?? []).map((x) => Product.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': List<dynamic>.from(data.map((x) => x.toJson())),
    };
  }
}
