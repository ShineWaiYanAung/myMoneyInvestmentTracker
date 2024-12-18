import 'dart:io';

import 'package:hive/hive.dart';
part 'user_name.g.dart';
@HiveType(typeId: 20)
class UserName extends HiveObject{
  @HiveField(21)
  final String name;
  @HiveField(24)
  final File? profileImage;
  @HiveField(22)
  UserName({required this.name,this.profileImage});
}