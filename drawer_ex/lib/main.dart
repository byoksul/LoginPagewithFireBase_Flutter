import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(
        title: 'sa',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final routes = List.generate(20, (i) => 'page $i');

  final navigatorKey = GlobalKey<NavigatorState>();

  bool isMenuFixed(BuildContext context) {
    return MediaQuery.of(context).size.width > 500;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final menu = Container(
        color: theme.canvasColor,
        child: SafeArea(
            right: false,
            child: Drawer(
              elevation: 0,
              child: ListView(
                children: <Widget>[
                  for (final s in routes)
                    ListTile(
                      title: Text(s),
                      onTap: () {
                        // Using navigator key, because the widget is above nested navigator
                        //navigatorKey.currentState!
                        // .pushNamedAndRemoveUntil(s, (r) => false);

                        navigatorKey.currentState!.pushNamed(s);
                      },
                    ),
                ],
              ),
            )));

    return Row(
      children: <Widget>[
        if (isMenuFixed(context)) menu,
        Expanded(
          child: Navigator(
            key: navigatorKey,
            initialRoute: 'Ana ekran',
            onGenerateRoute: (settings) {
              return MaterialPageRoute(
                  builder: (context) {
                    return Scaffold(
                      appBar: AppBar(
                        title: Text(settings.name ?? ""),
                      ),
                      body: SafeArea(
                        child: Text(settings.name ?? ""),
                      ),
                      drawer: isMenuFixed(context) ? null : menu,
                    );
                  },
                  settings: settings);
            },
          ),
        ),
      ],
    );
  }
}
