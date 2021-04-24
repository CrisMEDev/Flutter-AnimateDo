import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:animate_do/animate_do.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavegacionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _NotificationModel(),

      child: Scaffold(
        appBar: AppBar(
          title: Text('Notifications page'),
          backgroundColor: Colors.blueGrey[600],
        ),
        
        floatingActionButton: _BotonFlotante(),

        bottomNavigationBar: _BottomNavigation(),
      ),
    );
  }
}


class _BotonFlotante extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    _NotificationModel notificaciones = Provider.of<_NotificationModel>(context);

    return FloatingActionButton(
      child: FaIcon( FontAwesomeIcons.play, size: 20, ),
      backgroundColor: Colors.teal[700],
      onPressed: (){
        notificaciones.numeroNotificacion++;

        if ( notificaciones.numeroNotificacion >= 2 ){
          final controller = Provider.of<_NotificationModel>(context, listen: false).bounceController;
          controller.forward( from: 0.0 );
        }
      },
    );
  }
}

class _BottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final int notificaciones = Provider.of<_NotificationModel>(context).numeroNotificacion;

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
                child: BounceInDown(      // Con la palabra IN indica que en un inicio la opacidad está en cero
                  from: 8,
                  animate: ( notificaciones > 0 ) ? true : false,
                  child: Bounce(
                    // controller para manejar la animacion de las notificaciones con el boton play
                    controller: ( controller ) => Provider.of<_NotificationModel>(context).bounceController = controller,

                    from: 8,
                    child: Container(
                      child: Text(notificaciones.toString(), textAlign: TextAlign.center, style: TextStyle( color: Colors.white, fontSize: 10, fontWeight: FontWeight.w400 ), ),
                      width: 12,
                      height: 12,
                      decoration: BoxDecoration(
                        color: Colors.teal,
                        shape: BoxShape.circle
                      ),
                    ),
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


class _NotificationModel extends ChangeNotifier {

  int _numeroNotificacion = 0;
  AnimationController _bounceController;

  int get numeroNotificacion => this._numeroNotificacion;

      set numeroNotificacion(int numeroNotificacion) {
        this._numeroNotificacion = numeroNotificacion;
        notifyListeners();
      }

  AnimationController get bounceController => this._bounceController;

                      set bounceController(AnimationController controller) {
                        this._bounceController = controller;
                        // notifyListeners();  // el notifyListeners no es necesario porque pasa por referencia
                      }

}

