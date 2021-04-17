import 'package:flutter/material.dart';
import 'package:poke_flutter/screens/home_screen.dart';
import 'package:poke_flutter/screens/pokemon_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PokeFlutter',
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (BuildContext context) => HomeScreen(),
        PokemonScreen.routeName: (BuildContext context) => PokemonScreen(),
      },
      // home: Scaffold(
      //   appBar: AppBar(
      //     actions: [
      //       IconButton(
      //         icon: Icon(Icons.search),
      //         onPressed: () {},
      //       ),
      //     ],
      //     title: Text('PokeFlutter'),
      //   ),
      //   body: Center(
      //     child: Container(
      //       child: Text('Hello World'),
      //     ),
      //   ),
      // ),
    );
  }
}
