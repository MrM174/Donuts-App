import 'package:flutter/material.dart';

/// Funciones helper útiles para la aplicación
/// Aquí se encuentran funciones comunes que se pueden reutilizar

class AppHelpers {
  /// Formatea un precio con el símbolo de peso mexicano
  /// Ejemplo: formatPrice(25.50) -> "MX\$25.50"
  static String formatPrice(double price) {
    return 'MX\$${price.toStringAsFixed(2)}';
  }
  
  /// Muestra un snackbar con un mensaje
  /// Útil para mostrar notificaciones al usuario
  static void showSnackBar(BuildContext context, String message, {Color? backgroundColor}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor ?? Colors.green,
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
  
  /// Valida si un email tiene formato válido
  static bool isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }
  
  /// Valida si un número de teléfono tiene formato válido (México)
  static bool isValidPhoneNumber(String phone) {
    return RegExp(r'^(\+52|52)?[0-9]{10}$').hasMatch(phone.replaceAll(' ', ''));
  }
  
  /// Convierte un string a double de forma segura
  static double? parseDouble(String? value) {
    if (value == null || value.isEmpty) return null;
    return double.tryParse(value);
  }
  
  /// Convierte un string a int de forma segura
  static int? parseInt(String? value) {
    if (value == null || value.isEmpty) return null;
    return int.tryParse(value);
  }
  
  /// Genera un color aleatorio (útil para avatares o elementos decorativos)
  static Color getRandomColor() {
    final colors = [
      Colors.red,
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.teal,
      Colors.pink,
      Colors.indigo,
    ];
    return colors[DateTime.now().millisecond % colors.length];
  }
  
  /// Calcula el descuento porcentual entre dos precios
  static double calculateDiscount(double originalPrice, double discountedPrice) {
    if (originalPrice <= 0) return 0;
    return ((originalPrice - discountedPrice) / originalPrice) * 100;
  }
  
  /// Formatea un número con separadores de miles
  static String formatNumber(int number) {
    return number.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]},',
    );
  }
}
