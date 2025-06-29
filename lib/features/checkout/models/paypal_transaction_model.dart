class PayPalTransactionModel {
  AmountModel? amount;
  String? description;
  ItemListModel? itemList;

  PayPalTransactionModel({this.amount, this.description, this.itemList});

  PayPalTransactionModel.fromJson(Map<String, dynamic> json) {
    amount =
    json['amount'] != null ? new AmountModel.fromJson(json['amount']) : null;
    description = json['description'];
    itemList = json['item_list'] != null
        ? new ItemListModel.fromJson(json['item_list'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.amount != null) {
      data['amount'] = this.amount!.toJson();
    }
    data['description'] = this.description;
    if (this.itemList != null) {
      data['item_list'] = this.itemList!.toJson();
    }
    return data;
  }
}

class AmountModel {
  String? total;
  String? currency;
  AmountDetailsModel? details;

  AmountModel({this.total, this.currency, this.details});

  AmountModel.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    currency = json['currency'];
    details =
    json['details'] != null ? new AmountDetailsModel.fromJson(json['details']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['currency'] = this.currency;
    if (this.details != null) {
      data['details'] = this.details!.toJson();
    }
    return data;
  }
}

class AmountDetailsModel {
  String? subtotal;
  String? shipping;
  int? shippingDiscount;

  AmountDetailsModel({this.subtotal, this.shipping, this.shippingDiscount});

  AmountDetailsModel.fromJson(Map<String, dynamic> json) {
    subtotal = json['subtotal'];
    shipping = json['shipping'];
    shippingDiscount = json['shipping_discount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subtotal'] = this.subtotal;
    data['shipping'] = this.shipping;
    data['shipping_discount'] = this.shippingDiscount;
    return data;
  }
}

class ItemListModel {
  List<OrderItemModel>? orders;
  ShippingAddress? shippingAddress;

  ItemListModel({this.orders, this.shippingAddress});

  ItemListModel.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      orders = <OrderItemModel>[];
      json['items'].forEach((v) {
        orders!.add(new OrderItemModel.fromJson(v));
      });
    }
    shippingAddress = json['shipping_address'] != null
        ? new ShippingAddress.fromJson(json['shipping_address'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.orders != null) {
      data['items'] = this.orders!.map((v) => v.toJson()).toList();
    }
    if (this.shippingAddress != null) {
      data['shipping_address'] = this.shippingAddress!.toJson();
    }
    return data;
  }
}

class OrderItemModel {
  String? name;
  int? quantity;
  String? price;
  String? currency;

  OrderItemModel({this.name, this.quantity, this.price, this.currency});

  OrderItemModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    quantity = json['quantity'];
    price = json['price'];
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['quantity'] = this.quantity;
    data['price'] = this.price;
    data['currency'] = this.currency;
    return data;
  }
}

class ShippingAddress {
  String? recipientName;
  String? line1;
  String? line2;
  String? city;
  String? countryCode;
  String? postalCode;
  String? phone;
  String? state;

  ShippingAddress(
      {this.recipientName,
        this.line1,
        this.line2,
        this.city,
        this.countryCode,
        this.postalCode,
        this.phone,
        this.state});

  ShippingAddress.fromJson(Map<String, dynamic> json) {
    recipientName = json['recipient_name'];
    line1 = json['line1'];
    line2 = json['line2'];
    city = json['city'];
    countryCode = json['country_code'];
    postalCode = json['postal_code'];
    phone = json['phone'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['recipient_name'] = this.recipientName;
    data['line1'] = this.line1;
    data['line2'] = this.line2;
    data['city'] = this.city;
    data['country_code'] = this.countryCode;
    data['postal_code'] = this.postalCode;
    data['phone'] = this.phone;
    data['state'] = this.state;
    return data;
  }
}
