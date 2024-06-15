import 'dart:convert';

Cart CartFromJson(String str) => Cart.fromJson(json.decode(str));

String CartToJson(Cart data) => json.encode(data.toJson());

class Cart {
    Data data;

    Cart({
        required this.data,
    });

    factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "data": data.toJson(),
    };
}

class Data {
    int id;
    String customerEmail;
    String customerFirstName;
    String customerLastName;
    String shippingMethod;
    String couponCode;
    int itemsCount;
    int itemsQty;
    String baseCurrencyCode;
    String channelCurrencyCode;
    String cartCurrencyCode;
    int grandTotal;
    String formattedGrandTotal;
    int baseGrandTotal;
    String formattedBasedGrandTotal;
    int subTotal;
    String formattedSubTotal;
    int baseSubTotal;
    String formattedBasedSubTotal;
    int taxTotal;
    String formattedTaxTotal;
    int baseTaxTotal;
    String formattedBasedTaxTotal;
    int discount;
    String formattedDiscount;
    int baseDiscount;
    String formattedBasedDiscount;
    bool isGuest;
    bool isActive;
    Customer customer;
    Items items;
    SelectedShippingRate selectedShippingRate;
    Payment payment;
    IngAddress billingAddress;
    IngAddress shippingAddress;
    DateTime createdAt;
    DateTime updatedAt;

