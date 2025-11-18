class Fact {
  String fact;
  int length;

  Fact({required this.fact,required this.length});

  factory Fact.fromJson(Map<String,dynamic> json) {

    return Fact(fact: json['fact'], length: json['length']);
  }
}

