class Product {
  final int id;
  final String sku;
  final String type;
  final String name;
  final String urlKey;
  final String price;
  final String formattedPrice;
  final String shortDescription;
  final String description;
  final List<dynamic>? images;
  final List<dynamic>? videos;
  final Map<String, dynamic>? baseImage;
  final Map<String, dynamic>? reviews;
  final bool inStock;
  final bool isSaved;
  final bool isNew;
  final bool isFeatured;
  final bool isBigsale;
  final bool isItemInCart;
  final bool showQuantityChanger;
  final List<dynamic>? downloadableLinks;
  final List<dynamic>? downloadableSamples;

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
    this.images,
    this.videos,
    this.baseImage,
    this.reviews,
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
      images: json['images'],
      videos: json['videos'],
      baseImage: json['base_image'],
      reviews: json['reviews'],
      inStock: json['in_stock'] ?? false,
      isSaved: json['is_saved'] ?? false,
      isNew: json['is_new'] ?? false,
      isFeatured: json['is_featured'] ?? false,
      isBigsale: json['is_bigsale'] ?? false,
      isItemInCart: json['is_item_in_cart'] ?? false,
      showQuantityChanger: json['show_quantity_changer'] ?? false,
      downloadableLinks: json['downloadable_links'],
      downloadableSamples: json['downloadable_samples'],
    );
  }
}
