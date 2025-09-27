/// Archivo de constantes para la aplicación Donut Shop
/// Aquí se definen valores fijos que se usan en toda la app

import 'package:flutter/material.dart';

class AppConstants {
  // Colores principales de la aplicación
  static const Color primaryColor = Color(0xFFED2B6A);
  static const Color secondaryColor = Color(0xFF6B46C1);
  static const Color backgroundColor = Color(0xFFF8F9FA);
  static const Color textColor = Color(0xFF2D3748);
  static const Color lightGray = Color(0xFFE2E8F0);
  
  // Espaciado estándar
  static const double paddingSmall = 8.0;
  static const double paddingMedium = 16.0;
  static const double paddingLarge = 24.0;
  static const double paddingXLarge = 32.0;
  
  // Tamaños de fuente
  static const double fontSizeSmall = 12.0;
  static const double fontSizeMedium = 14.0;
  static const double fontSizeLarge = 16.0;
  static const double fontSizeXLarge = 18.0;
  static const double fontSizeXXLarge = 24.0;
  
  // Radio de bordes
  static const double borderRadiusSmall = 8.0;
  static const double borderRadiusMedium = 12.0;
  static const double borderRadiusLarge = 16.0;
  
  // Duración de animaciones
  static const Duration animationDuration = Duration(milliseconds: 300);
}

/// Rutas de navegación de la aplicación
class AppRoutes {
  static const String home = '/';
  static const String cart = '/cart';
  static const String detail = '/detail';
  static const String payment = '/payment';
}

/// Textos de la aplicación
class AppStrings {
  static const String appTitle = 'Donut Shop';
  static const String cartTitle = 'Carrito';
  static const String addToCart = 'Agregar al carrito';
  static const String removeFromCart = 'Quitar del carrito';
  static const String total = 'Total';
  static const String checkout = 'Proceder al pago';
  static const String emptyCart = 'Tu carrito está vacío';
  static const String loading = 'Cargando...';
}
