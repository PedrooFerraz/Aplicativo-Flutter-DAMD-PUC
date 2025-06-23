import 'package:aplicativo_flutter_damd_puc/src/view/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:aplicativo_flutter_damd_puc/core/app_asset.dart';
import 'package:aplicativo_flutter_damd_puc/core/app_extension.dart';
import 'cadastro_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final senhaController = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
              Image.asset(AppAsset.profileImage, width: 200),
              const SizedBox(height: 30),
              Text(
                "Bem-vindo!",
                style: context.displayLarge,
              ),
              const SizedBox(height: 30),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'E-mail',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: senhaController,
                decoration: const InputDecoration(
                  labelText: 'Senha',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 25),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Aqui você pode validar login
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>  HomeScreen()),
                    );
                  },
                  child: const Text('Entrar'),
                ),
              ),
              const SizedBox(height: 15),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CadastroScreen()),
                  );
                },
                child: const Text('Não tem conta? Cadastre-se'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