    Data({
        required this.id,
        required this.customerEmail,
        required this.customerFirstName,
        required this.customerLastName,
        required this.shippingMethod,
        required this.couponCode,
        required this.itemsCount,
        required this.itemsQty,
        required this.baseCurrencyCode,
        required this.channelCurrencyCode,
        required this.cartCurrencyCode,
        required this.grandTotal,
        required this.formattedGrandTotal,
        required this.baseGrandTotal,
        required this.formattedBasedGrandTotal,
        required this.subTotal,
        required this.formattedSubTotal,
        required this.baseSubTotal,
        required this.formattedBasedSubTotal,
        required this.taxTotal,
        required this.formattedTaxTotal,
        required this.baseTaxTotal,
        required this.formattedBasedTaxTotal,
        required this.discount,
        required this.formattedDiscount,
        required this.baseDiscount,
        required this.formattedBasedDiscount,
        required this.isGuest,
        required this.isActive,
        required this.customer,
        required this.items,
        required this.selectedShippingRate,
        required this.payment,
        required this.billingAddress,
        required this.shippingAddress,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        customerEmail: json["customer_email"],
        customerFirstName: json["customer_first_name"],
        customerLastName: json["customer_last_name"],
        shippingMethod: json["shipping_method"],
        couponCode: json["coupon_code"],
        itemsCount: json["items_count"],
        itemsQty: json["items_qty"],
        baseCurrencyCode: json["base_currency_code"],
        channelCurrencyCode: json["channel_currency_code"],
        cartCurrencyCode: json["cart_currency_code"],
        grandTotal: json["grand_total"],
        formattedGrandTotal: json["formatted_grand_total"],
        baseGrandTotal: json["base_grand_total"],
        formattedBasedGrandTotal: json["formatted_based_grand_total"],
        subTotal: json["sub_total"],
        formattedSubTotal: json["formatted_sub_total"],
        baseSubTotal: json["base_sub_total"],
        formattedBasedSubTotal: json["formatted_based_sub_total"],
        taxTotal: json["tax_total"],
        formattedTaxTotal: json["formatted_tax_total"],
        baseTaxTotal: json["base_tax_total"],
        formattedBasedTaxTotal: json["formatted_based_tax_total"],
        discount: json["discount"],
        formattedDiscount: json["formatted_discount"],
        baseDiscount: json["base_discount"],
        formattedBasedDiscount: json["formatted_based_discount"],
        isGuest: json["is_guest"],
        isActive: json["is_active"],
        customer: Customer.fromJson(json["customer"]),
        items: Items.fromJson(json["items"]),
        selectedShippingRate: SelectedShippingRate.fromJson(json["selected_shipping_rate"]),
        payment: Payment.fromJson(json["payment"]),
        billingAddress: IngAddress.fromJson(json["billing_address"]),
        shippingAddress: IngAddress.fromJson(json["shipping_address"]),
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "customer_email": customerEmail,
        "customer_first_name": customerFirstName,
        "customer_last_name": customerLastName,
        "shipping_method": shippingMethod,
        "coupon_code": couponCode,
        "items_count": itemsCount,
        "items_qty": itemsQty,
        "base_currency_code": baseCurrencyCode,
        "channel_currency_code": channelCurrencyCode,
        "cart_currency_code": cartCurrencyCode,
        "grand_total": grandTotal,
        "formatted_grand_total": formattedGrandTotal,
        "base_grand_total": baseGrandTotal,
        "formatted_based_grand_total": formattedBasedGrandTotal,
        "sub_total": subTotal,
        "formatted_sub_total": formattedSubTotal,
        "base_sub_total": baseSubTotal,
        "formatted_based_sub_total": formattedBasedSubTotal,
        "tax_total": taxTotal,
        "formatted_tax_total": formattedTaxTotal,
        "base_tax_total": baseTaxTotal,
        "formatted_based_tax_total": formattedBasedTaxTotal,
        "discount": discount,
        "formatted_discount": formattedDiscount,
        "base_discount": baseDiscount,
        "formatted_based_discount": formattedBasedDiscount,
        "is_guest": isGuest,
        "is_active": isActive,
        "customer": customer.toJson(),
        "items": items.toJson(),
        "selected_shipping_rate": selectedShippingRate.toJson(),
        "payment": payment.toJson(),
        "billing_address": billingAddress.toJson(),
        "shipping_address": shippingAddress.toJson(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

class IngAddress {
    int id;
    String firstName;
    String lastName;
    String name;
    String email;
    List<String> address1;
    String address2;
    String country;
    String countryName;
    String state;
    String city;
    int postcode;
    String phone;
    DateTime createdAt;
    DateTime updatedAt;

    IngAddress({
        required this.id,
        required this.firstName,
        required this.lastName,
        required this.name,
        required this.email,
        required this.address1,
        required this.address2,
        required this.country,
        required this.countryName,
        required this.state,
        required this.city,
        required this.postcode,
        required this.phone,
        required this.createdAt,
        required this.updatedAt,
    });

    factory IngAddress.fromJson(Map<String, dynamic> json) => IngAddress(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        name: json["name"],
        email: json["email"],
        address1: List<String>.from(json["address1"].map((x) => x)),
        address2: json["address2"],
        country: json["country"],
        countryName: json["country_name"],
        state: json["state"],
        city: json["city"],
        postcode: json["postcode"],
        phone: json["phone"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "name": name,
        "email": email,
        "address1": List<dynamic>.from(address1.map((x) => x)),
        "address2": address2,
        "country": country,
        "country_name": countryName,
        "state": state,
        "city": city,
        "postcode": postcode,
        "phone": phone,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

class Customer {
    int id;
    String firstName;
    String lastName;
    String email;
    String gender;
    DateTime dateOfBirth;
    String phone;
    String status;
    String subscribedToNewsLetter;
    String image;
    String notes;
    DateTime createdAt;
    DateTime updatedAt;

    Customer({
        required this.id,
        required this.firstName,
        required this.lastName,
        required this.email,
        required this.gender,
        required this.dateOfBirth,
        required this.phone,
        required this.status,
        required this.subscribedToNewsLetter,
        required this.image,
        required this.notes,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        gender: json["gender"],
        dateOfBirth: DateTime.parse(json["date_of_birth"]),
        phone: json["phone"],
        status: json["status"],
        subscribedToNewsLetter: json["subscribed_to_news_letter"],
        image: json["image"],
        notes: json["notes"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "gender": gender,
        "date_of_birth": "${dateOfBirth.year.toString().padLeft(4, '0')}-${dateOfBirth.month.toString().padLeft(2, '0')}-${dateOfBirth.day.toString().padLeft(2, '0')}",
        "phone": phone,
        "status": status,
        "subscribed_to_news_letter": subscribedToNewsLetter,
        "image": image,
        "notes": notes,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

class Items {
    int id;
    int quantity;
    String sku;
    String type;
    String name;
    double weight;
    int totalWeight;
    double price;
    String formattedPrice;
    int basePrice;
    String formattedBasedPrice;
    double total;
    String formattedTotal;
    int baseTotal;
    String formattedBasedTotal;
    int taxPercent;
    double taxAmount;
    String formattedTaxAmount;
    double baseTaxAmount;
    String formattedBasedTaxAmount;
    Additional additional;
    String child;
    DateTime createdAt;
    DateTime updatedAt;

    Items({
        required this.id,
        required this.quantity,
        required this.sku,
        required this.type,
        required this.name,
        required this.weight,
        required this.totalWeight,
        required this.price,
        required this.formattedPrice,
        required this.basePrice,
        required this.formattedBasedPrice,
        required this.total,
        required this.formattedTotal,
        required this.baseTotal,
        required this.formattedBasedTotal,
        required this.taxPercent,
        required this.taxAmount,
        required this.formattedTaxAmount,
        required this.baseTaxAmount,
        required this.formattedBasedTaxAmount,
        required this.additional,
        required this.child,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Items.fromJson(Map<String, dynamic> json) => Items(
        id: json["id"],
        quantity: json["quantity"],
        sku: json["sku"],
        type: json["type"],
        name: json["name"],
        weight: json["weight"]?.toDouble(),
        totalWeight: json["total_weight"],
        price: json["price"]?.toDouble(),
        formattedPrice: json["formatted_price"],
        basePrice: json["base_price"],
        formattedBasedPrice: json["formatted_based_price"],
        total: json["total"]?.toDouble(),
        formattedTotal: json["formatted_total"],
        baseTotal: json["base_total"],
        formattedBasedTotal: json["formatted_based_total"],
        taxPercent: json["tax_percent"],
        taxAmount: json["tax_amount"]?.toDouble(),
        formattedTaxAmount: json["formatted_tax_amount"],
        baseTaxAmount: json["base_tax_amount"]?.toDouble(),
        formattedBasedTaxAmount: json["formatted_based_tax_amount"],
        additional: Additional.fromJson(json["additional"]),
        child: json["child"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "quantity": quantity,
        "sku": sku,
        "type": type,
        "name": name,
        "weight": weight,
        "total_weight": totalWeight,
        "price": price,
        "formatted_price": formattedPrice,
        "base_price": basePrice,
        "formatted_based_price": formattedBasedPrice,
        "total": total,
        "formatted_total": formattedTotal,
        "base_total": baseTotal,
        "formatted_based_total": formattedBasedTotal,
        "tax_percent": taxPercent,
        "tax_amount": taxAmount,
        "formatted_tax_amount": formattedTaxAmount,
        "base_tax_amount": baseTaxAmount,
        "formatted_based_tax_amount": formattedBasedTaxAmount,
        "additional": additional.toJson(),
        "child": child,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

class Additional {
    int selectedConfigurableOption;
    int quantity;
    int productId;
    dynamic parentId;
    List<String> superAttribute;
    Attributes attributes;

    Additional({
        required this.selectedConfigurableOption,
        required this.quantity,
        required this.productId,
        required this.parentId,
        required this.superAttribute,
        required this.attributes,
    });

    factory Additional.fromJson(Map<String, dynamic> json) => Additional(
        selectedConfigurableOption: json["selected_configurable_option"],
        quantity: json["quantity"],
        productId: json["product_id"],
        parentId: json["parent_id"],
        superAttribute: List<String>.from(json["super_attribute"].map((x) => x)),
        attributes: Attributes.fromJson(json["attributes"]),
    );

    Map<String, dynamic> toJson() => {
        "selected_configurable_option": selectedConfigurableOption,
        "quantity": quantity,
        "product_id": productId,
        "parent_id": parentId,
        "super_attribute": List<dynamic>.from(superAttribute.map((x) => x)),
        "attributes": attributes.toJson(),
    };
}

class Attributes {
    Color size;
    Color color;

    Attributes({
        required this.size,
        required this.color,
    });

    factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        size: Color.fromJson(json["size"]),
        color: Color.fromJson(json["color"]),
    );

    Map<String, dynamic> toJson() => {
        "size": size.toJson(),
        "color": color.toJson(),
    };
}

class Color {
    int optionId;
    String optionLabel;
    String attributeName;

    Color({
        required this.optionId,
        required this.optionLabel,
        required this.attributeName,
    });

    factory Color.fromJson(Map<String, dynamic> json) => Color(
        optionId: json["option_id"],
        optionLabel: json["option_label"],
        attributeName: json["attribute_name"],
    );

    Map<String, dynamic> toJson() => {
        "option_id": optionId,
        "option_label": optionLabel,
        "attribute_name": attributeName,
    };
}

class Payment {
    int id;
    String method;
    String methodTitle;
    DateTime createdAt;
    DateTime updatedAt;

    Payment({
        required this.id,
        required this.method,
        required this.methodTitle,
        required this.createdAt,
        required this.updatedAt,
    });

    factory Payment.fromJson(Map<String, dynamic> json) => Payment(
        id: json["id"],
        method: json["method"],
        methodTitle: json["method_title"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "method": method,
        "method_title": methodTitle,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}

class SelectedShippingRate {
    int id;
    String carrier;
    String carrierTitle;
    String method;
    String methodTitle;
    String methodDescription;
    double price;
    String formattedPrice;
    int basePrice;
    String formattedBasedPrice;
    DateTime createdAt;
    DateTime updatedAt;

    SelectedShippingRate({
        required this.id,
        required this.carrier,
        required this.carrierTitle,
        required this.method,
        required this.methodTitle,
        required this.methodDescription,
        required this.price,
        required this.formattedPrice,
        required this.basePrice,
        required this.formattedBasedPrice,
        required this.createdAt,
        required this.updatedAt,
    });

    factory SelectedShippingRate.fromJson(Map<String, dynamic> json) => SelectedShippingRate(
        id: json["id"],
        carrier: json["carrier"],
        carrierTitle: json["carrier_title"],
        method: json["method"],
        methodTitle: json["method_title"],
        methodDescription: json["method_description"],
        price: json["price"]?.toDouble(),
        formattedPrice: json["formatted_price"],
        basePrice: json["base_price"],
        formattedBasedPrice: json["formatted_based_price"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "carrier": carrier,
        "carrier_title": carrierTitle,
        "method": method,
        "method_title": methodTitle,
        "method_description": methodDescription,
        "price": price,
        "formatted_price": formattedPrice,
        "base_price": basePrice,
        "formatted_based_price": formattedBasedPrice,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
    };
}
