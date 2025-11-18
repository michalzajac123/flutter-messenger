import 'package:flutter/material.dart';
import 'package:flutter1project/screens/pokemon_screen/widgets/pokemon_section.dart';

class PokemonScreen extends StatefulWidget {
  const PokemonScreen({super.key});

  @override
  State<PokemonScreen> createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(child: Center(child: PokemonSection())),
  );
}