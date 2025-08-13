import 'package:flutter/material.dart';
import 'package:movie_app/controllers/provider_controller.dart';
import 'package:movie_app/view/pages/home_page.dart';
import 'package:movie_app/view/pages/wrapper_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (BuildContext context) { 
      return ProviderController();
    },
    child: MaterialApp(home:WrapperPage() ,));
  }
}
