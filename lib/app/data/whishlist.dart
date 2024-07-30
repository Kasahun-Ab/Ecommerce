// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Wishlist WishlistFromJson(String str) => Wishlist.fromJson(json.decode(str));

String WishlistToJson(Wishlist data) => json.encode(data.toJson());

class Wishlist {
  List<Datum> data;

  Wishlist({
    required this.data,
  });

  factory Wishlist.fromJson(Map<String, dynamic> json) => Wishlist(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  int id;
  Product product;
  DateTime createdAt;
  DateTime updatedAt;

  Datum({
    required this.id,
    required this.product,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        product: Product.fromJson(json["product"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product": product.toJson(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
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
  List<image> images;
  List<dynamic> videos;
  Baseimage baseimage;
  DateTime createdAt;
  DateTime updatedAt;
  Reviews reviews;
  bool inStock;
  bool isSaved;
  bool isNew;
  bool isFeatured;
  bool isBigsale;
  bool isItemInCart;
  bool showQuantityChanger;
  String? specialPrice;
  String? formattedSpecialPrice;
  dynamic regularPrice;
  dynamic formattedRegularPrice;

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
    required this.baseimage,
    required this.createdAt,
    required this.updatedAt,
    required this.reviews,
    required this.inStock,
    required this.isSaved,
    required this.isNew,
    required this.isFeatured,
    required this.isBigsale,
    required this.isItemInCart,
    required this.showQuantityChanger,
    this.specialPrice,
    this.formattedSpecialPrice,
    this.regularPrice,
    this.formattedRegularPrice,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        sku: json["sku"],
        type: json["type"],
        name: json["name"],
        urlKey: json["url_key"],
        price: json["price"],
        formattedPrice: json["formatted_price"],
        shortDescription: json["short_description"],
        description: json["description"],
        images: List<image>.from(json["images"].map((x) => image.fromJson(x))),
        videos: List<dynamic>.from(json["videos"].map((x) => x)),
        baseimage: Baseimage.fromJson(json["base_image"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        reviews: Reviews.fromJson(json["reviews"]),
        inStock: json["in_stock"],
        isSaved: json["is_saved"],
        isNew: json["is_new"],
        isFeatured: json["is_featured"],
        isBigsale: json["is_bigsale"],
        isItemInCart: json["is_item_in_cart"],
        showQuantityChanger: json["show_quantity_changer"],
        specialPrice: json["special_price"],
        formattedSpecialPrice: json["formatted_special_price"],
        regularPrice: json["regular_price"],
        formattedRegularPrice: json["formatted_regular_price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "sku": sku,
        "type": type,
        "name": name,
        "url_key": urlKey,
        "price": price,
        "formatted_price": formattedPrice,
        "short_description": shortDescription,
        "description": description,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "videos": List<dynamic>.from(videos.map((x) => x)),
        "base_image": baseimage.toJson(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "reviews": reviews.toJson(),
        "in_stock": inStock,
        "is_saved": isSaved,
        "is_new": isNew,
        "is_featured": isFeatured,
        "is_bigsale": isBigsale,
        "is_item_in_cart": isItemInCart,
        "show_quantity_changer": showQuantityChanger,
        "special_price": specialPrice,
        "formatted_special_price": formattedSpecialPrice,
        "regular_price": regularPrice,
        "formatted_regular_price": formattedRegularPrice,
      };
}

class Baseimage {
  String? smallimageUrl;
  String? mediumimageUrl;
  String? largeimageUrl;
  String? originalimageUrl;

  Baseimage({
    required this.smallimageUrl,
    required this.mediumimageUrl,
    required this.largeimageUrl,
    required this.originalimageUrl,
  });

  factory Baseimage.fromJson(Map<String, dynamic> json) => Baseimage(
        smallimageUrl: json["small_image_url"],
        mediumimageUrl: json["medium_image_url"],
        largeimageUrl: json["large_image_url"],
        originalimageUrl: json["original_image_url"],
      );

  Map<String, dynamic> toJson() => {
        "small_image_url": smallimageUrl,
        "medium_image_url": mediumimageUrl,
        "large_image_url": largeimageUrl,
        "original_image_url": originalimageUrl,
      };
}

class image {
  int id;
  String path;
  String url;
  String originalimageUrl;
  String smallimageUrl;
  String mediumimageUrl;
  String largeimageUrl;

  image({
    required this.id,
    required this.path,
    required this.url,
    required this.originalimageUrl,
    required this.smallimageUrl,
    required this.mediumimageUrl,
    required this.largeimageUrl,
  });

  factory image.fromJson(Map<String, dynamic> json) => image(
        id: json["id"],
        path: json["path"],
        url: json["url"],
        originalimageUrl: json["original_image_url"],
        smallimageUrl: json["small_image_url"],
        mediumimageUrl: json["medium_image_url"],
        largeimageUrl: json["large_image_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "path": path,
        "url": url,
        "original_image_url": originalimageUrl,
        "small_image_url": smallimageUrl,
        "medium_image_url": mediumimageUrl,
        "large_image_url": largeimageUrl,
      };
}

class Reviews {
  int total;
  int totalRating;
  int averageRating;
  List<dynamic> percentage;

  Reviews({
    required this.total,
    required this.totalRating,
    required this.averageRating,
    required this.percentage,
  });

  factory Reviews.fromJson(Map<String, dynamic> json) => Reviews(
        total: json["total"],
        totalRating: json["total_rating"],
        averageRating: json["average_rating"],
        percentage: List<dynamic>.from(json["percentage"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "total_rating": totalRating,
        "average_rating": averageRating,
        "percentage": List<dynamic>.from(percentage.map((x) => x)),
      };
}
