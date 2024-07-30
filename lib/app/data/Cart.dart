// import 'dart:convert';

// Cart cartFromJson(String str) => Cart.fromJson(json.decode(str));

// String cartToJson(Cart data) => json.encode(data.toJson());

// class Cart {
//     Data data;

//     Cart({
//         required this.data,
//     });

//     factory Cart.fromJson(Map<String, dynamic> json) => Cart(
//         data: Data.fromJson(json["data"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "data": data.toJson(),
//     };
// }

// class Data {
//     int id;
//     String customerEmail;
//     String customerFirstName;
//     String customerLastName;
//     dynamic shippingMethod;
//     dynamic couponCode;
//     int isGift;
//     int itemsCount;
//     int itemsQty;
//     dynamic exchangeRate;
//     String globalCurrencyCode;
//     String baseCurrencyCode;
//     String channelCurrencyCode;
//     String cartCurrencyCode;
//     double grandTotal;
//     String formattedGrandTotal;
//     double baseGrandTotal;
//     String formattedBaseGrandTotal;
//     double subTotal;
//     String formattedSubTotal;
//     double baseSubTotal;
//     String formattedBaseSubTotal;
//     int taxTotal;
//     String formattedTaxTotal;
//     int baseTaxTotal;
//     String formattedBaseTaxTotal;
//     int discount;
//     String formattedDiscount;
//     int baseDiscount;
//     String formattedBaseDiscount;
//     dynamic checkoutMethod;
//     int isGuest;
//     int isActive;
//     dynamic conversionTime;
//     dynamic customer;
//     dynamic channel;
//     List<Item> items;
//     dynamic selectedShippingRate;
//     dynamic payment;
//     dynamic billingAddress;
//     dynamic shippingAddress;
//     DateTime createdAt;
//     DateTime updatedAt;
//     String taxes;
//     String formattedTaxes;
//     String baseTaxes;
//     String formattedBaseTaxes;
//     String formattedDiscountedSubTotal;
//     String formattedBaseDiscountedSubTotal;

//     Data({
//         required this.id,
//         required this.customerEmail,
//         required this.customerFirstName,
//         required this.customerLastName,
//         required this.shippingMethod,
//         required this.couponCode,
//         required this.isGift,
//         required this.itemsCount,
//         required this.itemsQty,
//         required this.exchangeRate,
//         required this.globalCurrencyCode,
//         required this.baseCurrencyCode,
//         required this.channelCurrencyCode,
//         required this.cartCurrencyCode,
//         required this.grandTotal,
//         required this.formattedGrandTotal,
//         required this.baseGrandTotal,
//         required this.formattedBaseGrandTotal,
//         required this.subTotal,
//         required this.formattedSubTotal,
//         required this.baseSubTotal,
//         required this.formattedBaseSubTotal,
//         required this.taxTotal,
//         required this.formattedTaxTotal,
//         required this.baseTaxTotal,
//         required this.formattedBaseTaxTotal,
//         required this.discount,
//         required this.formattedDiscount,
//         required this.baseDiscount,
//         required this.formattedBaseDiscount,
//         required this.checkoutMethod,
//         required this.isGuest,
//         required this.isActive,
//         required this.conversionTime,
//         required this.customer,
//         required this.channel,
//         required this.items,
//         required this.selectedShippingRate,
//         required this.payment,
//         required this.billingAddress,
//         required this.shippingAddress,
//         required this.createdAt,
//         required this.updatedAt,
//         required this.taxes,
//         required this.formattedTaxes,
//         required this.baseTaxes,
//         required this.formattedBaseTaxes,
//         required this.formattedDiscountedSubTotal,
//         required this.formattedBaseDiscountedSubTotal,
//     });

