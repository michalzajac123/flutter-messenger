import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter1project/screens/pokemon_screen/entities/pokemon.dart';
import "package:http/http.dart" as http;

class PokemonSection extends StatefulWidget {
  const PokemonSection({super.key});

  @override
  State<PokemonSection> createState() => _PokemonSectionState();
}

class _PokemonSectionState extends State<PokemonSection> {
  bool isLoading = true;
  bool isError = false;
  List<Pokemon>? pokemonList;
  @override
  void initState() {
    fetchPokemonData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (isError) {
      return Text("Nie udalo sie zaladowac danych");
    }
    if (pokemonList != null && pokemonList!.isNotEmpty) {
      return ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(pokemonList![index].name),
          );
        },
        itemCount: pokemonList!.length,
      );
    }
    if (isLoading) {
      return CircularProgressIndicator(color: Colors.red);
    }
    return Text("Zaladowno dane");
  }

  Future<void> fetchPokemonData() async {
    try {
      final baseUrl = "https://pokeapi.co/api/v2/pokemon?limit=10";
      final parsedUrl = Uri.parse(baseUrl);

      final response = await http.get(parsedUrl);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final pokemonData = data["results"] as List;
        final mappedPokemonList = pokemonData
            .map((pokemon) => Pokemon.fromJson(pokemon))
            .toList();
        setState(() {
          pokemonList = mappedPokemonList;
        });
      }
    } catch (err) {
      setState(() {
        isError = true;
      });
    }
  }
  Future<void> fetchImages(String url,int index) async {
    final parsedUrl = Uri.parse(url);

    final response = await http.get(parsedUrl);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final imageData = data["sprites"]["front_default"] as String;

        setState(() {
          pokemonList![index].url=imageData;
        });
      }

  }
}
