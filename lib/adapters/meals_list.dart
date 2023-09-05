import 'package:hive/hive.dart';

part 'meals_list.g.dart';
@HiveType(typeId: 1)
class Meals_list{
  @HiveField(0)
  String meal_label;
  @HiveField(1)
  int price;
  @HiveField(2)
  String image;

  Meals_list({required this.meal_label,required this.price,required this.image});
}