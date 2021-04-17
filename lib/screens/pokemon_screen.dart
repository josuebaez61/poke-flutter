import 'package:flutter/material.dart';
import 'package:poke_flutter/helpers/functions.dart';
import 'package:poke_flutter/models/pokemon.dart';
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
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _PokemonHeader(),
            _PokemonDescription(
              pokemonId: simplifiedPokemon.id,
            ),
          ],
        ),
      ),
    );
  }
}

class _PokemonHeader extends StatelessWidget {
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

class _PokemonDescription extends StatelessWidget {
  final PokemonProvider pokemonProvider = PokemonProvider();
  final String pokemonId;

  _PokemonDescription({@required this.pokemonId});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40.0),
      child: FutureBuilder(
        future: pokemonProvider.getPokemonById(pokemonId),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            Pokemon pokemon = snapshot.data;
            List<Ability> abilitiesArray = pokemon.abilities;
            List<Type> typesArray = pokemon.types;

            String joinedAbilities =
                abilitiesArray.map((ab) => capitalize(ab.ability.name)).toList().join(', ');

            String joinedTypes =
                typesArray.map((ab) => capitalize(ab.type.name)).toList().join(', ');

            return Container(
              padding: EdgeInsets.symmetric(horizontal: 5.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Types',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      Text(
                        joinedTypes,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'Abilities',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      Text(
                        joinedAbilities,
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        'Weight',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      Text(
                        pokemon.weight.toString(),
                      ),
                    ],
                  ),
                ],
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