//     factory Data.fromJson(Map<String, dynamic> json) => Data(
//         id: json["id"],
//         customerEmail: json["customer_email"],
//         customerFirstName: json["customer_first_name"],
//         customerLastName: json["customer_last_name"],
//         shippingMethod: json["shipping_method"],
//         couponCode: json["coupon_code"],
//         isGift: json["is_gift"],
//         itemsCount: json["items_count"],
//         itemsQty: json["items_qty"],
//         exchangeRate: json["exchange_rate"],
//         globalCurrencyCode: json["global_currency_code"],
//         baseCurrencyCode: json["base_currency_code"],
//         channelCurrencyCode: json["channel_currency_code"],
//         cartCurrencyCode: json["cart_currency_code"],
//         grandTotal: json["grand_total"]?.toDouble(),
//         formattedGrandTotal: json["formatted_grand_total"],
//         baseGrandTotal: json["base_grand_total"]?.toDouble(),
//         formattedBaseGrandTotal: json["formatted_base_grand_total"],
//         subTotal: json["sub_total"]?.toDouble(),
//         formattedSubTotal: json["formatted_sub_total"],
//         baseSubTotal: json["base_sub_total"]?.toDouble(),
//         formattedBaseSubTotal: json["formatted_base_sub_total"],
//         taxTotal: json["tax_total"],
//         formattedTaxTotal: json["formatted_tax_total"],
//         baseTaxTotal: json["base_tax_total"],
//         formattedBaseTaxTotal: json["formatted_base_tax_total"],
//         discount: json["discount"],
//         formattedDiscount: json["formatted_discount"],
//         baseDiscount: json["base_discount"],
//         formattedBaseDiscount: json["formatted_base_discount"],
//         checkoutMethod: json["checkout_method"],
//         isGuest: json["is_guest"],
//         isActive: json["is_active"],
//         conversionTime: json["conversion_time"],
//         customer: json["customer"],
//         channel: json["channel"],
//         items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
//         selectedShippingRate: json["selected_shipping_rate"],
//         payment: json["payment"],
//         billingAddress: json["billing_address"],
//         shippingAddress: json["shipping_address"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//         taxes: json["taxes"],
//         formattedTaxes: json["formatted_taxes"],
//         baseTaxes: json["base_taxes"],
//         formattedBaseTaxes: json["formatted_base_taxes"],
//         formattedDiscountedSubTotal: json["formatted_discounted_sub_total"],
//         formattedBaseDiscountedSubTotal: json["formatted_base_discounted_sub_total"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "customer_email": customerEmail,
//         "customer_first_name": customerFirstName,
//         "customer_last_name": customerLastName,
//         "shipping_method": shippingMethod,
//         "coupon_code": couponCode,
//         "is_gift": isGift,
//         "items_count": itemsCount,
//         "items_qty": itemsQty,
//         "exchange_rate": exchangeRate,
//         "global_currency_code": globalCurrencyCode,
//         "base_currency_code": baseCurrencyCode,
//         "channel_currency_code": channelCurrencyCode,
//         "cart_currency_code": cartCurrencyCode,
//         "grand_total": grandTotal,
//         "formatted_grand_total": formattedGrandTotal,
//         "base_grand_total": baseGrandTotal,
//         "formatted_base_grand_total": formattedBaseGrandTotal,
//         "sub_total": subTotal,
//         "formatted_sub_total": formattedSubTotal,
//         "base_sub_total": baseSubTotal,
//         "formatted_base_sub_total": formattedBaseSubTotal,
//         "tax_total": taxTotal,
//         "formatted_tax_total": formattedTaxTotal,
//         "base_tax_total": baseTaxTotal,
//         "formatted_base_tax_total": formattedBaseTaxTotal,
//         "discount": discount,
//         "formatted_discount": formattedDiscount,
//         "base_discount": baseDiscount,
//         "formatted_base_discount": formattedBaseDiscount,
//         "checkout_method": checkoutMethod,
//         "is_guest": isGuest,
//         "is_active": isActive,
//         "conversion_time": conversionTime,
//         "customer": customer,
//         "channel": channel,
//         "items": List<dynamic>.from(items.map((x) => x.toJson())),
//         "selected_shipping_rate": selectedShippingRate,
//         "payment": payment,
//         "billing_address": billingAddress,
//         "shipping_address": shippingAddress,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//         "taxes": taxes,
//         "formatted_taxes": formattedTaxes,
//         "base_taxes": baseTaxes,
//         "formatted_base_taxes": formattedBaseTaxes,
//         "formatted_discounted_sub_total": formattedDiscountedSubTotal,
//         "formatted_base_discounted_sub_total": formattedBaseDiscountedSubTotal,
//     };
// }

// class Item {
//     int id;
//     int quantity;
//     String sku;
//     String type;
//     String name;
//     dynamic couponCode;
//     String weight;
//     String totalWeight;
//     String baseTotalWeight;
//     String price;
//     String formattedPrice;
//     String basePrice;
//     String formattedBasePrice;
//     dynamic customPrice;
//     String formattedCustomPrice;
//     String total;
//     String formattedTotal;
//     String baseTotal;
//     String formattedBaseTotal;
//     String taxPercent;
//     String taxAmount;
//     String formattedTaxAmount;
//     String baseTaxAmount;
//     String formattedBaseTaxAmount;
//     String discountPercent;
//     String discountAmount;
//     String formattedDiscountAmount;
//     String baseDiscountAmount;
//     String formattedBaseDiscountAmount;
//     Additional additional;
//     dynamic child;
//     Product product;
//     DateTime createdAt;
//     DateTime updatedAt;

