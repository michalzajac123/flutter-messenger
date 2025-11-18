import 'dart:convert';

import 'package:flutter/material.dart';
import "package:http/http.dart" as http;

import '../entities/fact.dart';

class CatFactsSection extends StatefulWidget {
  const CatFactsSection({super.key});

  @override
  State<CatFactsSection> createState() => _CatFactsSectionState();
}

class _CatFactsSectionState extends State<CatFactsSection> {
  bool isLoading = true;
  bool isError = false;
  List<Fact>? randomFacts = [];
  String? randomFact;
  @override
  void initState() {
    // fetchRandomCatFact();
    fetchRandomCatFacts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (isError) {
      return Text("Blad ladowania");
    }
    if (randomFacts != null && randomFacts!.isNotEmpty) {
      return ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(randomFacts![index].fact),
          );
        },
        itemCount: randomFacts!.length,
      );
    }
    if (randomFact != null) {
      return Text(randomFact!);
    }
    if (isLoading) {
      return CircularProgressIndicator(color: Colors.pink);
    }
    return Text("Zaladowno dane");
  }

  Future<void> fetchRandomCatFacts() async {
    try {
      final baseUrl = "https://catfact.ninja/facts?limit=10";
      final parsedUrl = Uri.parse(baseUrl);

      final response = await http.get(parsedUrl);
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final factsData = data["data"] as List;
        final mappedFacts = factsData
            .map((fact) => Fact.fromJson(fact))
            .toList();
        setState(() {
          randomFacts = mappedFacts;
          isLoading = false;
        });
      }
    } catch (err) {
      setState(() {
        isError = true;
      });
    }
  }

  Future<void> fetchRandomCatFact() async {
    try {
      final baseUrl = "https://catfact.ninja/fact";
      final parsedUrl = Uri.parse(baseUrl);

      final response = await http.get(parsedUrl);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final parsedData = Fact.fromJson(data);
        setState(() {
          randomFact = parsedData.fact;
        });
      }
    } catch (err) {
      setState(() {
        isError = true;
      });
    }
    // tutaj bedzie logika pobierania faktu o kotach
  }
}
