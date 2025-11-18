import "package:flutter/material.dart";
import "package:flutter1project/common_widgets/app_button.dart";

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
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
                  controller: _emailController,
                  decoration: InputDecoration(hintText: "Adres e-mail"),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(hintText: "Hasło"),
                  obscureText: true,
                ),

                const SizedBox(height: 20),
                AppButton(title: "Zarejestruj sie"),
                const Spacer(),
                InkWell(
                  onTap: () => {print("dd")},
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
}
