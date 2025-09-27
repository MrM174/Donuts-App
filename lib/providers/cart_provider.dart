/// Provider para manejar el estado del carrito de compras
/// Utiliza el patrón Provider para gestionar el estado global del carrito
/// Permite agregar, quitar y modificar productos en el carrito

import 'package:flutter/material.dart';
import '../models/cart.dart';
import '../models/product.dart';

class CartProvider with ChangeNotifier {
  /// Mapa que almacena los items del carrito
  /// La clave es el ID del producto y el valor es el CartItem
  final Map<String, CartItem> _items = {};

  /// Getter público para acceder a los items del carrito
  /// Retorna una copia del mapa para evitar modificaciones directas
  Map<String, CartItem> get items => Map.from(_items);

  /// Calcula el total del carrito sumando precio * cantidad de cada item
  /// Retorna el monto total en pesos mexicanos
  double get totalAmount {
    double total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.product.price * cartItem.quantity;
    });
    return total;
  }

  /// Agrega un producto al carrito
  /// Si el producto ya existe, incrementa su cantidad en 1
  /// Si no existe, lo agrega con cantidad 1
  void addItem(Product product) {
    if (_items.containsKey(product.id)) {
      _items[product.id]!.quantity++;
    } else {
      _items[product.id] = CartItem(product: product);
    }
    notifyListeners(); // Notifica a los widgets que escuchan los cambios
  }

  /// Agrega un producto al carrito con una cantidad específica
  /// Útil cuando el usuario selecciona múltiples unidades desde el inicio
  void addItemWithQuantity(Product product, int quantity) {
    if (_items.containsKey(product.id)) {
      _items[product.id]!.quantity += quantity;
    } else {
      _items[product.id] = CartItem(product: product, quantity: quantity);
    }
    notifyListeners();
  }

  /// Actualiza la cantidad de un producto específico en el carrito
  /// Si la nueva cantidad es 0 o menor, elimina el producto del carrito
  void updateQuantity(String productId, int newQuantity) {
    if (_items.containsKey(productId)) {
      if (newQuantity <= 0) {
        _items.remove(productId);
      } else {
        _items[productId]!.quantity = newQuantity;
      }
      notifyListeners();
    }
  }

  /// Elimina completamente un producto del carrito
  /// Útil para el botón "Eliminar" en la interfaz
  void removeItem(String productId) {
    _items.remove(productId);
    notifyListeners();
  }

  /// Limpia todo el carrito
  /// Se usa después de completar una compra exitosa
  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
