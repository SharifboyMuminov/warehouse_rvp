import 'package:equatable/equatable.dart';
import 'package:warehouse_rvp/data/models/form_status.dart';
import 'package:warehouse_rvp/data/models/product_model.dart';

class ProductState extends Equatable {
  final String errorMessage;
  final String statusMessage;
  final FormStatus formStatus;
  final List<ProductModel> products;

  const ProductState({
    required this.formStatus,
    required this.statusMessage,
    required this.errorMessage,
    required this.products,
  });

  ProductState copyWith({
    String? errorMessage,
    String? statusMessage,
    FormStatus? formStatus,
    List<ProductModel>? products,
  }) {
    return ProductState(
      formStatus: formStatus ?? this.formStatus,
      statusMessage: statusMessage ?? "",
      errorMessage: errorMessage ?? this.errorMessage,
      products: products ?? this.products,
    );
  }

  factory ProductState.initial() {
    return const ProductState(
      formStatus: FormStatus.pure,
      statusMessage: "",
      errorMessage: "",
      products: [],
    );
  }

  @override
  List<Object?> get props => [
        errorMessage,
        statusMessage,
        formStatus,
        products,
      ];
}
