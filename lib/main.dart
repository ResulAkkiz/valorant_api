import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:valorant_api/Pages/home_page.dart';
import 'package:valorant_api/UI_Helper/ui_helper.dart';
import 'package:valorant_api/bloc/agent_bloc/bloc/agent_bloc.dart';
import 'package:valorant_api/bloc/weapon_bloc/bloc/weapon_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AgentBloc(),
        ),
        BlocProvider(
          create: (context) => WeaponBloc(),
        ),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            scaffoldBackgroundColor: UIHelper.backColor,
            chipTheme: ChipThemeData(
              backgroundColor: UIHelper.backColor,
              labelStyle: const TextStyle(color: Colors.white),
            ),
          ),
          home: const HomePage()),
    );
  }
}