//     Item({
//         required this.id,
//         required this.quantity,
//         required this.sku,
//         required this.type,
//         required this.name,
//         required this.couponCode,
//         required this.weight,
//         required this.totalWeight,
//         required this.baseTotalWeight,
//         required this.price,
//         required this.formattedPrice,
//         required this.basePrice,
//         required this.formattedBasePrice,
//         required this.customPrice,
//         required this.formattedCustomPrice,
//         required this.total,
//         required this.formattedTotal,
//         required this.baseTotal,
//         required this.formattedBaseTotal,
//         required this.taxPercent,
//         required this.taxAmount,
//         required this.formattedTaxAmount,
//         required this.baseTaxAmount,
//         required this.formattedBaseTaxAmount,
//         required this.discountPercent,
//         required this.discountAmount,
//         required this.formattedDiscountAmount,
//         required this.baseDiscountAmount,
//         required this.formattedBaseDiscountAmount,
//         required this.additional,
//         required this.child,
//         required this.product,
//         required this.createdAt,
//         required this.updatedAt,
//     });

//     factory Item.fromJson(Map<String, dynamic> json) => Item(
//         id: json["id"],
//         quantity: json["quantity"],
//         sku: json["sku"],
//         type: json["type"],
//         name: json["name"],
//         couponCode: json["coupon_code"],
//         weight: json["weight"],
//         totalWeight: json["total_weight"],
//         baseTotalWeight: json["base_total_weight"],
//         price: json["price"],
//         formattedPrice: json["formatted_price"],
//         basePrice: json["base_price"],
//         formattedBasePrice: json["formatted_base_price"],
//         customPrice: json["custom_price"],
//         formattedCustomPrice: json["formatted_custom_price"],
//         total: json["total"],
//         formattedTotal: json["formatted_total"],
//         baseTotal: json["base_total"],
//         formattedBaseTotal: json["formatted_base_total"],
//         taxPercent: json["tax_percent"],
//         taxAmount: json["tax_amount"],
//         formattedTaxAmount: json["formatted_tax_amount"],
//         baseTaxAmount: json["base_tax_amount"],
//         formattedBaseTaxAmount: json["formatted_base_tax_amount"],
//         discountPercent: json["discount_percent"],
//         discountAmount: json["discount_amount"],
//         formattedDiscountAmount: json["formatted_discount_amount"],
//         baseDiscountAmount: json["base_discount_amount"],
//         formattedBaseDiscountAmount: json["formatted_base_discount_amount"],
//         additional: Additional.fromJson(json["additional"]),
//         child: json["child"],
//         product: Product.fromJson(json["product"]),
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "quantity": quantity,
//         "sku": sku,
//         "type": type,
//         "name": name,
//         "coupon_code": couponCode,
//         "weight": weight,
//         "total_weight": totalWeight,
//         "base_total_weight": baseTotalWeight,
//         "price": price,
//         "formatted_price": formattedPrice,
//         "base_price": basePrice,
//         "formatted_base_price": formattedBasePrice,
//         "custom_price": customPrice,
//         "formatted_custom_price": formattedCustomPrice,
//         "total": total,
//         "formatted_total": formattedTotal,
//         "base_total": baseTotal,
//         "formatted_base_total": formattedBaseTotal,
//         "tax_percent": taxPercent,
//         "tax_amount": taxAmount,
//         "formatted_tax_amount": formattedTaxAmount,
//         "base_tax_amount": baseTaxAmount,
//         "formatted_base_tax_amount": formattedBaseTaxAmount,
//         "discount_percent": discountPercent,
//         "discount_amount": discountAmount,
//         "formatted_discount_amount": formattedDiscountAmount,
//         "base_discount_amount": baseDiscountAmount,
//         "formatted_base_discount_amount": formattedBaseDiscountAmount,
//         "additional": additional.toJson(),
//         "child": child,
//         "product": product.toJson(),
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//     };
// }

// class Additional {
//     int productId;
//     int quantity;

//     Additional({
//         required this.productId,
//         required this.quantity,
//     });

