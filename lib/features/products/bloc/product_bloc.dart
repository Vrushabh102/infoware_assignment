import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infoware_flutter_assignment/features/products/data/data_repository/product_repository.dart';
import 'package:infoware_flutter_assignment/features/products/data/models/product_model.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository productRepository;
  ProductBloc({required this.productRepository}) : super(ProductInitial()) {
    on<FetchProducts>(_onLoadProduct);
  }

  Future<void> _onLoadProduct(event, emit) async {
    emit(ProductLoading());
    final products = await productRepository.fetchProducts();
    emit(ProductLoaded(products: products));
  }
}
