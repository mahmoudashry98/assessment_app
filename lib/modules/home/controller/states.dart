import 'package:equatable/equatable.dart';
import 'package:test_project/modules/home/data/product_model.dart';

abstract class HomeState extends Equatable {
  final List<Product> products;
  const HomeState(this.products);

  @override
  List<Object> get props => [products];
}

class HomeStateInitial extends HomeState {
  HomeStateInitial() : super([]);
}

class ProductLoading extends HomeState {
  ProductLoading() : super([]);
}

class ProductLoadingMore extends HomeState {
  const ProductLoadingMore(List<Product> products) : super(products);
}

class ProductLoaded extends HomeState {
  const ProductLoaded(List<Product> products) : super(products);
}

class ProductError extends HomeState {
  final String message;
   ProductError(this.message) : super([]);

  @override
  List<Object> get props => [message];
}