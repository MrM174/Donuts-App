/// Archivo principal de la aplicación Donut Shop
/// Este es el punto de entrada de la aplicación Flutter
/// Aquí se configura el tema, los providers y las rutas principales

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/cart_provider.dart';
import 'providers/category_provider.dart';
import 'screens/home_screen.dart';
import 'screens/cart_screen.dart';
import 'screens/payment_screen.dart';

/// Función principal que inicializa la aplicación
/// Esta función es el punto de entrada de toda la app Flutter
void main() {
  runApp(const MyApp());
}

/// Widget principal de la aplicación
/// Aquí se configura el tema, los providers de estado y las rutas de navegación
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Configuración del tema base con Material Design 3
    // Usamos un color rosa como color principal de la app
    final ThemeData base = ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFED2B6A)),
      useMaterial3: true, // Habilita Material Design 3
    );

    // MultiProvider permite usar múltiples providers de estado en la app
    // CartProvider: maneja el estado del carrito de compras
    // CategoryProvider: maneja las categorías de productos
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false, // Oculta el banner de debug
        title: 'Donut Shop', // Título de la aplicación
        
        // Configuración del tema personalizado
        theme: base.copyWith(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.black, // Fondo negro para el AppBar
            elevation: 0, // Sin sombra
            foregroundColor: Colors.white, // Color del texto en blanco
            titleTextStyle: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
              fontFamily: 'Roboto', // Fuente más formal
            ),
            iconTheme: IconThemeData(
              color: Colors.white, // Iconos en blanco
            ),
          ),
        ),
        
        // Pantalla inicial de la aplicación
        home: const HomeScreen(),
        
        // Definición de rutas para navegación entre pantallas
        routes: {
          CartScreen.routeName: (ctx) => const CartScreen(), // Ruta al carrito
          PaymentScreen.routeName: (ctx) => const PaymentScreen(), // Ruta al pago
        },
      ),
    );
  }
}
