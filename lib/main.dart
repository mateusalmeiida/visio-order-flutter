import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:visio_order/models/data_list.dart';
import 'package:visio_order/pages/home_page.dart';
import 'package:visio_order/pages/info_page.dart';
import 'package:visio_order/pages/preview_page.dart';
import 'package:visio_order/pages/settings_page.dart';
import 'package:visio_order/utils/app_routes.dart';

void main() {
  runApp(VisioOrder());
}

class VisioOrder extends StatelessWidget {
  const VisioOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DataList(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Visio Order',
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            titleTextStyle: TextStyle(
                fontFamily: 'BebasNeue', fontSize: 30, color: Colors.white),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            foregroundColor: Colors.white,
          ),
          fontFamily: 'Lato',
        ),
        routes: {
          AppRoutes.HOME: (ctx) {
            return HomePage();
          },
          AppRoutes.SETTINGS_PAGE: (ctx) {
            return SettingsPage();
          },
          AppRoutes.INFO_PAGE: (ctx) {
            return InfoPage();
          },
          AppRoutes.PREVIWE_PAGE: (ctx) {
            return PreviewPage();
          },
        },
      ),
    );
  }
}
