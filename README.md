# 🍩 Donut Shop - Aplicación Flutter

Una aplicación móvil moderna para una tienda de donuts, cafés, pizzas y jugos desarrollada con Flutter.

## 📱 Características

- **Catálogo de productos** organizados por categorías
- **Carrito de compras** con gestión de cantidades
- **Interfaz moderna** con Material Design 3
- **Gestión de estado** con Provider
- **Navegación fluida** entre pantallas
- **Diseño responsivo** para diferentes tamaños de pantalla

## 🏗️ Estructura del Proyecto

```
lib/
├── main.dart                 # Punto de entrada de la aplicación
├── models/                   # Modelos de datos
│   ├── product.dart         # Modelo de producto
│   ├── cart.dart           # Modelo de carrito
│   └── category.dart       # Modelo de categoría
├── providers/               # Gestión de estado
│   ├── cart_provider.dart  # Estado del carrito
│   └── category_provider.dart # Estado de categorías
├── screens/                 # Pantallas de la aplicación
│   ├── home_screen.dart    # Pantalla principal
│   ├── cart_screen.dart    # Pantalla del carrito
│   ├── detail_screen.dart  # Detalle de producto
│   └── payment_screen.dart # Pantalla de pago
├── widgets/                 # Widgets reutilizables
│   ├── product_card.dart   # Tarjeta de producto
│   └── category_item.dart  # Item de categoría
└── utils/                   # Funciones helper y constantes
    ├── constants.dart      # Constantes de la app
    └── helpers.dart        # Funciones útiles
```

## 🚀 Instalación y Configuración

### Prerrequisitos

- Flutter SDK (versión 3.9.2 o superior)
- Dart SDK
- Android Studio / VS Code
- Dispositivo Android/iOS o emulador

### Pasos de instalación

1. **Clona el repositorio**
   ```bash
   git clone [url-del-repositorio]
   cd demo
   ```

2. **Instala las dependencias**
   ```bash
   flutter pub get
   ```

3. **Ejecuta la aplicación**
   ```bash
   flutter run
   ```

## 📦 Dependencias Principales

- **flutter**: SDK principal de Flutter
- **provider**: Gestión de estado global
- **cupertino_icons**: Iconos de iOS para consistencia

## 🎨 Diseño y UX

### Colores Principales
- **Primario**: Rosa (#ED2B6A)
- **Secundario**: Morado (#6B46C1)
- **Fondo**: Gris claro (#F8F9FA)
- **Texto**: Gris oscuro (#2D3748)

### Componentes
- Material Design 3
- Tarjetas con bordes redondeados
- Botones con efectos de elevación
- Navegación con AppBar personalizado

## 🔧 Funcionalidades

### Gestión de Productos
- Visualización por categorías
- Detalles de cada producto
- Imágenes de alta calidad
- Precios en pesos mexicanos

### Carrito de Compras
- Agregar/quitar productos
- Modificar cantidades
- Cálculo automático del total
- Persistencia durante la sesión

### Navegación
- Pantalla principal con categorías
- Detalle de productos
- Carrito de compras
- Proceso de pago

## 📱 Pantallas

1. **Home Screen**: Muestra categorías y productos destacados
2. **Detail Screen**: Información detallada de un producto
3. **Cart Screen**: Gestión del carrito de compras
4. **Payment Screen**: Proceso de checkout

## 🛠️ Desarrollo

### Estructura de Archivos

- **models/**: Clases de datos inmutables
- **providers/**: Gestión de estado con ChangeNotifier
- **screens/**: Pantallas principales de la app
- **widgets/**: Componentes reutilizables
- **utils/**: Funciones helper y constantes

### Convenciones de Código

- Comentarios en español para mejor comprensión
- Nombres descriptivos para variables y funciones
- Separación clara de responsabilidades
- Uso de Provider para estado global
