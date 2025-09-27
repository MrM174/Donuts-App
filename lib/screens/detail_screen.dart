import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../providers/cart_provider.dart';

class DetailScreen extends StatefulWidget {
  final Product product;

  const DetailScreen({super.key, required this.product});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context, listen: false);

    Color backgroundByCategory(String id) {
      switch (id) {
        case 'donuts':
          return Colors.pink[50]!;
        case 'coffee':
          return const Color(0xFFF3E9DD);
        case 'pizza':
          return const Color(0xFFF1F6E5);
        case 'juices':
          return const Color(0xFFFFF4D6);
        default:
          return Colors.white;
      }
    }

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

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.product.name,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            fontFamily: 'Roboto',
          ),
        ),
        backgroundColor: Colors.black,
        elevation: 0,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      backgroundColor: backgroundByCategory(widget.product.category),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: Image.asset(widget.product.imagePath, height: 200)),
            const SizedBox(height: 20),
            Text(
              widget.product.name,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              "MX\$${widget.product.price.toStringAsFixed(2)}",
              style: const TextStyle(fontSize: 22, color: Colors.grey),
            ),
            const SizedBox(height: 20),
            Text(
              widget.product.description.isNotEmpty
                  ? widget.product.description
                  : 'A delicious ${widget.product.name}.',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 30),
            
            // Selector de cantidad
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.black12),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Quantity:",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(width: 15),
                  IconButton(
                    onPressed: quantity > 1 ? () {
                      setState(() {
                        quantity--;
                      });
                    } : null,
                    icon: Icon(
                      Icons.remove_circle_outline,
                      color: quantity > 1 ? Colors.pink : Colors.grey,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.black12),
                    ),
                    child: Text(
                      quantity.toString(),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        quantity++;
                      });
                    },
                    icon: const Icon(
                      Icons.add_circle_outline,
                      color: Colors.pink,
                    ),
                  ),
                ],
              ),
            ),
            
            const Spacer(),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: accentForCategory(widget.product.category),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 50,
                  vertical: 12,
                ),
              ),
              icon: const Icon(Icons.add_shopping_cart),
              label: Text("Add $quantity to cart"),
              onPressed: () {
                cart.addItemWithQuantity(widget.product, quantity);
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      content: Text("$quantity ${widget.product.name} added to cart"),
                      duration: const Duration(milliseconds: 900),
                      backgroundColor: Colors.black.withOpacity(0.85),
                      behavior: SnackBarBehavior.floating,
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                  );
                // Resetear cantidad después de agregar
                setState(() {
                  quantity = 1;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
