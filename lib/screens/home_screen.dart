import 'package:flutter/material.dart';
import 'package:poke_flutter/models/simplified_pokemon.dart';
import 'package:poke_flutter/providers/pokemon_provider.dart';
import 'package:poke_flutter/widgets/custom_appbar.dart';
import 'package:poke_flutter/widgets/pokeball_loading.dart';
import 'package:poke_flutter/widgets/pokemon_card.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = 'home';
  @override
  Widget build(BuildContext context) {
    PokemonProvider pokemonProvider = PokemonProvider();
    return Scaffold(
      appBar: CustomAppBar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
        child: FutureBuilder(
          future: pokemonProvider.getPokemons(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return _PokemonsGrid(pokemons: snapshot.data);
            } else {
              return PokeballLoading();
            }
          },
        ),
      ),
    );
  }
}

class _PokemonsGrid extends StatelessWidget {
  final List<SimplifiedPokemon> pokemons;

  _PokemonsGrid({@required this.pokemons});

  @override
  Widget build(BuildContext context) {
    final List<TableRow> rows = [];
    for (var i = 0; i < pokemons.length; i++) {
      rows.add(
        TableRow(
          children: [
            PokemonCard(pokemons[i]),
            PokemonCard(pokemons[i != 19 ? i + 1 : i]),
          ],
        ),
      );
      i += 1;
    }

    return SingleChildScrollView(
      child: Table(
        children: rows,
      ),
    );
  }
}
