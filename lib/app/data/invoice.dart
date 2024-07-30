// To parse this JSON data, do
//
//     final invoice = invoiceFromJson(jsonString);

import 'dart:convert';

Invoice invoiceFromJson(String str) => Invoice.fromJson(json.decode(str));

String invoiceToJson(Invoice data) => json.encode(data.toJson());

class Invoice {
    List<InvoiceData> data;

    Invoice({
        required this.data,
    });

    factory Invoice.fromJson(Map<String, dynamic> json) => Invoice(
        data: List<InvoiceData>.from(json["data"].map((x) => InvoiceData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class InvoiceData {
    int id;
    String incrementId;
    String state;
    bool emailSent;
    int totalQty;
    String baseCurrencyCode;
    String channelCurrencyCode;
    String orderCurrencyCode;
    double subTotal;
    String formattedSubTotal;
    int baseSubTotal;
    String formattedBaseSubTotal;
    double grandTotal;
    String formattedGrandTotal;
    int baseGrandTotal;
    String formattedBaseGrandTotal;
    int orderId;
    int orderAddressId;
    DateTime createdAt;
    DateTime updatedAt;
    String transactionId;
    int reminders;
    DateTime nextReminderAt;

    InvoiceData({
        required this.id,
        required this.incrementId,
        required this.state,
        required this.emailSent,
        required this.totalQty,
        required this.baseCurrencyCode,
        required this.channelCurrencyCode,
        required this.orderCurrencyCode,
        required this.subTotal,
        required this.formattedSubTotal,
        required this.baseSubTotal,
        required this.formattedBaseSubTotal,
        required this.grandTotal,
        required this.formattedGrandTotal,
        required this.baseGrandTotal,
        required this.formattedBaseGrandTotal,
        required this.orderId,
        required this.orderAddressId,
        required this.createdAt,
        required this.updatedAt,
        required this.transactionId,
        required this.reminders,
        required this.nextReminderAt,
    });

    factory InvoiceData.fromJson(Map<String, dynamic> json) => InvoiceData(
        id: json["id"],
        incrementId: json["increment_id"],
        state: json["state"],
        emailSent: json["email_sent"],
        totalQty: json["total_qty"],
        baseCurrencyCode: json["base_currency_code"],
        channelCurrencyCode: json["channel_currency_code"],
        orderCurrencyCode: json["order_currency_code"],
        subTotal: json["sub_total"]?.toDouble(),
        formattedSubTotal: json["formatted_sub_total"],
        baseSubTotal: json["base_sub_total"],
        formattedBaseSubTotal: json["formatted_base_sub_total"],
        grandTotal: json["grand_total"]?.toDouble(),
        formattedGrandTotal: json["formatted_grand_total"],
        baseGrandTotal: json["base_grand_total"],
        formattedBaseGrandTotal: json["formatted_base_grand_total"],
        orderId: json["order_id"],
        orderAddressId: json["order_address_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        transactionId: json["transaction_id"],
        reminders: json["reminders"],
        nextReminderAt: DateTime.parse(json["next_reminder_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "increment_id": incrementId,
        "state": state,
        "email_sent": emailSent,
        "total_qty": totalQty,
        "base_currency_code": baseCurrencyCode,
        "channel_currency_code": channelCurrencyCode,
        "order_currency_code": orderCurrencyCode,
        "sub_total": subTotal,
        "formatted_sub_total": formattedSubTotal,
        "base_sub_total": baseSubTotal,
        "formatted_base_sub_total": formattedBaseSubTotal,
        "grand_total": grandTotal,
        "formatted_grand_total": formattedGrandTotal,
        "base_grand_total": baseGrandTotal,
        "formatted_base_grand_total": formattedBaseGrandTotal,
        "order_id": orderId,
        "order_address_id": orderAddressId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "transaction_id": transactionId,
        "reminders": reminders,
        "next_reminder_at": nextReminderAt.toIso8601String(),
    };
}
