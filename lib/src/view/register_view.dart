import 'package:flutter/material.dart';
import '../controller/auth_controller.dart';
import '../model/user_model.dart';
import '../widgets/custom_text_field.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();
  final controller = AuthController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void _register() {
    if (_formKey.currentState!.validate()) {
      final user = UserModel(
        email: emailController.text,
        password: passwordController.text,
      );
      controller.register(user);
      Navigator.pop(context); // Volta para login
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
      appBar: AppBar(title: const Text("Cadastro")),
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
              ElevatedButton(onPressed: _register, child: const Text("Cadastrar")),
            ],
          ),
        ),
      ),
    );
  }
}
