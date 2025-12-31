
import 'package:flutter/material.dart';
import 'package:task/home/home_page.dart';
import 'package:task/widgets/custom_bottomvar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  List<Widget> _pages= [
    HomePage(),
    Container(color: Colors.blue,),
    Container(color: Colors.red,),
    Container(color: Colors.green,),
    Container(color: Colors.black,)
  ];

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: _pages[_selectedIndex],
      bottomNavigationBar: CustomBotomNavigation(selectedItem: _selectedIndex, onTappedItem: _onItemTapped),

    );
  }
}
