import 'package:meta/meta.dart';
import 'dart:convert';

Product ProductFromJson(String str) => Product.fromJson(json.decode(str));

String ProductToJson(Product data) => json.encode(data.toJson());

class Product {
    List<Datum> data;

    Product({
        required this.data,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        data: json["data"] != null ? List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))) : [],
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    int id;
    String sku;
    Type type;
    String name;
    String urlKey;
    String price;
    String formattedPrice;
    String shortDescription;
    String description;
    List<Images> images;
    List<dynamic> videos;
    BaseImage baseImage;
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
    List<dynamic> downloadableSamples;

    Datum({
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
        required this.isBigsale,
        required this.isItemInCart,
        required this.showQuantityChanger,
        required this.downloadableSamples,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"] ?? 0,
        sku: json["sku"] ?? '',
        type: typeValues.map[json["type"]]!,
        name: json["name"] ?? '',
        urlKey: json["url_key"] ?? '',
        price: json["price"] ?? '',
        formattedPrice: json["formatted_price"] ?? '',
        shortDescription: json["short_description"] ?? '',
        description: json["description"] ?? '',
        images: json["images"] != null ? List<Images>.from(json["images"].map((x) => Images.fromJson(x))) : [],
        videos: json["videos"] != null ? List<dynamic>.from(json["videos"].map((x) => x)) : [],
        baseImage: json["base_image"] != null ? BaseImage.fromJson(json["base_image"]) : BaseImage(),
        createdAt: json["created_at"] != null ? DateTime.parse(json["created_at"]) : DateTime.now(),
        updatedAt: json["updated_at"] != null ? DateTime.parse(json["updated_at"]) : DateTime.now(),
        reviews: json["reviews"] != null ? Reviews.fromJson(json["reviews"]) : Reviews(),
        inStock: json["in_stock"] ?? false,
        isSaved: json["is_saved"] ?? false,
        isNew: json["is_new"] ?? false,
        isFeatured: json["is_featured"] ?? false,
        isBigsale: json["is_bigsale"] ?? false,
        isItemInCart: json["is_item_in_cart"] ?? false,
        showQuantityChanger: json["show_quantity_changer"] ?? false,
        downloadableSamples: json["downloadable_samples"] != null ? List<dynamic>.from(json["downloadable_samples"].map((x) => x)) : [],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "sku": sku,
        "type": typeValues.reverse[type],
        "name": name,
        "url_key": urlKey,
        "price": price,
        "formatted_price": formattedPrice,
        "short_description": shortDescription,
        "description": description,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "videos": List<dynamic>.from(videos.map((x) => x)),
        "base_image": baseImage.toJson(),
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
        "downloadable_samples": List<dynamic>.from(downloadableSamples.map((x) => x)),
    };
}

class BaseImage {
    String smallImageUrl;
    String mediumImageUrl;
    String largeImageUrl;
    String originalImageUrl;

    BaseImage({
        this.smallImageUrl = '',
        this.mediumImageUrl = '',
        this.largeImageUrl = '',
        this.originalImageUrl = '',
    });

    factory BaseImage.fromJson(Map<String, dynamic> json) => BaseImage(
        smallImageUrl: json["small_image_url"] ?? '',
        mediumImageUrl: json["medium_image_url"] ?? '',
        largeImageUrl: json["large_image_url"] ?? '',
        originalImageUrl: json["original_image_url"] ?? '',
    );

    Map<String, dynamic> toJson() => {
        "small_image_url": smallImageUrl,
        "medium_image_url": mediumImageUrl,
        "large_image_url": largeImageUrl,
        "original_image_url": originalImageUrl,
    };
}

class Images {
    int id;
    String path;
    String url;
    String originalImageUrl;
    String smallImageUrl;
    String mediumImageUrl;
    String largeImageUrl;

    Images({
        required this.id,
        required this.path,
        required this.url,
        required this.originalImageUrl,
        required this.smallImageUrl,
        required this.mediumImageUrl,
        required this.largeImageUrl,
    });

    factory Images.fromJson(Map<String, dynamic> json) => Images(
        id: json["id"] ?? 0,
        path: json["path"] ?? '',
        url: json["url"] ?? '',
        originalImageUrl: json["original_image_url"] ?? '',
        smallImageUrl: json["small_image_url"] ?? '',
        mediumImageUrl: json["medium_image_url"] ?? '',
        largeImageUrl: json["large_image_url"] ?? '',
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "path": path,
        "url": url,
        "original_image_url": originalImageUrl,
        "small_image_url": smallImageUrl,
        "medium_image_url": mediumImageUrl,
        "large_image_url": largeImageUrl,
    };
}

class Reviews {
    int total;
    int totalRating;
    int averageRating;
    List<dynamic> percentage;

    Reviews({
        this.total = 0,
        this.totalRating = 0,
        this.averageRating = 0,
        this.percentage = const [],
    });

    factory Reviews.fromJson(Map<String, dynamic> json) => Reviews(
        total: json["total"] ?? 0,
        totalRating: json["total_rating"] ?? 0,
        averageRating: json["average_rating"] ?? 0,
        percentage: json["percentage"] != null ? List<dynamic>.from(json["percentage"].map((x) => x)) : [],
    );

    Map<String, dynamic> toJson() => {
        "total": total,
        "total_rating": totalRating,
        "average_rating": averageRating,
        "percentage": List<dynamic>.from(percentage.map((x) => x)),
    };
}

enum Type {
    DOWNLOADABLE,
    SIMPLE,
    VIRTUAL
}

final typeValues = EnumValues({
    "downloadable": Type.DOWNLOADABLE,
    "simple": Type.SIMPLE,
    "virtual": Type.VIRTUAL
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
