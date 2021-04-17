import 'package:flutter/material.dart';
import 'package:poke_flutter/models/simplified_pokemon.dart';
import 'package:poke_flutter/providers/pokemon_provider.dart';
import 'package:poke_flutter/widgets/custom_appbar.dart';

class PokemonScreen extends StatelessWidget {
  static String routeName = 'pokemon';
  final PokemonProvider pokemonProvider = PokemonProvider();

  @override
  Widget build(BuildContext context) {
    final SimplifiedPokemon simplifiedPokemon = ModalRoute.of(context).settings.arguments;
    pokemonProvider.getPokemonById(simplifiedPokemon.id);
    return Scaffold(
      appBar: CustomAppBar(
        titleText: simplifiedPokemon.name,
        backgroundColor: simplifiedPokemon.color,
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            PokemonHeader(),
          ],
        ),
      ),
    );
  }
}

class PokemonHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final SimplifiedPokemon simplifiedPokemon = ModalRoute.of(context).settings.arguments;
    return Stack(
      clipBehavior: Clip.none,
      alignment: AlignmentDirectional.bottomCenter,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(200.0),
            bottomRight: Radius.circular(200.0),
          ),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2.4,
            color: simplifiedPokemon.color,
          ),
        ),
        Image.asset(
          'assets/pokebola-blanca.png',
          width: 300,
          height: 300,
        ),
        Positioned(
          top: 80.0,
          child: Image.network(
            simplifiedPokemon.picture,
            width: 310.0,
            height: 310.0,
          ),
        ),
      ],
    );
  }
}
