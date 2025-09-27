/// Modelo de datos para el carrito de compras
/// Este archivo contiene las clases relacionadas con el manejo del carrito

import 'product.dart';

/// Representa un item individual en el carrito de compras
/// Combina un producto con su cantidad seleccionada
class CartItem {
  /// El producto que se está agregando al carrito
  final Product product;
  
  /// Cantidad de este producto en el carrito
  /// Puede ser modificada por el usuario
  int quantity;

  /// Constructor del CartItem
  /// product: el producto a agregar (requerido)
  /// quantity: cantidad inicial, por defecto es 1
  CartItem({required this.product, this.quantity = 1});
}
