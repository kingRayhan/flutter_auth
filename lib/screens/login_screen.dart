import 'package:flutter/material.dart';
import 'package:flutter_form/api/auth.api.dart';
import 'package:form_validator/form_validator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _pageHeader(),
                const SizedBox(height: 35.0),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                      icon: Icon(Icons.email),
                      labelText: "Email",
                      border: OutlineInputBorder()),
                  validator: ValidationBuilder().required().email().build(),
                ),
                const SizedBox(height: 18.0),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  validator:
                      ValidationBuilder().required().minLength(6).build(),
                  decoration: const InputDecoration(
                      icon: Icon(Icons.lock),
                      labelText: "Password",
                      border: OutlineInputBorder()),
                ),
                const SizedBox(height: 10.0),
                ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        // Navigator.pushNamed(context, 'home');
                        var _api = AuthApi();
                        try {
                          var res = await _api.login(
                              email: _emailController.text,
                              password: _passwordController.text);
                          print(res);
                        } catch (e) {
                          print("Something went wrong: $e");
                        }

                        return;
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Form is valid")));
                      }
                    },
                    child: const Text("Login"))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column _pageHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Login".toUpperCase(),
          style: const TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
        ),
        Text(
          "Login to your account".toUpperCase(),
          style: const TextStyle(
              fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.green),
        )
      ],
    );
  }
}
