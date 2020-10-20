import 'package:flutter/material.dart';

// screens
import 'package:material_kit_flutter/screens/home.dart';
import 'package:material_kit_flutter/screens/profile.dart';
import 'package:material_kit_flutter/screens/settings.dart';
import 'package:material_kit_flutter/screens/components.dart';
// import 'package:material_kit_flutter/screens/onboarding.dart';

void main() => runApp(MaterialKitPROFlutter());

class MaterialKitPROFlutter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Material Kit PRO Flutter",
        debugShowCheckedModeBanner: false,
        initialRoute: "/home",
        routes: <String, WidgetBuilder>{
          "/onboarding": (BuildContext context) => new Home(),
          "/home": (BuildContext context) => new Home(),
          "/components": (BuildContext context) => new Components(),
          "/profile": (BuildContext context) => new Profile(),
          "/settings": (BuildContext context) => new Settings(),
        });
  }
}
