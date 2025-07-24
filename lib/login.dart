import 'package:flutter/material.dart';
import 'main.dart';
import 'register.dart';
import 'service_provider_register.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
        backgroundColor: const Color.fromARGB(255, 213, 119, 230),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 30),
            const Text(
              'Login',
              style: TextStyle(
                fontSize: 35,
                color: Colors.purpleAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    _buildTextField(
                      label: 'Email',
                      icon: Icons.email,
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                    ),
                    const SizedBox(height: 30),
                    _buildTextField(
                      label: 'Password',
                      icon: Icons.password,
                      keyboardType: TextInputType.text,
                      isPassword: true,
                      controller: _passwordController,
                    ),
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              final email = _emailController.text;
                              final password = _passwordController.text;

                              // 👇 Replace this with actual login logic
                              print("Email: $email");
                              print("Password: $password");

                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Login Successful')),
                              );

                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => MainPage()),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(255, 224, 118, 243),
                          ),
                          child: const Text('Login', style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: SizedBox(
                        width: double.infinity,
                        child: OutlinedButton.icon(
                          icon: Image.asset('assets/images/google_logo.png', height: 24, width: 24),
                          label: const Text('Login with Google', style: TextStyle(color: Colors.black)),
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Google login clicked')),
                            );
                          },
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Colors.grey),
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            backgroundColor: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RegisterScreen()),
                        );
                      },
                      child: const Text(
                        "Register as Pet Owner",
                        style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ServiceProviderRegisterScreen()),
                        );
                      },
                      child: const Text(
                        "Register as Service Provider",
                        style: TextStyle(color: Colors.deepPurple, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required IconData icon,
    required TextInputType keyboardType,
    required TextEditingController controller,
    bool isPassword = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword,
        obscuringCharacter: '*',
        keyboardType: keyboardType,
        decoration: InputDecoration(
          labelText: label,
          hintText: 'Enter $label',
          prefixIcon: Icon(icon),
          border: const OutlineInputBorder(),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $label';
          }

          if (label == 'Email') {
            final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
            if (!emailRegex.hasMatch(value)) {
              return 'Please enter a valid email';
            }
          }

          if (label == 'Password') {
            if (value.length < 6) {
              return 'Password must be at least 6 characters';
            }
          }

          return null;
        },
      ),
    );
  }
}
