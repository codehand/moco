import 'dart:ffi';

class ProductModel {
  String? id;
  String? code;
  String? name;
  String? image;
  String? categoryId;
  String? categoryName;
  String? shortDescription;
  String? description;
  int? maxOrderQuantity;
  int? minOrderQuantity;
  double? price;
  double? salePrice;
  String? currency;
  double? rating;
  String? estDeliverTime;
  int? historyOrder;

  ProductModel({
    this.id,
    this.code,
    this.name,
    this.image,
    this.categoryId,
    this.categoryName,
    this.shortDescription,
    this.description,
    this.maxOrderQuantity,
    this.minOrderQuantity,
    this.price,
    this.salePrice,
    this.currency,
    this.rating,
    this.estDeliverTime,
    this.historyOrder,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    name = json['name'];
    image = json['image'];
    categoryId = json['categoryId'];
    categoryName = json['categoryName'];
    shortDescription = json['shortDescription'];
    description = json['description'];
    maxOrderQuantity = json['maxOrderQuantity'] != null ? int.parse(json['maxOrderQuantity']) : 0;
    minOrderQuantity = json['minOrderQuantity'] != null ? int.parse(json['minOrderQuantity']) : 0;
    price = json['price'];
    salePrice = json['salePrice'];
    currency = json['currency'];
    rating = json['rating'];
    estDeliverTime = json['estDeliverTime'];
    historyOrder = json['historyOrder']; 
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['code'] = code;
    data['name'] = name;
    data['image'] = image;
    data['categoryId'] = categoryId;
    data['categoryName'] = categoryName;
    data['description'] = description;
    data['shortDescription'] = shortDescription;
    data['maxOrderQuantity'] = maxOrderQuantity;
    data['minOrderQuantity'] = minOrderQuantity;
    data['price'] = price;
    data['salePrice'] = salePrice;
    data['currency'] = currency;
    data['rating'] = rating;
    data['estDeliverTime'] = estDeliverTime;
    data['historyOrder'] = historyOrder;
    return data;
  }

  bool hasDiscount() {
    if(salePrice != null && price != null) {
      return salePrice!.toDouble() < price!.toDouble();
    }
    return false;
  }

  String getStandardPriceAsString() {
    if(price != null) {
      return price!.toString();
    }
    return "0";
  }

  String getPriceValueAsString() {
    if(price == null) {
      return "0";
    }
    if(hasDiscount()) {
      return salePrice!.toString();
    }
    return getStandardPriceAsString();
  }

  num getStandardPrice() {
    if(price != null) {
      return price!.toDouble();
    }
    return 0;
  }

  num getPriceValue() {
    if(price == null) {
      return 0;
    }
    if(hasDiscount()) {
      return salePrice!.toDouble();
    }
    return getStandardPrice();
  }
}