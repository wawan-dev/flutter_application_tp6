import 'package:flutter/material.dart';
import 'package:flutter_application_1/AppBar/appbar.dart';
import 'package:flutter_application_1/House.dart';
import 'package:flutter_application_1/screen/home.dart';
import 'package:flutter_application_1/screen/settings.dart';
import 'package:json_theme/json_theme.dart';
import 'package:flutter/services.dart';
import 'ThemeController.dart';
import 'dart:convert';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final themeStr = await rootBundle.loadString('assets/appainter_theme.json');
  final themeJson = jsonDecode(themeStr);
  final theme = ThemeDecoder.decodeThemeData(themeJson)!;

  final themeStrDark =
      await rootBundle.loadString('assets/appainter_theme_dark.json');
  final themeJsonDark = jsonDecode(themeStrDark);
  final themeDark = ThemeDecoder.decodeThemeData(themeJsonDark)!;

  runApp(MyApp(theme: theme, Darktheme: themeDark));
}

class MyApp extends StatelessWidget {
  final ThemeData theme;
  final ThemeData Darktheme;
  const MyApp({Key? key, required this.theme, required this.Darktheme})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeController,
      builder: (context, themeMode, _) {
        return MaterialApp(
          title: 'Gestion des albums',
          debugShowMaterialGrid: false,
          debugShowCheckedModeBanner: false,
          theme: theme,
          darkTheme: Darktheme,
          themeMode: themeMode,
          home: const MyHomePage(title: "Page d'Accueil"),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int currentPageIndex = 1;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          title: Text('Gestion des Albums'), // Titre de l'AppBar

          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.lightbulb),
              onPressed: () {
                themeController.toggleTheme();
              },
            ),
          ],
        ),
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          selectedIndex: currentPageIndex,
          destinations: const <Widget>[
            NavigationDestination(
              icon: Icon(House.home), // Icône pour la page d'accueil
              label: 'Accueil', // Label pour la page d'accueil
            ),
            NavigationDestination(
              icon: Icon(House.note_beamed), // Icône pour la recherche
              label: 'Liste des albums', // Label pour la recherche
            ),
            NavigationDestination(
              selectedIcon: Icon(House.settings), // Icône lorsque sélectionné
              icon: Icon(House.settings), // Icône par défaut
              label: 'Parametres', // Label pour les favoris
            ),
          ],
        ),
        body: <Widget>[
          Home(),
          Container(),
          Setting(),
        ][currentPageIndex]);
  }
}
