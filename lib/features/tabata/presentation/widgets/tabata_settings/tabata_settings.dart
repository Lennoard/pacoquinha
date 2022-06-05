import 'package:flutter/material.dart';
import 'package:tabata/features/tabata/presentation/widgets/tabata_settings/tabata_setting_info.dart';

class TabataSettingsRow extends StatelessWidget {
  const TabataSettingsRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SettingInfo(
          assetPath: "assets/icons/ic_series.png",
          label: "Séries",
          quantity: 8.toString(),
        ),
        SettingInfo(
          assetPath: "assets/icons/ic_series.png",
          label: "Ciclos",
          quantity: 1.toString(),
        ),
        const SettingInfo(
          assetPath: "assets/icons/ic_series.png",
          label: "Tempo total",
          quantity: "04:00",
        ),
      ],
    );
  }
}
