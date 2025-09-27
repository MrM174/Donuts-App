/// Modelo de datos para representar una categoría de productos
/// Las categorías ayudan a organizar los productos en grupos (ej: Donuts, Cafés, Jugos)

class Category {
  /// Identificador único de la categoría
  final String id;
  
  /// Nombre de la categoría (ej: "Donuts", "Cafés", "Jugos")
  final String name;
  
  /// Ruta de la imagen representativa de la categoría
  final String imagePath;
  
  /// Descripción de la categoría para mostrar al usuario
  final String description;

  /// Constructor del modelo Category
  /// Todos los parámetros son requeridos
  Category({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.description,
  });
}

