import 'package:flutter/material.dart';
import 'package:flutter1project/screens/cat_fact_screen/widgets/cat_facts_section.dart';

class CatFactsScreen extends StatelessWidget {
  const CatFactsScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(child: Center(child: CatFactsSection()))
  );
}