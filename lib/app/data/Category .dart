// File path: lib/models/category.dart

class Categories {
  final int id;
  final String name;
  final String slug;
  final String displayMode;
  final String description;
  final int status;
  final List<Translation> translations;

  Categories({
    required this.id,
    required this.name,
    required this.slug,
    required this.displayMode,
    required this.description,
    required this.status,
    required this.translations,
  });

  factory Categories.fromJson(Map<String, dynamic> json) {
    var translationsList = json['translations'] as List;
    List<Translation> translations = translationsList.map((i) => Translation.fromJson(i)).toList();
    return Categories(
      id: json['id'],
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
      displayMode: json['display_mode'] ?? '',
      description: json['description'] ?? '',
      status: json['status'] ?? 0,
      translations: translations,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'slug': slug,
      'display_mode': displayMode,
      'description': description,
      'status': status,
      'translations': translations.map((v) => v.toJson()).toList(),
    };
  }
}

class Translation {
  final int id;
  final int categoryId;  // Changed from String to int
  final String name;
  final String slug;
  final String urlPath;
  final String description;
  final int localeId;
  final String locale;

  Translation({
    required this.id,
    required this.categoryId,  // Changed from String to int
    required this.name,
    required this.slug,
    required this.urlPath,
    required this.description,
    required this.localeId,
    required this.locale,
  });

  factory Translation.fromJson(Map<String, dynamic> json) {
    return Translation(
      id: json['id'],
      categoryId: json['category_id'] ?? 0,  // Changed from String to int
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
      urlPath: json['url_path'] ?? '',
      description: json['description'] ?? '',
      localeId: json['locale_id'] ?? 0,
      locale: json['locale'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'category_id': categoryId,  // Changed from String to int
      'name': name,
      'slug': slug,
      'url_path': urlPath,
      'description': description,
      'locale_id': localeId,
      'locale': locale,
    };
  }
}
