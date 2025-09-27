import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  static const String routeName = '/pay';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.grey[100],
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Order summary',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  ...cart.items.values.map((ci) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 6),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                '${ci.quantity} x ${ci.product.name}',
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Text('MX\$${(ci.product.price * ci.quantity).toStringAsFixed(2)}'),
                          ],
                        ),
                      )),
                  const Divider(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'MX\$${cart.totalAmount.toStringAsFixed(2)}',
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            ElevatedButton.icon(
              onPressed: () async {
                // Simulate a quick payment without data entry
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (_) => const Center(
                    child: CircularProgressIndicator(color: Colors.black),
                  ),
                );
                await Future.delayed(const Duration(seconds: 2));
                if (context.mounted) Navigator.pop(context); // close loader
                if (!context.mounted) return;
                cart.clearCart();
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      content: const Text('Payment successful!'),
                      duration: const Duration(seconds: 2),
                      backgroundColor: Colors.black,
                      behavior: SnackBarBehavior.floating,
                      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                  );
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              icon: const Icon(Icons.lock_outline),
              label: const Text('Pay now'),
            ),
          ],
        ),
      ),
    );
  }
}






