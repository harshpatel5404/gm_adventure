import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
part 'favorite_model.g.dart';
 
@HiveType(typeId: 0)
class FavoriteGame{
 
  @HiveField(0)
  final name;
 
  @HiveField(1)
  final image;

  FavoriteGame({this.name, this.image});
}
 