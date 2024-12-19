import 'package:flutter/material.dart';

// Renommer la classe pour respecter la convention UpperCamelCase
class AppBarPrincipal extends StatefulWidget implements PreferredSizeWidget {
  // Déclarer les variables comme `final` pour éviter l'erreur d'immutabilité
  final String appBar = "Mon Application";
  final List<Widget> widget = [];

  AppBarPrincipal({super.key});  // Le constructeur reste constant

  // Implémentation correcte du `getter` preferredSize
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);  // Retourne la taille de l'AppBar

  @override
  _AppBarPrincipalState createState() => _AppBarPrincipalState();  // Crée l'état associé à ce widget
}

// Classe _AppBarPrincipalState qui gère l'état du widget
class _AppBarPrincipalState extends State<AppBarPrincipal> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(widget.appBar),  // Utilisation de widget.appBar
      actions: <Widget>[
        IconButton(
          onPressed: () {
            // Action à effectuer lors de l'appui sur l'icône
          },
          icon: Icon(Icons.search),
        ),
      ],
    );
  }
}