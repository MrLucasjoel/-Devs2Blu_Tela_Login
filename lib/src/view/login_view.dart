import 'package:flutter/material.dart';
import '../controller/auth_controller.dart';
import '../widgets/custom_text_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  final controller = AuthController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void _login() {
    if (_formKey.currentState!.validate()) {
      bool success = controller.login(
        emailController.text,
        passwordController.text,
      );

      if (success) {
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Erro'),
            content: const Text('Credenciais inválidas'),
            actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text('OK'))],
          ),
        );
      }
    }
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'Informe o email';
    final emailRegex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w]{2,4}$');
    if (!emailRegex.hasMatch(value)) return 'Email inválido';
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Informe a senha';
    if (value.length < 6) return 'Mínimo 6 caracteres';
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextField(
                label: "Email",
                controller: emailController,
                validator: _validateEmail,
              ),
              const SizedBox(height: 12),
              CustomTextField(
                label: "Senha",
                controller: passwordController,
                obscure: true,
                validator: _validatePassword,
              ),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: _login, child: const Text("Entrar")),
              TextButton(
                onPressed: () => Navigator.pushNamed(context, '/register'),
                child: const Text("Criar conta"),
              )
            ],
          ),
        ),
      ),
    );
  }
}