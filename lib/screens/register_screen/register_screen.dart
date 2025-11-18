import "package:flutter/material.dart";
import "package:flutter1project/common_widgets/app_button.dart";
import "package:supabase_flutter/supabase_flutter.dart";

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(
                    "https://cdn.freebiesupply.com/logos/large/2x/facebook-messenger-logo-png-transparent.png",
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Messenger",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 20),
                Text(
                  "Czatuj ze znajomymi i dziel sie chwilami",
                  style: TextStyle(fontSize: 16, color: Colors.blueGrey),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(hintText: "Imie",
                  prefixIcon: SizedBox(child: Icon(Icons.person,color: Colors.blueGrey,),)),
                  validator: (value) {
                    //tutaj piszemy logike walidacji rego pola tekstowego
                    if(value !=null &&value.isEmpty) {
                      return "To pole nie moze byc puste";
                    }
                    if(value != null && value.length < 3) {
                      return "Imie musi mieć conajmniej 3 znaki";
                    }
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(hintText: "Adres e-mail",
                  prefixIcon: SizedBox(child: Icon(Icons.email,color: Colors.blueGrey,),)),
                  validator: (value) {
                    //tutaj piszemy logike walidacji rego pola tekstowego
                    if(value !=null &&value.isEmpty) {
                      return "To pole nie moze byc puste";
                    }
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(hintText: "Hasło",
                  prefixIcon: SizedBox(child: Icon(Icons.lock,color: Colors.blueGrey,),)),
                  obscureText: true,
                  validator: (value) {
                    //tutaj piszemy logike walidacji rego pola tekstowego
                    if(value !=null &&value.isEmpty) {
                      return "To pole nie moze byc puste";
                    }
                    if(value != null && value.length < 6) {
                      return "Hasło musi mieć conajmniej 6 znaków";
                    }
                  }
                ),

                const SizedBox(height: 20),
                AppButton(title: "Zarejestruj sie", onPressed:() {
                  if(_formKey.currentState!.validate()) {
                    registerUser();
                  }
                },isLoading: isLoading,),
                const Spacer(),
                InkWell(
                  onTap: () => {},
                  child: Text(
                    "Zaloguj sie ",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF0084FF),
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                      decorationColor: Color(0xFF0084FF),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
  
  Future<void> registerUser() async {
    try {
      setState(() {
        isLoading = true;
      });
      final supabaseInstance = Supabase.instance.client;
      final String email = _emailController.text.trim();
      final String password = _passwordController.text;

      await supabaseInstance.auth.signUp(password: password,email: email);
      
    } catch (err) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Błąd rejestracji: $err")),
      );
    }
  }
}
