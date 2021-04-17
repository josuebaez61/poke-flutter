// To parse this JSON data, do
//
//     final simplifiedPokemon = simplifiedPokemonFromJson(jsonString);

import 'dart:convert';
import 'package:flutter/material.dart';

SimplifiedPokemon simplifiedPokemonFromJson(String str) =>
    SimplifiedPokemon.fromJson(json.decode(str));

String simplifiedPokemonToJson(SimplifiedPokemon data) => json.encode(data.toJson());

class SimplifiedPokemon {
  SimplifiedPokemon({
    this.name,
    this.url,
    this.id,
    this.picture,
    this.color,
  });

  String name;
  String url;
  String id;
  String picture;
  Color color;

  factory SimplifiedPokemon.fromJson(Map<String, dynamic> json) => SimplifiedPokemon(
        name: json["name"],
        url: json["url"],
        id: json["id"],
        picture: json["picture"],
        color: json["color"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
        "id": id,
        "picture": picture,
        "color": color,
      };
}
