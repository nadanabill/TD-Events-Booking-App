class CategoryModel {
  final String name;
  final String icon;
  final int color;

  CategoryModel({required this.name, required this.icon, required this.color});
}

List<CategoryModel> categories = [
  CategoryModel(
    name: 'Sports',
    icon: 'assets/svgs/sport.svg',
    color: 0xff862D28,
  ),
  CategoryModel(
    name: 'Music',
    icon: 'assets/svgs/music.svg',
    color: 0xFF524037,
  ),
  CategoryModel(
    name: 'Food',
    icon: 'assets/svgs/food.svg',
    color: 0xFF29D697,
  ),
];
