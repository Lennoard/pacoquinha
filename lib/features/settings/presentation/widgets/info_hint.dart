import 'package:flutter/material.dart';

class InfoHint extends StatelessWidget {
  const InfoHint({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Row(
        children: [
          Image.asset(
            "assets/icons/ic_info_colored.png",
            scale: 0.8,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text("Toque nas opções para editar"),
          ),
        ],
      ),
    );
  }
}