//     factory Additional.fromJson(Map<String, dynamic> json) => Additional(
//         productId: json["product_id"],
//         quantity: json["quantity"],
//     );

//     Map<String, dynamic> toJson() => {
//         "product_id": productId,
//         "quantity": quantity,
//     };
// }

// class Product {
//     int id;
//     String sku;
//     String type;
//     String name;
//     String urlKey;
//     String price;
//     String formattedPrice;
//     String shortDescription;
//     String description;
//     List<Image> images;
//     List<dynamic> videos;
//     BaseImage baseImage;
//     DateTime createdAt;
//     DateTime updatedAt;
//     Reviews reviews;
//     bool inStock;
//     bool isSaved;
//     bool isNew;
//     bool isFeatured;
//     bool isBigsale;
//     bool isItemInCart;
//     bool showQuantityChanger;

//     Product({
//         required this.id,
//         required this.sku,
//         required this.type,
//         required this.name,
//         required this.urlKey,
//         required this.price,
//         required this.formattedPrice,
//         required this.shortDescription,
//         required this.description,
//         required this.images,
//         required this.videos,
//         required this.baseImage,
//         required this.createdAt,
//         required this.updatedAt,
//         required this.reviews,
//         required this.inStock,
//         required this.isSaved,
//         required this.isNew,
//         required this.isFeatured,
//         required this.isBigsale,
//         required this.isItemInCart,
//         required this.showQuantityChanger,
//     });

//     factory Product.fromJson(Map<String, dynamic> json) => Product(
//         id: json["id"],
//         sku: json["sku"],
//         type: json["type"],
//         name: json["name"],
//         urlKey: json["url_key"],
//         price: json["price"],
//         formattedPrice: json["formatted_price"],
//         shortDescription: json["short_description"],
//         description: json["description"],
//         images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
//         videos: List<dynamic>.from(json["videos"].map((x) => x)),
//         baseImage: BaseImage.fromJson(json["base_image"]),
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//         reviews: Reviews.fromJson(json["reviews"]),
//         inStock: json["in_stock"],
//         isSaved: json["is_saved"],
//         isNew: json["is_new"],
//         isFeatured: json["is_featured"],
//         isBigsale: json["is_bigsale"],
//         isItemInCart: json["is_item_in_cart"],
//         showQuantityChanger: json["show_quantity_changer"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "sku": sku,
//         "type": type,
//         "name": name,
//         "url_key": urlKey,
//         "price": price,
//         "formatted_price": formattedPrice,
//         "short_description": shortDescription,
//         "description": description,
//         "images": List<dynamic>.from(images.map((x) => x.toJson())),
//         "videos": List<dynamic>.from(videos.map((x) => x)),
//         "base_image": baseImage.toJson(),
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//         "reviews": reviews.toJson(),
//         "in_stock": inStock,
//         "is_saved": isSaved,
//         "is_new": isNew,
//         "is_featured": isFeatured,
//         "is_bigsale": isBigsale,
//         "is_item_in_cart": isItemInCart,
//         "show_quantity_changer": showQuantityChanger,
//     };
// }

// class BaseImage {
//     String smallImageUrl;
//     String mediumImageUrl;
//     String largeImageUrl;
//     String originalImageUrl;

//     BaseImage({
//         required this.smallImageUrl,
//         required this.mediumImageUrl,
//         required this.largeImageUrl,
//         required this.originalImageUrl,
//     });

//     factory BaseImage.fromJson(Map<String, dynamic> json) => BaseImage(
//         smallImageUrl: json["small_image_url"],
//         mediumImageUrl: json["medium_image_url"],
//         largeImageUrl: json["large_image_url"],
//         originalImageUrl: json["original_image_url"],
//     );

//     Map<String, dynamic> toJson() => {
//         "small_image_url": smallImageUrl,
//         "medium_image_url": mediumImageUrl,
//         "large_image_url": largeImageUrl,
//         "original_image_url": originalImageUrl,
//     };
// }

// class Image {
//     int id;
//     String path;
//     String url;
//     String originalImageUrl;
//     String smallImageUrl;
//     String mediumImageUrl;
//     String largeImageUrl;

//     Image({
//         required this.id,
//         required this.path,
//         required this.url,
//         required this.originalImageUrl,
//         required this.smallImageUrl,
//         required this.mediumImageUrl,
//         required this.largeImageUrl,
//     });

