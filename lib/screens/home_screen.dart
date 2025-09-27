import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../providers/category_provider.dart';
import '../providers/cart_provider.dart';
import '../widgets/category_item.dart';
import 'detail_screen.dart';
import 'cart_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // Función para obtener el color de fondo según la categoría
  Color _getCategoryBackgroundColor(String categoryId) {
    switch (categoryId) {
      case 'donuts':
        return Colors.pink[50]!; // rosa claro
      case 'coffee':
        return const Color(0xFFF3E9DD); // café claro
      case 'pizza':
        return const Color(0xFFF1F6E5); // verde claro
      case 'juices':
        return const Color(0xFFFFF4D6); // naranja claro
      default:
        return Colors.pink[50]!;
    }
  }

  // Función para obtener el color principal según la categoría
  Color _getCategoryColor(String categoryId) {
    switch (categoryId) {
      case 'donuts':
        return Colors.pink;
      case 'coffee':
        return const Color(0xFF8B5E3C); // café marrón
      case 'pizza':
        return const Color(0xFF5A7D3B); // verde
      case 'juices':
        return const Color(0xFFE09F1F); // naranja
      default:
        return Colors.pink;
    }
  }

  @override
  Widget build(BuildContext context) {
    final categoryProvider = Provider.of<CategoryProvider>(context);
    
    // Lista expandida de productos con diferentes categorías
    final List<Product> allProducts = [
      // Donuts
      Product(
        id: 'p1',
        name: "Chocolate Donut",
        price: 25.0,
        imagePath: 'assets/images/DonasChocolate.png',
        category: "donuts",
        description: "Rich chocolate-glazed donut with a soft, fluffy texture and premium cocoa flavor",
      ),
      Product(
        id: 'p2',
        name: "Strawberry Donut",
        price: 28.0,
        imagePath: 'assets/images/DonaFresa.png',
        category: "donuts",
        description: "Sweet strawberry-frosted donut with natural fruit flavor and colorful sprinkles",
      ),
      Product(
        id: 'p3',
        name: "Glazed Donut",
        price: 22.0,
        imagePath: 'assets/images/DonaGlasseada.png',
        category: "donuts",
        description: "Classic vanilla-glazed donut with a perfect balance of sweetness and lightness",
      ),
      Product(
        id: 'p4',
        name: "Cream Filled Donut",
        price: 32.0,
        imagePath: 'assets/images/DonaLechera.png',
        category: "donuts",
        description: "Traditional donut filled with smooth vanilla cream and topped with powdered sugar",
      ),
      Product(
        id: 'p5',
        name: "Chocolate Chip Donut",
        price: 30.0,
        imagePath: 'assets/images/DonaChispas.png',
        category: "donuts",
        description: "Delicious donut loaded with premium chocolate chips and a hint of vanilla",
      ),
      Product(
        id: 'p6',
        name: "Taro Donut",
        price: 35.0,
        imagePath: 'assets/images/DonaTaro.png',
        category: "donuts",
        description: "Unique purple taro-flavored donut with authentic Asian-inspired taste",
      ),
      
      // Coffee & Frappes
      Product(
        id: 'c1',
        name: "Americano Coffee",
        price: 35.0,
        imagePath: 'assets/images/CafeAmericano.png',
        category: "coffee",
        description: "Classic American-style coffee with rich, bold flavor and smooth finish",
      ),
      Product(
        id: 'c2',
        name: "Cappuccino",
        price: 45.0,
        imagePath: 'assets/images/Cappuccino.png',
        category: "coffee",
        description: "Perfectly balanced espresso with steamed milk and luxurious foam art",
      ),
      Product(
        id: 'c3',
        name: "Café Latte",
        price: 50.0,
        imagePath: 'assets/images/Latte.png',
        category: "coffee",
        description: "Smooth espresso with creamy steamed milk and delicate latte art",
      ),
      Product(
        id: 'c4',
        name: "Espresso",
        price: 30.0,
        imagePath: 'assets/images/Espresso.png',
        category: "coffee",
        description: "Intense, aromatic espresso shot with rich crema and bold flavor",
      ),
      Product(
        id: 'c5',
        name: "Black Coffee",
        price: 32.0,
        imagePath: 'assets/images/CafeNegro.png',
        category: "coffee",
        description: "Strong, full-bodied black coffee with deep, robust character",
      ),
      Product(
        id: 'c6',
        name: "Chocolate Frappe",
        price: 55.0,
        imagePath: 'assets/images/FrapeChocolate.png',
        category: "coffee",
        description: "Refreshing cold chocolate frappe with whipped cream and chocolate drizzle",
      ),
      Product(
        id: 'c7',
        name: "Classic Frappuccino",
        price: 60.0,
        imagePath: 'assets/images/FrapeFrappuccino.png',
        category: "coffee",
        description: "Signature blended coffee drink with ice, milk, and sweet coffee flavor",
      ),
      Product(
        id: 'c8',
        name: "Strawberry Frappe",
        price: 58.0,
        imagePath: 'assets/images/FrapeFresa.png',
        category: "coffee",
        description: "Delicious strawberry frappe with real fruit puree and creamy texture",
      ),
      
      // Pizzas & Pastas
      Product(
        id: 'z1',
        name: "Margherita Pizza",
        price: 180.0,
        imagePath: 'assets/images/PizzaMargherita.png',
        category: "pizza",
        description: "Classic Italian pizza with fresh tomatoes, mozzarella, and basil",
      ),
      Product(
        id: 'z2',
        name: "Pepperoni Pizza",
        price: 200.0,
        imagePath: 'assets/images/PizzaPeperoni.png',
        category: "pizza",
        description: "Spicy pepperoni pizza with premium cheese and crispy crust",
      ),
      Product(
        id: 'z3',
        name: "Hawaiian Pizza",
        price: 220.0,
        imagePath: 'assets/images/PizzaHawaiana.png',
        category: "pizza",
        description: "Tropical pizza with ham, pineapple, and melted cheese",
      ),
      
      // Pastas
      Product(
        id: 'pa1',
        name: "Creamy Cheese Pasta",
        price: 120.0,
        imagePath: 'assets/images/PastaQueso.png',
        category: "pizza",
        description: "Rich and creamy pasta with three types of cheese and herbs",
      ),
      Product(
        id: 'pa2',
        name: "Traditional Ramen",
        price: 140.0,
        imagePath: 'assets/images/PastaRamen.png',
        category: "pizza",
        description: "Authentic Japanese ramen with rich broth and fresh noodles",
      ),
      Product(
        id: 'pa3',
        name: "Spaghetti Bolognese",
        price: 130.0,
        imagePath: 'assets/images/PastaSpaguettiBoloniesa.png',
        category: "pizza",
        description: "Classic Italian spaghetti with slow-cooked meat sauce",
      ),
      Product(
        id: 'pa4',
        name: "Tomatillo Pasta",
        price: 125.0,
        imagePath: 'assets/images/PastaTomatillos.png',
        category: "pizza",
        description: "Mexican-inspired pasta with tangy tomatillo sauce and spices",
      ),
      
      // Fresh Juices
      Product(
        id: 'j1',
        name: "Fresh Orange Juice",
        price: 45.0,
        imagePath: 'assets/images/JugoNaranja.png',
        category: "juices",
        description: "Freshly squeezed orange juice with natural sweetness and vitamin C",
      ),
      Product(
        id: 'j2',
        name: "Apple Juice",
        price: 42.0,
        imagePath: 'assets/images/JugoManzana.png',
        category: "juices",
        description: "Pure apple juice made from fresh, crisp apples",
      ),
      Product(
        id: 'j3',
        name: "Pineapple Juice",
        price: 48.0,
        imagePath: 'assets/images/JugoPina.png',
        category: "juices",
        description: "Tropical pineapple juice with sweet and tangy flavor",
      ),
      Product(
        id: 'j4',
        name: "Strawberry Juice",
        price: 52.0,
        imagePath: 'assets/images/JugoFresa.png',
        category: "juices",
        description: "Sweet strawberry juice with natural fruit flavor and antioxidants",
      ),
      Product(
        id: 'j5',
        name: "Lemon Juice",
        price: 38.0,
        imagePath: 'assets/images/JugoLimon.png',
        category: "juices",
        description: "Refreshing lemon juice with natural citrus flavor and vitamin C",
      ),
      Product(
        id: 'j6',
        name: "Mango Juice",
        price: 55.0,
        imagePath: 'assets/images/JugoMango.png',
        category: "juices",
        description: "Tropical mango juice with rich, creamy texture and sweet flavor",
      ),
      Product(
        id: 'j7',
        name: "Watermelon Juice",
        price: 50.0,
        imagePath: 'assets/images/JugoSandia.png',
        category: "juices",
        description: "Refreshing watermelon juice with natural sweetness and hydration",
      ),
      Product(
        id: 'j8',
        name: "Grape Juice",
        price: 58.0,
        imagePath: 'assets/images/JugoUva.png',
        category: "juices",
        description: "Sweet grape juice with rich flavor and natural antioxidants",
      ),
    ];

    // Filtrar productos por categoría seleccionada
    final filteredProducts = allProducts.where((product) => 
      product.category == categoryProvider.selectedCategoryId
    ).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Donut Shop",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            fontFamily: 'Roboto',
          ),
        ),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        actions: [
          Consumer<CartProvider>(
            builder: (context, cart, child) {
              return Stack(
                children: [
                  IconButton(
                    icon: const Icon(Icons.shopping_cart),
                    onPressed: () {
                      Navigator.pushNamed(context, CartScreen.routeName);
                    },
                  ),
                  if (cart.items.isNotEmpty)
                    Positioned(
                      right: 8,
                      top: 8,
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        constraints: const BoxConstraints(
                          minWidth: 16,
                          minHeight: 16,
                        ),
                        child: Text(
                          '${cart.items.length}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Barra de categorías
          Container(
            height: 60,
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: categoryProvider.categories.length,
              itemBuilder: (ctx, index) {
                final category = categoryProvider.categories[index];
                return CategoryItem(
                  category: category,
                  isSelected: category.id == categoryProvider.selectedCategoryId,
                  onTap: () {
                    categoryProvider.selectCategory(category.id);
                  },
                );
              },
            ),
          ),
          
          // Lista de productos filtrados
          Expanded(
            child: filteredProducts.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search_off,
                          size: 80,
                          color: Colors.grey[400],
                        ),
                        const SizedBox(height: 16),
                        Text(
                          "No products in this category",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  )
                : GridView.builder(
                    padding: const EdgeInsets.all(16),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 3 / 4,
                    ),
                    itemCount: filteredProducts.length,
                    itemBuilder: (ctx, i) {
                      final product = filteredProducts[i];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => DetailScreen(product: product),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: _getCategoryBackgroundColor(product.category),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.1),
                                spreadRadius: 1,
                                blurRadius: 3,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  product.imagePath, 
                                  height: 80,
                                  width: 80,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                child: Text(
                                  product.name,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                "MX\$${product.price.toStringAsFixed(2)}",
                                style: TextStyle(
                                  fontSize: 16, 
                                  color: _getCategoryColor(product.category),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Consumer<CartProvider>(
                                builder: (context, cart, child) {
                                  return ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: _getCategoryColor(product.category),
                                      foregroundColor: Colors.white,
                                      padding: const EdgeInsets.symmetric(vertical: 8),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    onPressed: () {
                                      cart.addItem(product);
                                      ScaffoldMessenger.of(context)
                                        ..hideCurrentSnackBar()
                                        ..showSnackBar(
                                          SnackBar(
                                            content: Text("${product.name} added to cart"),
                                            duration: const Duration(milliseconds: 900),
                                            backgroundColor: Colors.black.withOpacity(0.85),
                                            behavior: SnackBarBehavior.floating,
                                            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                          ),
                                        );
                                    },
                                    child: const Text("Add", style: TextStyle(fontSize: 12)),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
