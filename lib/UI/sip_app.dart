import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:investment_calculator_app/UI/router/app_router.dart';

import '../core/themes/app_theme.dart';
import '../logic/cubits/theme_cubit/theme_cubit.dart';

class SipApp extends StatefulWidget {
  const SipApp({super.key});

  @override
  State<SipApp> createState() => _SipAppState();
}

class _SipAppState extends State<SipApp> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void didChangePlatformBrightness() {
    context.read<ThemeCubit>().updateAppTheme();
    super.didChangePlatformBrightness();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Systematic Investment Plan Calculator',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode:
          context.select((ThemeCubit themeCubit) => themeCubit.state.themeMode),
      initialRoute: AppRouter.sip,
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