//     factory Image.fromJson(Map<String, dynamic> json) => Image(
//         id: json["id"],
//         path: json["path"],
//         url: json["url"],
//         originalImageUrl: json["original_image_url"],
//         smallImageUrl: json["small_image_url"],
//         mediumImageUrl: json["medium_image_url"],
//         largeImageUrl: json["large_image_url"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "path": path,
//         "url": url,
//         "original_image_url": originalImageUrl,
//         "small_image_url": smallImageUrl,
//         "medium_image_url": mediumImageUrl,
//         "large_image_url": largeImageUrl,
//     };
// }

// class Reviews {
//     int total;
//     int totalRating;
//     int averageRating;
//     List<dynamic> percentage;

//     Reviews({
//         required this.total,
//         required this.totalRating,
//         required this.averageRating,
//         required this.percentage,
//     });

//     factory Reviews.fromJson(Map<String, dynamic> json) => Reviews(
//         total: json["total"],
//         totalRating: json["total_rating"],
//         averageRating: json["average_rating"],
//         percentage: List<dynamic>.from(json["percentage"].map((x) => x)),
//     );

//     Map<String, dynamic> toJson() => {
//         "total": total,
//         "total_rating": totalRating,
//         "average_rating": averageRating,
//         "percentage": List<dynamic>.from(percentage.map((x) => x)),
//     };
// }
// To parse this JSON data, do
//
//     final cart = cartFromJson(jsonString);

import 'dart:convert';

Cart cartFromJson(String str) => Cart.fromJson(json.decode(str));

String cartToJson(Cart data) => json.encode(data.toJson());

class Cart {
    final Data? data;

    Cart({
        this.data,
    });

    factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
    };
}

class Data {
    final int? id;
    final String? customerEmail;
    final String? customerFirstName;
    final String? customerLastName;
    final dynamic shippingMethod;
    final dynamic couponCode;
    final int? isGift;
    final int? itemsCount;
    final int? itemsQty;
    final dynamic exchangeRate;
    final String? globalCurrencyCode;
    final String? baseCurrencyCode;
    final String? channelCurrencyCode;
    final String? cartCurrencyCode;
    final double? grandTotal;
    final String? formattedGrandTotal;
    final double? baseGrandTotal;
    final String? formattedBaseGrandTotal;
    final double? subTotal;
    final String? formattedSubTotal;
    final double? baseSubTotal;
    final String? formattedBaseSubTotal;
    final int? taxTotal;
    final String? formattedTaxTotal;
    final int? baseTaxTotal;
    final String? formattedBaseTaxTotal;
    final int? discount;
    final String? formattedDiscount;
    final int? baseDiscount;
    final String? formattedBaseDiscount;
    final dynamic checkoutMethod;
    final int? isGuest;
    final int? isActive;
    final dynamic conversionTime;
    final dynamic customer;
    final dynamic channel;
    final List<Item>? items;
    final dynamic selectedShippingRate;
    final dynamic payment;
    final dynamic billingAddress;
    final dynamic shippingAddress;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final String? taxes;
    final String? formattedTaxes;
    final String? baseTaxes;
    final String? formattedBaseTaxes;
    final String? formattedDiscountedSubTotal;
    final String? formattedBaseDiscountedSubTotal;

