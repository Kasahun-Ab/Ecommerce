// File path: lib/models/category.dart
class Categories {
  final int id;
  final String name;
  final String slug;
  final String displayMode;
  final String description;
  final String status;
 
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
      status: json['status'] ?? '',
   
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
  final String categoryId;
  final String name;
  final String slug;
  final String urlPath;
  final String description;
  final String localeId;
  final String locale;

  Translation({
    required this.id,
    required this.categoryId,
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
      categoryId: json['category_id'] ?? '',
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
      urlPath: json['url_path'] ?? '',
      description: json['description'] ?? '',
      localeId: json['locale_id'] ?? '',
      locale: json['locale'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'category_id': categoryId,
      'name': name,
      'slug': slug,
      'url_path': urlPath,
      'description': description,
      'locale_id': localeId,
      'locale': locale,
    };
  }
}
