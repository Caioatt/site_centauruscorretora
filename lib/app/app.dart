import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:seu_projeto/app/views/desktop/home/home_screen.dart';
import 'package:seu_projeto/app/views/mobile/home/home_screen.dart';

class CentaurusConfig extends StatelessWidget {
  const CentaurusConfig({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScreenTypeLayout(
        mobile: HomeMobile(),
        tablet: HomeMobile(),
        desktop: HomeDesktop(),
      ),
    );
  }
}
