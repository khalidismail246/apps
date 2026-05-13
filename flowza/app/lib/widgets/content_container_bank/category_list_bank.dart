import 'package:flowza/models/list_category_model.dart';
import 'package:flowza/widgets/category_container.dart';
import 'package:flutter/material.dart';

class CategoryListBank extends StatelessWidget {
  const CategoryListBank({
    super.key,
    required this.onTap,
    required this.selectedCategory,
  });
  final Function(int) onTap;
  final int selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(ListCategoryModel.categorylistBank.length, (
        index,
      ) {
        return Expanded(
          child: CategoryContainer(
            text: ListCategoryModel.categorylistBank[index],
            selected: selectedCategory == index,
            onTap: () => onTap(index),
          ),
        );
      }),
    );
  }
}
