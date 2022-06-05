import 'package:flutter/material.dart';
import 'package:tabata/features/tabata/presentation/pages/tabata_main.dart';
import 'package:tabata/features/training_report/presentation/pages/training_report.dart';

class TabataContainerPage extends StatefulWidget {
  const TabataContainerPage({Key? key}) : super(key: key);

  @override
  State<TabataContainerPage> createState() => _TabataContainerPageState();
}

class _TabataContainerPageState extends State<TabataContainerPage> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const TabataMainPage(),
    TrainingReportPage(),
    const Text("Profile"),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/icons/ic_clock_selected.png"),
            ),
            label: 'Tabata',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/icons/ic_series.png"),
            ),
            label: 'Atividades',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage("assets/icons/ic_profile.png"),
            ),
            label: 'Perfil',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
