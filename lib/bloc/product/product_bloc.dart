import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warehouse_rvp/bloc/product/product_event.dart';
import 'package:warehouse_rvp/bloc/product/product_state.dart';
import 'package:warehouse_rvp/data/local/local_source.dart';
import 'package:warehouse_rvp/data/models/form_status.dart';
import 'package:warehouse_rvp/data/models/network_response.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductState.initial()) {
    on<ProductInsertEvent>(_insertProduct);
    on<ProductFetchEvent>(_fetchProducts);
    on<ProductUpdateEvent>(_updateProduct);
    on<ProductDeleteEvent>(_deleteProduct);
    on<ProductSearchEvent>(_searchProducts);
  }

  final SqfliteSource _sqfliteSource = SqfliteSource();

  Future<void> _fetchProducts(ProductFetchEvent event, emit) async {
    emit(state.copyWith(formStatus: FormStatus.loading));

    NetworkResponse networkResponse = await _sqfliteSource.getAllProduct();

    if (networkResponse.errorText.isEmpty) {
      emit(
        state.copyWith(
          formStatus: FormStatus.success,
          products: networkResponse.data,
        ),
      );
    } else {
      emit(
        state.copyWith(
          formStatus: FormStatus.error,
          errorMessage: networkResponse.errorText,
        ),
      );
    }
  }

  Future<void> _insertProduct(ProductInsertEvent event, emit) async {
    emit(state.copyWith(formStatus: FormStatus.loading));

    NetworkResponse networkResponse =
        await _sqfliteSource.insertProduct(event.productModel);

    if (networkResponse.errorText.isEmpty) {
      emit(state.copyWith(statusMessage: "pop"));
      Future.microtask(() {
        add(ProductFetchEvent());
      });
    } else {
      emit(
        state.copyWith(
          formStatus: FormStatus.error,
          errorMessage: networkResponse.errorText,
        ),
      );
    }
  }

  Future<void> _updateProduct(ProductUpdateEvent event, emit) async {
    emit(state.copyWith(formStatus: FormStatus.loading));

    NetworkResponse networkResponse =
        await _sqfliteSource.updateProduct(event.productModel);

    if (networkResponse.errorText.isEmpty) {
      add(ProductFetchEvent());
    } else {
      emit(
        state.copyWith(
          formStatus: FormStatus.error,
          errorMessage: networkResponse.errorText,
        ),
      );
    }
  }

  Future<void> _deleteProduct(ProductDeleteEvent event, emit) async {
    emit(state.copyWith(formStatus: FormStatus.loading));

    NetworkResponse networkResponse =
        await _sqfliteSource.deleteProduct(event.productModel);

    if (networkResponse.errorText.isEmpty) {
      add(ProductFetchEvent());
    } else {
      emit(
        state.copyWith(
          formStatus: FormStatus.error,
          errorMessage: networkResponse.errorText,
        ),
      );
    }
  }

  Future<void> _searchProducts(ProductSearchEvent event, emit) async {
    emit(state.copyWith(formStatus: FormStatus.loading));
    if (event.value.isEmpty) {
      add(ProductFetchEvent());
    }

    NetworkResponse networkResponse =
        await _sqfliteSource.searchNotes(event.value);

    if (networkResponse.errorText.isEmpty) {
      emit(
        state.copyWith(
          formStatus: FormStatus.success,
          products: networkResponse.data,
        ),
      );
    } else {
      emit(
        state.copyWith(
          formStatus: FormStatus.error,
          errorMessage: networkResponse.errorText,
        ),
      );
    }
  }
}
