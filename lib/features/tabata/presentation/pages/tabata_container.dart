import 'package:flutter/material.dart';
import 'package:tabata/features/tabata/presentation/pages/tabata_main.dart';

class TabataContainerPage extends StatefulWidget {
  const TabataContainerPage({Key? key}) : super(key: key);

  @override
  State<TabataContainerPage> createState() => _TabataContainerPageState();
}

class _TabataContainerPageState extends State<TabataContainerPage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
  );
  static const List<Widget> _widgetOptions = <Widget>[
    TabataMainPage(),
    Text("List training"),
    Text("Profile"),
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
            label: 'School',
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
