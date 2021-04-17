import 'package:flutter/material.dart';
import 'package:poke_flutter/models/simplified_pokemon.dart';
import 'package:poke_flutter/screens/pokemon_screen.dart';

class PokemonCard extends StatelessWidget {
  final SimplifiedPokemon pokemon;

  PokemonCard(this.pokemon);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      width: double.infinity,
      child: Card(
        margin: EdgeInsets.only(right: 5.0, left: 5.0, bottom: 15.0),
        color: pokemon.color != null ? pokemon.color : Color(0xFFFF37371),
        child: InkWell(
          onTap: () {
            print('Hola');
            Navigator.pushNamed(context, PokemonScreen.routeName, arguments: pokemon);
          },
          child: Container(
            padding: EdgeInsets.all(5.0),
            child: Stack(
              children: [
                Transform.translate(
                  offset: Offset(100.0, 15.0),
                  child: FadeInImage(
                    placeholder: AssetImage('assets/who.png'),
                    image: NetworkImage(pokemon.picture),
                    width: 105.0,
                    height: 105.0,
                  ),
                ),
                Text(
                  pokemon.name,
                  style: Theme.of(context).textTheme.subtitle1,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
