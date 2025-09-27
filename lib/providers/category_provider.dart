/// Provider para manejar el estado de las categorías de productos
/// Gestiona qué categoría está seleccionada actualmente y la lista de categorías disponibles

import 'package:flutter/material.dart';
import '../models/category.dart';

class CategoryProvider with ChangeNotifier {
  /// ID de la categoría actualmente seleccionada
  /// Por defecto se selecciona 'donuts'
  String _selectedCategoryId = 'donuts';

  /// Getter público para acceder a la categoría seleccionada
  String get selectedCategoryId => _selectedCategoryId;

  /// Cambia la categoría seleccionada
  /// Notifica a todos los widgets que escuchan los cambios
  void selectCategory(String categoryId) {
    _selectedCategoryId = categoryId;
    notifyListeners();
  }

  /// Lista de todas las categorías disponibles en la tienda
  /// Cada categoría tiene su ID, nombre, imagen y descripción
  List<Category> get categories => [
    Category(
      id: 'donuts',
      name: 'Donuts',
      imagePath: 'assets/images/DonasChocolate.png',
      description: 'Sweet donuts with tasty toppings',
    ),
    Category(
      id: 'coffee',
      name: 'Coffee & Frappes',
      imagePath: 'assets/images/CafeAmericano.png',
      description: 'Hot coffees and iced frappes',
    ),
    Category(
      id: 'pizza',
      name: 'Pizzas & Pastas',
      imagePath: 'assets/images/PizzaMargherita.png',
      description: 'Classic pizzas and hearty pastas',
    ),
    Category(
      id: 'juices',
      name: 'Juices',
      imagePath: 'assets/images/JugoNaranja.png',
      description: 'Freshly squeezed juices',
    ),
  ];
}

