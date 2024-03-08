class CustomerModel {
  String? id;
  String? code;
  String? customerName;
  String? customerPhone;
  String? customerAddress;
  bool? isVerified;
  String? joinedAt;

  CustomerModel({
    this.id,
    this.code,
    this.customerName,
    this.customerPhone,
    this.customerAddress,
    this.isVerified,
    this.joinedAt,
  });
}