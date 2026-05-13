import 'package:flowza/models/list_category_model.dart';
import 'package:flowza/widgets/category_container.dart';
import 'package:flutter/material.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({
    super.key,
    required this.onTap,
    required this.selectedCategory,
  });

  final Function(int) onTap;
  final int selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(ListCategoryModel.categorylist.length, (index) {
        return Expanded(
          child: CategoryContainer(
            text: ListCategoryModel.categorylist[index],
            selected: selectedCategory == index,
            onTap: () => onTap(index),
          ),
        );
      }),
    );
  }
}
