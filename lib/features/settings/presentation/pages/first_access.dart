import 'package:flutter/material.dart';
import 'package:tabata/common/widgets/button.dart';
import 'package:tabata/constants/routes.dart';

class FirstAccessPage extends StatelessWidget {
  const FirstAccessPage({Key? key}) : super(key: key);

  void navigateToChangeSettings(BuildContext context) {
    Navigator.of(context).pushNamedAndRemoveUntil(
      changeSettingsRoute,
      (_) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Image.asset(
                'assets/imagery/imagery_tabata.png',
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30.0,
              vertical: 46.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Vamos começar o seu primeiro",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                const Text(
                  "Treino Tabata?",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    top: 16.0,
                  ),
                  child: Text(
                    "No próximo passo você vai criar o Tabata ideal para o seu treino.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 68.0),
                  child: Button(
                    text: "Criar Tabata",
                    onPressed: () => navigateToChangeSettings(context),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
