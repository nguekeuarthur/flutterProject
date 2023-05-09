import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shop'),
        backgroundColor: Color(0xFF00A368),
      ),
      body: Container(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Color(0xFF00A368),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Client',
            backgroundColor: Color(0xFF00A368),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Catalogue',
            backgroundColor: Color(0xFF00A368),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_shopping_cart),
            label: 'Product',
            backgroundColor: Color(0xFF00A368),
          ),
        ],
        onTap: (currentIndex) {
          Navigator.pushReplacementNamed(context, "AddClientPage");
        },
      ),
    );
  }
}
