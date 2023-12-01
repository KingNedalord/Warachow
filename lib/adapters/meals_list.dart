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
  @HiveField(3)
  int amount;


  Meals_list({required this.meal_label,required this.price,required this.image,required this.amount,});
}

class Main_Dishes{
  String label;
  int price;
  String image;

  Main_Dishes({required this.label, required this.price,required this.image});
}