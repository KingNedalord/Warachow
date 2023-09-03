import 'package:hive/hive.dart';

part 'information.g.dart';

@HiveType(typeId: 0)
class Information {
  @HiveField(0)
  String name;
  @HiveField(1)
  String password;
  @HiveField(2)
  String email;
  @HiveField(3)
  String date_of_birth;
  @HiveField(4)
  String address;

  Information(
      {required this.name,
      required this.password,
      required this.email,
      required this.date_of_birth,
      required this.address});
}
