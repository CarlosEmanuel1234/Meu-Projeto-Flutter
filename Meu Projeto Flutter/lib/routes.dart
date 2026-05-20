import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/cotacao_screen.dart';
import 'screens/transferencia_screen.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/login': (context) => LoginScreen(),
  '/home': (context) => HomeScreen(),
  '/cotacao': (context) => CotacaoScreen(),
  '/transferencia': (context) => TransferenciaScreen(),
};
