// ignore_for_file: file_names

class Category {
  final int categoryId;
  final String categoryName;
  bool isSelected;

  Category({
    required this.categoryId,
    required this.categoryName,
    bool? isSelected,
  }) : isSelected = isSelected ?? false;
}
