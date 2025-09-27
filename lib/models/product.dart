/// Modelo de datos para representar un producto en la tienda
/// Esta clase define la estructura de un producto con todas sus propiedades
class Product {
  /// Identificador único del producto
  final String id;
  
  /// Nombre del producto (ej: "Donut de Chocolate")
  final String name;
  
  /// Precio del producto en pesos mexicanos
  final double price;
  
  /// Ruta de la imagen del producto en la carpeta assets
  final String imagePath;
  
  /// Categoría a la que pertenece el producto (ej: "Donuts", "Cafés")
  final String category;
  
  /// Descripción detallada del producto
  final String description;

  /// Constructor del modelo Product
  /// Todos los parámetros son requeridos excepto description que tiene valor por defecto
  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imagePath,
    required this.category,
    this.description = '', // Descripción opcional, por defecto vacía
  });
}
