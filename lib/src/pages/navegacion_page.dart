import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavegacionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications page'),
        backgroundColor: Colors.blue[300],
      ),
      
      floatingActionButton: _BotonFlotante(),

      bottomNavigationBar: _BottomNavigation(),
    );
  }
}


class _BotonFlotante extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: FaIcon( FontAwesomeIcons.play, size: 20, ),
      backgroundColor: Colors.teal[700],
      onPressed: (){},
    );
  }
}

class _BottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: Colors.teal,
      items: [
        BottomNavigationBarItem(
          label: 'Bones',
          icon: FaIcon( FontAwesomeIcons.bone )
        ),
        BottomNavigationBarItem(
          label: 'Notifications',
          
          icon: Stack(
            children: [
              FaIcon( FontAwesomeIcons.bell ),
              Positioned(
                top: 0.0,
                right: 0.0,
                child: Container(
                  child: Text('1', textAlign: TextAlign.center, style: TextStyle( color: Colors.white, fontSize: 10, fontWeight: FontWeight.w400 ), ),
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    shape: BoxShape.circle
                  ),
                ),
                // child: Icon( Icons.brightness_1, size: 8, color: Colors.redAccent, )  // Solo indicardor de notificacion sin numeros
              )
            ],
          )
        ),
        BottomNavigationBarItem(
          label: 'My dog',
          icon: FaIcon( FontAwesomeIcons.dog )
        ),
      ],
    );
  }
}