    Data({
        this.id,
        this.customerEmail,
        this.customerFirstName,
        this.customerLastName,
        this.shippingMethod,
        this.couponCode,
        this.isGift,
        this.itemsCount,
        this.itemsQty,
        this.exchangeRate,
        this.globalCurrencyCode,
        this.baseCurrencyCode,
        this.channelCurrencyCode,
        this.cartCurrencyCode,
        this.grandTotal,
        this.formattedGrandTotal,
        this.baseGrandTotal,
        this.formattedBaseGrandTotal,
        this.subTotal,
        this.formattedSubTotal,
        this.baseSubTotal,
        this.formattedBaseSubTotal,
        this.taxTotal,
        this.formattedTaxTotal,
        this.baseTaxTotal,
        this.formattedBaseTaxTotal,
        this.discount,
        this.formattedDiscount,
        this.baseDiscount,
        this.formattedBaseDiscount,
        this.checkoutMethod,
        this.isGuest,
        this.isActive,
        this.conversionTime,
        this.customer,
        this.channel,
        this.items,
        this.selectedShippingRate,
        this.payment,
        this.billingAddress,
        this.shippingAddress,
        this.createdAt,
        this.updatedAt,
        this.taxes,
        this.formattedTaxes,
        this.baseTaxes,
        this.formattedBaseTaxes,
        this.formattedDiscountedSubTotal,
        this.formattedBaseDiscountedSubTotal,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        customerEmail: json["customer_email"],
        customerFirstName: json["customer_first_name"],
        customerLastName: json["customer_last_name"],
        shippingMethod: json["shipping_method"],
        couponCode: json["coupon_code"],
        isGift: json["is_gift"],
        itemsCount: json["items_count"],
        itemsQty: json["items_qty"],
        exchangeRate: json["exchange_rate"],
        globalCurrencyCode: json["global_currency_code"],
        baseCurrencyCode: json["base_currency_code"],
        channelCurrencyCode: json["channel_currency_code"],
        cartCurrencyCode: json["cart_currency_code"],
        grandTotal: json["grand_total"]?.toDouble(),
        formattedGrandTotal: json["formatted_grand_total"],
        baseGrandTotal: json["base_grand_total"]?.toDouble(),
        formattedBaseGrandTotal: json["formatted_base_grand_total"],
        subTotal: json["sub_total"]?.toDouble(),
        formattedSubTotal: json["formatted_sub_total"],
        baseSubTotal: json["base_sub_total"]?.toDouble(),
        formattedBaseSubTotal: json["formatted_base_sub_total"],
        taxTotal: json["tax_total"],
        formattedTaxTotal: json["formatted_tax_total"],
        baseTaxTotal: json["base_tax_total"],
        formattedBaseTaxTotal: json["formatted_base_tax_total"],
        discount: json["discount"],
        formattedDiscount: json["formatted_discount"],
        baseDiscount: json["base_discount"],
        formattedBaseDiscount: json["formatted_base_discount"],
        checkoutMethod: json["checkout_method"],
        isGuest: json["is_guest"],
        isActive: json["is_active"],
        conversionTime: json["conversion_time"],
        customer: json["customer"],
        channel: json["channel"],
        items: json["items"] == null ? [] : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
        selectedShippingRate: json["selected_shipping_rate"],
        payment: json["payment"],
        billingAddress: json["billing_address"],
        shippingAddress: json["shipping_address"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        taxes: json["taxes"],
        formattedTaxes: json["formatted_taxes"],
        baseTaxes: json["base_taxes"],
        formattedBaseTaxes: json["formatted_base_taxes"],
        formattedDiscountedSubTotal: json["formatted_discounted_sub_total"],
        formattedBaseDiscountedSubTotal: json["formatted_base_discounted_sub_total"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "customer_email": customerEmail,
        "customer_first_name": customerFirstName,
        "customer_last_name": customerLastName,
        "shipping_method": shippingMethod,
        "coupon_code": couponCode,
        "is_gift": isGift,
        "items_count": itemsCount,
        "items_qty": itemsQty,
        "exchange_rate": exchangeRate,
        "global_currency_code": globalCurrencyCode,
        "base_currency_code": baseCurrencyCode,
        "channel_currency_code": channelCurrencyCode,
        "cart_currency_code": cartCurrencyCode,
        "grand_total": grandTotal,
        "formatted_grand_total": formattedGrandTotal,
        "base_grand_total": baseGrandTotal,
        "formatted_base_grand_total": formattedBaseGrandTotal,
        "sub_total": subTotal,
        "formatted_sub_total": formattedSubTotal,
        "base_sub_total": baseSubTotal,
        "formatted_base_sub_total": formattedBaseSubTotal,
        "tax_total": taxTotal,
        "formatted_tax_total": formattedTaxTotal,
        "base_tax_total": baseTaxTotal,
        "formatted_base_tax_total": formattedBaseTaxTotal,
        "discount": discount,
        "formatted_discount": formattedDiscount,
        "base_discount": baseDiscount,
        "formatted_base_discount": formattedBaseDiscount,
        "checkout_method": checkoutMethod,
        "is_guest": isGuest,
        "is_active": isActive,
        "conversion_time": conversionTime,
        "customer": customer,
        "channel": channel,
        "items": items == null ? [] : List<dynamic>.from(items!.map((x) => x.toJson())),
        "selected_shipping_rate": selectedShippingRate,
        "payment": payment,
        "billing_address": billingAddress,
        "shipping_address": shippingAddress,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "taxes": taxes,
        "formatted_taxes": formattedTaxes,
        "base_taxes": baseTaxes,
        "formatted_base_taxes": formattedBaseTaxes,
        "formatted_discounted_sub_total": formattedDiscountedSubTotal,
        "formatted_base_discounted_sub_total": formattedBaseDiscountedSubTotal,
    };
}

class Item {
    final int? id;
    final int? quantity;
    final String? sku;
    final String? type;
    final String? name;
    final dynamic couponCode;
    final String? weight;
    final String? totalWeight;
    final String? baseTotalWeight;
    final String? price;
    final String? formattedPrice;
    final String? basePrice;
    final String? formattedBasePrice;
    final dynamic customPrice;
    final String? formattedCustomPrice;
    final String? total;
    final String? formattedTotal;
    final String? baseTotal;
    final String? formattedBaseTotal;
    final String? taxPercent;
    final String? taxAmount;
    final String? formattedTaxAmount;
    final String? baseTaxAmount;
    final String? formattedBaseTaxAmount;
    final String? discountPercent;
    final String? discountAmount;
    final String? formattedDiscountAmount;
    final String? baseDiscountAmount;
    final String? formattedBaseDiscountAmount;
    final Additional? additional;
    final dynamic child;
    final Product? product;
    final DateTime? createdAt;
    final DateTime? updatedAt;

    Item({
        this.id,
        this.quantity,
        this.sku,
        this.type,
        this.name,
        this.couponCode,
        this.weight,
        this.totalWeight,
        this.baseTotalWeight,
        this.price,
        this.formattedPrice,
        this.basePrice,
        this.formattedBasePrice,
        this.customPrice,
        this.formattedCustomPrice,
        this.total,
        this.formattedTotal,
        this.baseTotal,
        this.formattedBaseTotal,
        this.taxPercent,
        this.taxAmount,
        this.formattedTaxAmount,
        this.baseTaxAmount,
        this.formattedBaseTaxAmount,
        this.discountPercent,
        this.discountAmount,
        this.formattedDiscountAmount,
        this.baseDiscountAmount,
        this.formattedBaseDiscountAmount,
        this.additional,
        this.child,
        this.product,
        this.createdAt,
        this.updatedAt,
    });

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        quantity: json["quantity"],
        sku: json["sku"],
        type: json["type"],
        name: json["name"],
        couponCode: json["coupon_code"],
        weight: json["weight"],
        totalWeight: json["total_weight"],
        baseTotalWeight: json["base_total_weight"],
        price: json["price"],
        formattedPrice: json["formatted_price"],
        basePrice: json["base_price"],
        formattedBasePrice: json["formatted_base_price"],
        customPrice: json["custom_price"],
        formattedCustomPrice: json["formatted_custom_price"],
        total: json["total"],
        formattedTotal: json["formatted_total"],
        baseTotal: json["base_total"],
        formattedBaseTotal: json["formatted_base_total"],
        taxPercent: json["tax_percent"],
        taxAmount: json["tax_amount"],
        formattedTaxAmount: json["formatted_tax_amount"],
        baseTaxAmount: json["base_tax_amount"],
        formattedBaseTaxAmount: json["formatted_base_tax_amount"],
        discountPercent: json["discount_percent"],
        discountAmount: json["discount_amount"],
        formattedDiscountAmount: json["formatted_discount_amount"],
        baseDiscountAmount: json["base_discount_amount"],
        formattedBaseDiscountAmount: json["formatted_base_discount_amount"],
        additional: json["additional"] == null ? null : Additional.fromJson(json["additional"]),
        child: json["child"],
        product: json["product"] == null ? null : Product.fromJson(json["product"]),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "quantity": quantity,
        "sku": sku,
        "type": type,
        "name": name,
        "coupon_code": couponCode,
        "weight": weight,
        "total_weight": totalWeight,
        "base_total_weight": baseTotalWeight,
        "price": price,
        "formatted_price": formattedPrice,
        "base_price": basePrice,
        "formatted_base_price": formattedBasePrice,
        "custom_price": customPrice,
        "formatted_custom_price": formattedCustomPrice,
        "total": total,
        "formatted_total": formattedTotal,
        "base_total": baseTotal,
        "formatted_base_total": formattedBaseTotal,
        "tax_percent": taxPercent,
        "tax_amount": taxAmount,
        "formatted_tax_amount": formattedTaxAmount,
        "base_tax_amount": baseTaxAmount,
        "formatted_base_tax_amount": formattedBaseTaxAmount,
        "discount_percent": discountPercent,
        "discount_amount": discountAmount,
        "formatted_discount_amount": formattedDiscountAmount,
        "base_discount_amount": baseDiscountAmount,
        "formatted_base_discount_amount": formattedBaseDiscountAmount,
        "additional": additional?.toJson(),
        "child": child,
        "product": product?.toJson(),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
    };
}

class Additional {
    final int? productId;
    final int? quantity;

    Additional({
        this.productId,
        this.quantity,
    });

    factory Additional.fromJson(Map<String, dynamic> json) => Additional(
        productId: json["product_id"],
        quantity: json["quantity"],
    );

    Map<String, dynamic> toJson() => {
        "product_id": productId,
        "quantity": quantity,
    };
}

class Product {
    final int? id;
    final String? sku;
    final String? type;
    final String? name;
    final String? urlKey;
    final String? price;
    final String? formattedPrice;
    final String? shortDescription;
    final String? description;
    final List<Image>? images;
    final List<dynamic>? videos;
    final BaseImage? baseImage;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final Reviews? reviews;
    final bool? inStock;
    final bool? isSaved;
    final bool? isNew;
    final bool? isFeatured;
    final bool? isBigsale;
    final bool? isItemInCart;
    final bool? showQuantityChanger;

    Product({
        this.id,
        this.sku,
        this.type,
        this.name,
        this.urlKey,
        this.price,
        this.formattedPrice,
        this.shortDescription,
        this.description,
        this.images,
        this.videos,
        this.baseImage,
        this.createdAt,
        this.updatedAt,
        this.reviews,
        this.inStock,
        this.isSaved,
        this.isNew,
        this.isFeatured,
        this.isBigsale,
        this.isItemInCart,
        this.showQuantityChanger,
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
        images: json["images"] == null ? [] : List<Image>.from(json["images"]!.map((x) => Image.fromJson(x))),
        videos: json["videos"] == null ? [] : List<dynamic>.from(json["videos"]!.map((x) => x)),
        baseImage: json["base_image"] == null ? null : BaseImage.fromJson(json["base_image"]),
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
        reviews: json["reviews"] == null ? null : Reviews.fromJson(json["reviews"]),
        inStock: json["in_stock"],
        isSaved: json["is_saved"],
        isNew: json["is_new"],
        isFeatured: json["is_featured"],
        isBigsale: json["is_bigsale"],
        isItemInCart: json["is_item_in_cart"],
        showQuantityChanger: json["show_quantity_changer"],
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
        "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x.toJson())),
        "videos": videos == null ? [] : List<dynamic>.from(videos!.map((x) => x)),
        "base_image": baseImage?.toJson(),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "reviews": reviews?.toJson(),
        "in_stock": inStock,
        "is_saved": isSaved,
        "is_new": isNew,
        "is_featured": isFeatured,
        "is_bigsale": isBigsale,
        "is_item_in_cart": isItemInCart,
        "show_quantity_changer": showQuantityChanger,
    };
}

class BaseImage {
    final String? smallImageUrl;
    final String? mediumImageUrl;
    final String? largeImageUrl;
    final String? originalImageUrl;

    BaseImage({
        this.smallImageUrl,
        this.mediumImageUrl,
        this.largeImageUrl,
        this.originalImageUrl,
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

class Image {
    final int? id;
    final String? path;
    final String? url;
    final String? originalImageUrl;
    final String? smallImageUrl;
    final String? mediumImageUrl;
    final String? largeImageUrl;

    Image({
        this.id,
        this.path,
        this.url,
        this.originalImageUrl,
        this.smallImageUrl,
        this.mediumImageUrl,
        this.largeImageUrl,
    });

    factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json["id"],
        path: json["path"],
        url: json["url"],
        originalImageUrl: json["original_image_url"],
        smallImageUrl: json["small_image_url"],
        mediumImageUrl: json["medium_image_url"],
        largeImageUrl: json["large_image_url"],
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
    final int? total;
    final int? totalRating;
    final int? averageRating;
    final List<dynamic>? percentage;

    Reviews({
        this.total,
        this.totalRating,
        this.averageRating,
        this.percentage,
    });

    factory Reviews.fromJson(Map<String, dynamic> json) => Reviews(
        total: json["total"],
        totalRating: json["total_rating"],
        averageRating: json["average_rating"],
        percentage: json["percentage"] == null ? [] : List<dynamic>.from(json["percentage"]!.map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "total": total,
        "total_rating": totalRating,
        "average_rating": averageRating,
        "percentage": percentage == null ? [] : List<dynamic>.from(percentage!.map((x) => x)),
    };
}

