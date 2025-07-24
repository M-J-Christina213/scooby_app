import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

/// NOTE: Replace this with your own service class or update the import.
import 'package:flutter_application_scooby/user_auth/firebase_auth_services.dart';

/// Entry widget that decides whether to show Login or Main app.
class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const MainPage(); // ✅ replace with your main app page
        }
        return const LoginScreen();
      },
    );
  }
}

/// Common purple gradient used across auth screens.
const List<Color> _purpleGradient = [
  Color(0xFF7F00FF),
  Color(0xFFE100FF),
];

class GradientScaffold extends StatelessWidget {
  const GradientScaffold({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: _purpleGradient,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(child: child),
      ),
    );
  }
}

/// LOGIN SCREEN -------------------------------------------------------------
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _authService = FirebaseAuthService();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _loading = false;

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _loading = true);
    try {
      final user = await _authService.loginUser(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      if (!mounted) return;
      if (user != null) {
        Navigator.of(context).pushReplacement(_fade(const MainPage()));
      }
    } catch (e) {
      if (!mounted) return;
      _showSnack('Login failed: $e');
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _google() async {
    try {
      final google = await GoogleSignIn().signIn();
      if (google == null) return;
      final auth = await google.authentication;
      final cred = GoogleAuthProvider.credential(
          accessToken: auth.accessToken, idToken: auth.idToken);
      await FirebaseAuth.instance.signInWithCredential(cred);
      if (!mounted) return;
      Navigator.of(context).pushReplacement(_fade(const MainPage()));
    } catch (e) {
      if (!mounted) return;
      _showSnack('Google Sign‑In failed: $e');
    }
  }

  void _showSnack(String msg) =>
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GradientScaffold(
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: 'logo',
                child: Image.asset(
                  'assets/images/app_logo.png',
                  height: 120,
                ),
              ),
              const SizedBox(height: 16),
              Text('Welcome Back!',
                  style: GoogleFonts.poppins(
                      color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
              const SizedBox(height: 24),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    _StyledField(
                      controller: _emailController,
                      label: 'Email',
                      icon: Icons.email,
                      validator: (v) => v!.isEmpty ? 'Enter email' : null,
                    ),
                    const SizedBox(height: 16),
                    _StyledField(
                      controller: _passwordController,
                      label: 'Password',
                      icon: Icons.lock,
                      obscure: true,
                      validator: (v) => v!.length < 6 ? 'Min 6 characters' : null,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              _loading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : _PrimaryButton(text: 'Login', onPressed: _login),
              const SizedBox(height: 12),
              _GoogleButton(onPressed: _google),
              const SizedBox(height: 24),
              Text('Don’t have an account?', style: theme.textTheme.bodyMedium!.copyWith(color: Colors.white)),
              const SizedBox(height: 8),
              _PrimaryButton(
                text: 'Register as Pet Owner',
                onPressed: () => Navigator.of(context).push(_fade(const RegisterScreen(role: 'Pet Owner'))),
              ),
              const SizedBox(height: 12),
              _PrimaryButton(
                text: 'Register as Service Provider',
                onPressed: () => Navigator.of(context).push(_fade(const RegisterScreen(role: 'Service Provider'))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// REGISTER SCREEN ----------------------------------------------------------
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key, required this.role});
  final String role;

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _authService = FirebaseAuthService();
  bool _loading = false;
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();

  Future<void> _register() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _loading = true);
    try {
      final user = await _authService.registerUser(
      username: _name.text.trim(), 
      email: _email.text.trim(),
      password: _password.text.trim(),

      );
      if (!mounted) return;
      if (user != null) {
        Navigator.of(context).pushReplacement(_fade(const MainPage()));
      }
    } catch (e) {
      if (!mounted) return;
      _showSnack('Register failed: $e');
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  void _showSnack(String msg) =>
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      child: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Hero(
                tag: 'logo',
                child: Image.asset('assets/images/app_logo.png', height: 100),
              ),
              const SizedBox(height: 16),
              Text('Create ${widget.role} Account',
                  style: GoogleFonts.poppins(
                      color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold)),
              const SizedBox(height: 24),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    _StyledField(
                      controller: _name,
                      label: 'Full Name',
                      icon: Icons.person,
                      validator: (v) => v!.isEmpty ? 'Enter name' : null,
                    ),
                    const SizedBox(height: 16),
                    _StyledField(
                      controller: _email,
                      label: 'Email',
                      icon: Icons.email,
                      validator: (v) => v!.isEmpty ? 'Enter email' : null,
                    ),
                    const SizedBox(height: 16),
                    _StyledField(
                      controller: _password,
                      label: 'Password',
                      icon: Icons.lock,
                      obscure: true,
                      validator: (v) => v!.length < 6 ? 'Min 6 characters' : null,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              _loading
                  ? const CircularProgressIndicator(color: Colors.white)
                  : _PrimaryButton(text: 'Register', onPressed: _register),
              const SizedBox(height: 12),
              _GoogleButton(onPressed: () async {
                Navigator.of(context).pop();
                // Use same google sign-in as login
              }),
              const SizedBox(height: 24),
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Back to Login', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// ---------------------------------- WIDGETS
class _StyledField extends StatelessWidget {
  const _StyledField({
    required this.controller,
    required this.label,
    required this.icon,
    this.obscure = false,
    this.validator,
  });
  final TextEditingController controller;
  final String label;
  final IconData icon;
  final bool obscure;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscure,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white70),
        prefixIcon: Icon(icon, color: Colors.white70),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
      ),
      validator: validator,
    );
  }
}

class _PrimaryButton extends StatelessWidget {
  const _PrimaryButton({required this.text, required this.onPressed});
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: Colors.purple.shade800,
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        ),
        child: Text(text, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
      ),
    );
  }
}

class _GoogleButton extends StatelessWidget {
  const _GoogleButton({required this.onPressed});
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        side: const BorderSide(color: Colors.white),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      ),
      icon: Image.asset('assets/images/google_logo.png', height: 20),
      label: const Text('Sign in with Google'),
    );
  }
}

/// Helper to create fade transition route.
Route _fade(Widget page) => PageRouteBuilder(
      pageBuilder: (_, __, ___) => page,
      transitionsBuilder: (_, anim, __, child) => FadeTransition(opacity: anim, child: child),
    );

/// Placeholder main page - replace with your own app home.
class MainPage extends StatelessWidget {
  const MainPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Main Page')),
      body: const Center(child: Text('Logged in!')),
    );
  }
}
