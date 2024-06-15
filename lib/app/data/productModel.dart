// To parse this JSON data, do
//
//     final Product = ProductFromJson(jsonString);

import 'dart:convert';

Product ProductFromJson(String str) => Product.fromJson(json.decode(str));

String ProductToJson(Product data) => json.encode(data.toJson());

class Product {
    List<Datum> data;
  

    Product({
        required this.data,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        // "links": links.toJson(),
        // "meta": meta.toJson(),
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
    List<dynamic> images;
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
    List<DownloadableLink>? downloadableLinks;
    List<dynamic>? downloadableSamples;

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
        this.downloadableLinks,
        this.downloadableSamples,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        sku: json["sku"],
        type: typeValues.map[json["type"]]!,
        name: json["name"],
        urlKey: json["url_key"],
        price: json["price"],
        formattedPrice: json["formatted_price"],
        shortDescription: json["short_description"],
        description: json["description"],
        images: List<dynamic>.from(json["images"].map((x) => x)),
        videos: List<dynamic>.from(json["videos"].map((x) => x)),
        baseImage: BaseImage.fromJson(json["base_image"]),
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
        downloadableLinks: json["downloadable_links"] == null ? [] : List<DownloadableLink>.from(json["downloadable_links"]!.map((x) => DownloadableLink.fromJson(x))),
        downloadableSamples: json["downloadable_samples"] == null ? [] : List<dynamic>.from(json["downloadable_samples"]!.map((x) => x)),
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
        "images": List<dynamic>.from(images.map((x) => x)),
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
        "downloadable_links": downloadableLinks == null ? [] : List<dynamic>.from(downloadableLinks!.map((x) => x.toJson())),
        "downloadable_samples": downloadableSamples == null ? [] : List<dynamic>.from(downloadableSamples!.map((x) => x)),
    };
}

class BaseImage {
    dynamic smallImageUrl;
    dynamic mediumImageUrl;
    dynamic largeImageUrl;
    dynamic originalImageUrl;

    BaseImage({
        required this.smallImageUrl,
        required this.mediumImageUrl,
        required this.largeImageUrl,
        required this.originalImageUrl,
    });

    factory BaseImage.fromJson(Map<String, dynamic> json) => BaseImage(
        smallImageUrl: json["small_image_url"],
        mediumImageUrl: json["medium_image_url"],
        largeImageUrl: json["large_image_url"],
        originalImageUrl: json["original_image_url"],
    );

    Map<String, dynamic> toJson() => {
        "small_image_url": smallImageUrl,
        "medium_image_url": mediumImageUrl,
        "large_image_url": largeImageUrl,
        "original_image_url": originalImageUrl,
    };
}

class DownloadableLink {
    int id;
    String productId;
    String url;
    String file;
    String fileName;
    String type;
    String price;
    dynamic sampleUrl;
    dynamic sampleFile;
    dynamic sampleFileName;
    dynamic sampleType;
    String downloads;
    dynamic sortOrder;
    DateTime createdAt;
    DateTime updatedAt;
    String title;
    List<Translation> translations;
    String fileUrl;
    dynamic sampleFileUrl;

    DownloadableLink({
        required this.id,
        required this.productId,
        required this.url,
        required this.file,
        required this.fileName,
        required this.type,
        required this.price,
        required this.sampleUrl,
        required this.sampleFile,
        required this.sampleFileName,
        required this.sampleType,
        required this.downloads,
        required this.sortOrder,
        required this.createdAt,
        required this.updatedAt,
        required this.title,
        required this.translations,
        required this.fileUrl,
        required this.sampleFileUrl,
    });

    factory DownloadableLink.fromJson(Map<String, dynamic> json) => DownloadableLink(
        id: json["id"],
        productId: json["product_id"],
        url: json["url"],
        file: json["file"],
        fileName: json["file_name"],
        type: json["type"],
        price: json["price"],
        sampleUrl: json["sample_url"],
        sampleFile: json["sample_file"],
        sampleFileName: json["sample_file_name"],
        sampleType: json["sample_type"],
        downloads: json["downloads"],
        sortOrder: json["sort_order"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        title: json["title"],
        translations: List<Translation>.from(json["translations"].map((x) => Translation.fromJson(x))),
        fileUrl: json["file_url"],
        sampleFileUrl: json["sample_file_url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "product_id": productId,
        "url": url,
        "file": file,
        "file_name": fileName,
        "type": type,
        "price": price,
        "sample_url": sampleUrl,
        "sample_file": sampleFile,
        "sample_file_name": sampleFileName,
        "sample_type": sampleType,
        "downloads": downloads,
        "sort_order": sortOrder,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "title": title,
        "translations": List<dynamic>.from(translations.map((x) => x.toJson())),
        "file_url": fileUrl,
        "sample_file_url": sampleFileUrl,
    };
}

class Translation {
    int id;
    String productDownloadableLinkId;
    String locale;
    String title;

    Translation({
        required this.id,
        required this.productDownloadableLinkId,
        required this.locale,
        required this.title,
    });

    factory Translation.fromJson(Map<String, dynamic> json) => Translation(
        id: json["id"],
        productDownloadableLinkId: json["product_downloadable_link_id"],
        locale: json["locale"],
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "product_downloadable_link_id": productDownloadableLinkId,
        "locale": locale,
        "title": title,
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

class Links {
    String first;
    String last;
    dynamic prev;
    String next;

    Links({
        required this.first,
        required this.last,
        required this.prev,
        required this.next,
    });

    factory Links.fromJson(Map<String, dynamic> json) => Links(
        first: json["first"],
        last: json["last"],
        prev: json["prev"],
        next: json["next"],
    );

    Map<String, dynamic> toJson() => {
        "first": first,
        "last": last,
        "prev": prev,
        "next": next,
    };
}

class Meta {
    int currentPage;
    int from;
    int lastPage;
    List<Link> links;
    String path;
    int perPage;
    int to;
    int total;

    Meta({
        required this.currentPage,
        required this.from,
        required this.lastPage,
        required this.links,
        required this.path,
        required this.perPage,
        required this.to,
        required this.total,
    });

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        currentPage: json["current_page"],
        from: json["from"],
        lastPage: json["last_page"],
        links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
        path: json["path"],
        perPage: json["per_page"],
        to: json["to"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "current_page": currentPage,
        "from": from,
        "last_page": lastPage,
        "links": List<dynamic>.from(links.map((x) => x.toJson())),
        "path": path,
        "per_page": perPage,
        "to": to,
        "total": total,
    };
}

class Link {
    String? url;
    String label;
    bool active;

    Link({
        required this.url,
        required this.label,
        required this.active,
    });

    factory Link.fromJson(Map<String, dynamic> json) => Link(
        url: json["url"],
        label: json["label"],
        active: json["active"],
    );

    Map<String, dynamic> toJson() => {
        "url": url,
        "label": label,
        "active": active,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
