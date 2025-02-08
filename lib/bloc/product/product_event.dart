import 'package:equatable/equatable.dart';
import 'package:warehouse_rvp/data/models/product_model.dart';

abstract class ProductEvent extends Equatable {}

class ProductFetchEvent extends ProductEvent {
  @override
  List<Object?> get props => [];
}

class ProductInsertEvent extends ProductEvent {
  final ProductModel productModel;

  ProductInsertEvent(this.productModel);

  @override
  List<Object?> get props => [productModel];
}

class ProductDeleteEvent extends ProductEvent {
  final ProductModel productModel;

  ProductDeleteEvent(this.productModel);

  @override
  List<Object?> get props => [productModel];
}

class ProductUpdateEvent extends ProductEvent {
  final ProductModel productModel;

  ProductUpdateEvent(this.productModel);

  @override
  List<Object?> get props => [productModel];
}

class ProductSearchEvent extends ProductEvent {
  final String value;

  ProductSearchEvent(this.value);

  @override
  List<Object?> get props => [value];
}
