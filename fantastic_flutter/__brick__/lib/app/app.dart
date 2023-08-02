import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';
import 'package:{{name}}/all.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class Providers extends StatelessWidget {
  const Providers({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => ThemeModel(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AppBloc>(
            create: (_) => AppBloc(),
          ),
        ],
        child: const MyApp(),
      ),
    );
  }
}

class _MyAppState extends State<MyApp> {
  String lang = 'en';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppBloc, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is LanguageSelected) {
          return buildWrapper(state.selectedLanguage);
        }
        return buildWrapper('en');
      },
    );
  }

  buildWrapper(lang) {
    return MaterialApp.router(
      routerConfig: goRouter,
      theme: lightTheme,
      darkTheme: darkTheme,
      locale: Locale(lang, null),
      debugShowCheckedModeBanner: false,
      supportedLocales: supportedLocales,
      localizationsDelegates: localizationsDelegates,
      localeResolutionCallback: localeResolutionCallback,
      themeMode: Provider.of<ThemeModel>(context).isDarkMode
          ? ThemeMode.dark
          : ThemeMode.light,
    );
  }

  onPress(l) {
    setState(() {
      lang = l;
    });
  }
}
