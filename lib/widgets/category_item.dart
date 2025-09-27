import 'package:flutter/material.dart';
import '../models/category.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  final bool isSelected;
  final VoidCallback onTap;

  const CategoryItem({
    super.key,
    required this.category,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    Color accentForCategory(String id) {
      switch (id) {
        case 'donuts':
          return Colors.pink;
        case 'coffee':
          return const Color(0xFF8B5E3C); // coffee brown
        case 'pizza':
          return const Color(0xFF5A7D3B); // savory green
        case 'juices':
          return const Color(0xFFE09F1F); // citrus orange
        default:
          return Colors.pink;
      }
    }

    final Color accent = accentForCategory(category.id);
    final Color chipBg = isSelected ? accent : Colors.white;
    final Color chipBorder = isSelected ? accent : Colors.grey[300]!;
    final Color iconBg = isSelected ? Colors.white : accent.withOpacity(0.2);
    final Color iconColor = isSelected ? accent : accent;
    final Color textColor = isSelected ? Colors.white : Colors.grey[700]!;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 12),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: chipBg,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: chipBorder,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Icono de la categoría
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                color: iconBg,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                _getCategoryIcon(category.id),
                size: 16,
                color: iconColor,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              category.name,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getCategoryIcon(String categoryId) {
    switch (categoryId) {
      case 'donuts':
        return Icons.donut_large;
      case 'coffee':
        return Icons.local_cafe;
      case 'pizza':
        return Icons.local_pizza;
      case 'juices':
        return Icons.local_drink;
      default:
        return Icons.fastfood;
    }
  }
}

