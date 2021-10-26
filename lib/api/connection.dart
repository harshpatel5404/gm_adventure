import 'dart:convert';

import 'package:get/get.dart';
import 'package:gm_adventure/controller/getcontroller.dart';
import 'package:gm_adventure/model/allgameresponse.dart';
import 'package:gm_adventure/model/topgamesresponse.dart';
import 'package:http/http.dart' as http;

const baseURL = "https://kurminfotech.in/gamemania/";

Future<TopGame?> getTopGame() async {
  final response = await http.get(Uri.parse(baseURL + 'api/GetTopGames'));

  if (response.statusCode == 200) {
    var jsonString = response.body;
    TopGame topgame =  TopGame.fromJson(jsonString);
    return topgame;
  } else {
    return null;
  }
}
Future<AllGamesResponse?> getAllGame() async {
  final response = await http.post(Uri.parse(baseURL + 'api/CatWiseGames'),
   headers: {
      "Content-Type": "application/json",
    },
     body: json.encode({'cat_id': 7}),
     encoding : Encoding.getByName('utf-8')
  );

  if (response.statusCode == 200) {
    var jsonString = response.body;
    AllGamesResponse allgame =  AllGamesResponse.fromJson(jsonString);
    return allgame;
  } else {
    return null;
    // throw Exception('Failed to load album');
  }
}
