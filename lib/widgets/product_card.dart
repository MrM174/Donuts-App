import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../providers/cart_provider.dart';
import '../screens/detail_screen.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context, listen: false);

    Color accentForCategory(String id) {
      switch (id) {
        case 'donuts':
          return Colors.pink;
        case 'coffee':
          return const Color(0xFF8B5E3C);
        case 'pizza':
          return const Color(0xFF5A7D3B);
        case 'juices':
          return const Color(0xFFE09F1F);
        default:
          return Colors.black;
      }
    }

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => DetailScreen(product: product),
          ),
        );
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.pink.withOpacity(0.2),
              blurRadius: 6,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Center(
                  child: Image.asset(product.imagePath, height: 90, fit: BoxFit.contain),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                product.name,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              Text(
                "\$${product.price.toStringAsFixed(2)}",
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: accentForCategory(product.category),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 10),
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
                child: const Text("Add to Cart"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
