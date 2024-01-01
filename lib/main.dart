import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base_structure/config/constants/app_constants.dart';
import 'package:flutter_base_structure/config/shared_preferences/provider/inshape_shared_preference_provider.dart';
import 'package:flutter_base_structure/config/shared_preferences/singleton/inshape_shared_preference.dart';
import 'package:flutter_base_structure/features/domain/api/providers/api_provider.dart';
import 'package:flutter_base_structure/features/domain/api/singleton/api.dart';
import 'package:flutter_base_structure/features/domain/repository/providers/inshape_repository_provider.dart';
import 'package:flutter_base_structure/features/domain/repository/singleton/inshape_repository.dart';
import 'package:flutter_base_structure/features/presentation/auth/bloc/login/login_cubit.dart';
import 'package:flutter_base_structure/features/presentation/auth/pages/login_screen.dart';
import 'package:flutter_base_structure/features/presentation/auth/pages/splash_screen.dart';
import 'package:flutter_base_structure/features/presentation/home/pages/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  // Application works only in Portrait Mode by below mentioned code
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  // Initializing a Shared Preference
  InShapeSharedPreference preference = InShapeSharedPreference();
  await preference.init();

  runApp(MyApp(
    preference: preference,
  ));
}

class MyApp extends StatefulWidget {
  final InShapeSharedPreference preference;

  const MyApp({super.key, required this.preference});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late API _api;
  late InShapeRepository _inShapeRepository;

  @override
  void initState() {
    super.initState();
    // Creating Singleton Instance of API and MroRepository
    _api = API();
    _inShapeRepository = InShapeRepository();
  }

  @override
  Widget build(BuildContext context) {
    return InShapeSharedPreferenceProvider(
      preference: widget.preference,
      child: APIProvider(
        api: _api,
        child: InShapeRepositoryProvider(
          repository: _inShapeRepository,
          child: MaterialApp(
            title: AppConstants.appName,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              textTheme: GoogleFonts.robotoMonoTextTheme(Theme.of(context).textTheme),
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            initialRoute: AppConstants.routeSplash,
            routes: {
              AppConstants.routeSplash: (context) => const SplashScreen(),
              AppConstants.routeLogin: (context) => BlocProvider(create: (context) => LogInCubit(), child: const LoginScreen()),
              AppConstants.routeHome: (context) => const HomeScreen(),
            },
          ),
        ),
      ),
    );
  }
}
