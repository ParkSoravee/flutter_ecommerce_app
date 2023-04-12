part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

// We have 3 differences event that can be triggered from the UI.

class CartStarted extends CartEvent {
  // Always triggerd when start the app and this will prepare our cart to ready for user.

  @override
  List<Object> get props => [];
}

class CartProductAdded extends CartEvent {
  // Trigger when user try to add product to the cart.
  final Product product;

  const CartProductAdded(this.product);

  @override
  List<Object> get props => [];
}

class CartProductRemoved extends CartEvent {
  // Trigger when user try to add product to the cart.
  final Product product;

  const CartProductRemoved(this.product);

  @override
  List<Object> get props => [];
}
