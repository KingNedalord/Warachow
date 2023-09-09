import 'package:hive/hive.dart';

part 'wishlist_adapter.g.dart';
@HiveType(typeId: 2)
class Wishlist{
  @HiveField(0)
  String meal_label;
  @HiveField(1)
  int price;
  @HiveField(2)
  String image;
  @HiveField(3)
  int amount;
  @HiveField(4)
  int meal_index;

  Wishlist({required this.meal_label,required this.price,required this.image,required this.amount,required this.meal_index});
}