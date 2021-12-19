import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'generated/l10n.dart';
import 'screens/screens.dart';

class App extends StatelessWidget {

  const App ({
    Key? key,
  }) : super(key: key,);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      onGenerateRoute: (RouteSettings routeSettings) {
        return MaterialPageRoute<void>(
          settings: routeSettings,
          builder: (BuildContext context) {
            switch (routeSettings.name) {
              case LoginPage.routeName:
                return const LoginPage();
              default:
                return const NotFoundPage();
            }
          },
        );
      },
    );
  }
}