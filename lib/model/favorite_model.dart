import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
part 'favorite_model.g.dart';
 
@HiveType(typeId: 0)
class FavoriteGame{
 
  @HiveField(0)
  final id;
 
  @HiveField(1)
  final name;

  @HiveField(2)
  final website;

  @HiveField(3)
  final image;

  @HiveField(4)
  final description;

  @HiveField(5)
  final icon;

  FavoriteGame({this.description, this.icon, this.id, this.website, this.name, this.image});
}
 