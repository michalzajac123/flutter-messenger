import 'package:flutter/material.dart';
import 'package:flutter1project/common_widgets/app_button.dart';
import 'package:flutter1project/screens/messenger/messenger_screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) => Scaffold(
    body: SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
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
                const SizedBox(height: 20),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: "Adres e-mail",
                    prefixIcon: SizedBox(
                      child: Icon(Icons.email, color: Colors.blueGrey),
                    ),
                  ),
                  validator: (value) {
                    //tutaj piszemy logike walidacji rego pola tekstowego
                    if (value != null && value.isEmpty) {
                      return "To pole nie moze byc puste";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    hintText: "Hasło",
                    prefixIcon: SizedBox(
                      child: Icon(Icons.lock, color: Colors.blueGrey),
                    ),
                  ),
                  obscureText: true,
                  validator: (value) {
                    //tutaj piszemy logike walidacji rego pola tekstowego
                    if (value != null && value.isEmpty) {
                      return "To pole nie moze byc puste";
                    }
                    if (value != null && value.length < 6) {
                      return "Hasło musi mieć conajmniej 6 znaków";
                    }
                    return null;
                  },
                ),
            
                const SizedBox(height: 20),
                AppButton(title: "Zaloguj się", onPressed: (){
                  if(_formKey.currentState!.validate()){
                    loginUser();
                  }
                }, isLoading: false),
                Spacer(),
                InkWell(
                  onTap: () => {
                    Navigator.pop(context),
                  },
                  child: Text(
                    "Powrót do rejestracji",
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
  Future<void> loginUser() async {
    try{
      setState(() {
        isLoading = true;
      });
      final supabase = Supabase.instance.client;
      final email = _emailController.text;
      final password = _passwordController.text;

      final response = await supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Zalogowano pomyślnie!")),
      );

      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const MessengerScreen()),
      (Route<dynamic> route) => false,
      );
      setState(() {
        isLoading = false;
      });
    } catch (error) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error during login: $error")),
      );
    }
  }
}
