class ProductModel {
  final int id;
  final int count;
  final num price;
  final String productName;
  final String qrCode;
  final String description;
  final String imagePath;

  ProductModel({
    required this.id,
    required this.description,
    required this.price,
    required this.count,
    required this.imagePath,
    required this.productName,
    required this.qrCode,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["id"] as int? ?? 0,
      description: json["description"] as String? ?? "",
      price: json["price"] as num? ?? 0,
      count: json["count"] as int? ?? 0,
      imagePath: json["image_path"] as String? ?? "",
      productName: json["product_name"] as String? ?? "",
      qrCode: json["qr"] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "description": description,
      "price": price,
      "count": count,
      "image_path": imagePath,
      "product_name": productName,
      "qr": qrCode,
    };
  }

  Map<String, dynamic> toJsonForUpdate() {
    return {
      "id": id,
      "description": description,
      "price": price,
      "count": count,
      "image_path": imagePath,
      "product_name": productName,
      "qr": qrCode,
    };
  }

  factory ProductModel.initial() {
    return ProductModel(
      id: 0,
      description: "",
      price: 0,
      count: 0,
      imagePath: "",
      productName: "",
      qrCode: "",
    );
  }

  ProductModel copyWith({
    int? id,
    int? count,
    num? price,
    String? productName,
    String? qrCode,
    String? description,
    String? imagePath,
  }) {
    return ProductModel(
      id: id ?? this.id,
      count: count ?? this.count,
      price: price ?? this.price,
      productName: productName ?? this.productName,
      qrCode: qrCode ?? this.qrCode,
      description: description ?? this.description,
      imagePath: imagePath ?? this.imagePath,
    );
  }
}
