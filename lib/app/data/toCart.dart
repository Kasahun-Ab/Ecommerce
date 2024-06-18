import 'dart:convert';

toCart toCartFromJson(String str) => toCart.fromJson(json.decode(str));

String toCartToJson(toCart data) => json.encode(data.toJson());

class toCart {
  int? isBuyNow;
  int productId;
  int quantity;
  int? selectedConfigurableOption;
  Map<String, int>? superAttribute;
  Map<String, int>? qty;
  List<int>? links;
  Map<String, List<int>>? bundleOptions;
  Map<String, int>? bundleOptionQty;

  toCart({
    this.isBuyNow,
    required this.productId,
    required this.quantity,
    this.selectedConfigurableOption,
    this.superAttribute,
    this.qty,
    this.links,
    this.bundleOptions,
    this.bundleOptionQty,
  });

  factory toCart.fromJson(Map<String, dynamic> json) => toCart(
        isBuyNow: json["is_buy_now"],
        productId: json["product_id"],
        quantity: json["quantity"],
        selectedConfigurableOption: json["selected_configurable_option"],
        superAttribute: Map.from(json["super_attribute"]!)
            .map((k, v) => MapEntry<String, int>(k, v)),
        qty: Map.from(json["qty"]!).map((k, v) => MapEntry<String, int>(k, v)),
        links: json["links"] == null
            ? []
            : List<int>.from(json["links"]!.map((x) => x)),
        bundleOptions: Map.from(json["bundle_options"]!).map((k, v) =>
            MapEntry<String, List<int>>(k, List<int>.from(v.map((x) => x)))),
        bundleOptionQty: Map.from(json["bundle_option_qty"]!)
            .map((k, v) => MapEntry<String, int>(k, v)),
      );

  Map<String, dynamic> toJson() => {
        "is_buy_now": isBuyNow,
        "product_id": productId,
        "quantity": quantity,
        "selected_configurable_option": selectedConfigurableOption,
        "super_attribute": Map.from(superAttribute!)
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
        "qty": Map.from(qty!).map((k, v) => MapEntry<String, dynamic>(k, v)),
        "links": links == null ? [] : List<dynamic>.from(links!.map((x) => x)),
        "bundle_options": Map.from(bundleOptions!).map((k, v) =>
            MapEntry<String, dynamic>(k, List<dynamic>.from(v.map((x) => x)))),
        "bundle_option_qty": Map.from(bundleOptionQty!)
            .map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}
