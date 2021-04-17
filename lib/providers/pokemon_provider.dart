import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:poke_flutter/models/pokemon.dart';
import 'package:poke_flutter/models/pokemon_pagination.dart';
import 'package:poke_flutter/models/simplified_pokemon.dart';
import 'package:palette_generator/palette_generator.dart';

class PokemonProvider {
  String baseUrl = 'pokeapi.co';
  String officialArtWorkUrl =
      'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/';

  Future<Pokemon> getPokemonById(String id) async {
    final Uri url = Uri.https(baseUrl, '/api/v2/pokemon/$id/');
    final res = await http.get(url).then(
          (response) => Pokemon.fromJson(convert.json.decode(response.body)),
        );
    print(res);
    return res;
  }

  Future<List<SimplifiedPokemon>> getPokemons() async {
    final Uri url = Uri.https(baseUrl, '/api/v2/pokemon');
    final PokemonPagination res = await http
        .get(url)
        .then((response) => PokemonPagination.fromJson(convert.json.decode(response.body)));

    final List<Future<SimplifiedPokemon>> futureList = res.results.map((e) async {
      List<String> urlParts = e.url.split('/');
      String id = urlParts[urlParts.length - 2];
      String picture = officialArtWorkUrl + id + '.png';
      Color color = await getColorFromImage(picture);
      return SimplifiedPokemon(
        name: capitalize(e.name),
        url: e.url,
        id: id,
        picture: picture,
        color: color,
      );
    }).toList();

    final List<SimplifiedPokemon> pokemons = await Future.wait(futureList);
    return pokemons;
  }

  Future<Color> getColorFromImage(String url) async {
    final paletteGenerator = await PaletteGenerator.fromImageProvider(
      Image.network(
        url,
      ).image,
    );
    return paletteGenerator.dominantColor.color;
  }

  String capitalize(String string) {
    if (string.isEmpty) {
      return string;
    }
    return string[0].toUpperCase() + string.substring(1);
  }
}
