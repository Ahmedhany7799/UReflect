import 'package:lottie/lottie.dart';

import 'moduels/view/WelcomeLoginPage.dart';
import 'services/autntication/authcubit/authcubit_cubit.dart';
import 'services/layout/layout_cubit/layout_cubit.dart';
import 'services/sharedprefernces/Cachedata.dart';
import 'services/sharedprefernces/bloc_observer.dart';
import 'utils/theme/theme.dart';
import 'moduels/view/welcome.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

String? userToken;
String? currentPassword;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheNetwork.cacheInitialization();
  userToken = await CacheNetwork.getCacheData(key: 'token');
  currentPassword = await CacheNetwork.getCacheData(key: 'password');
  debugPrint("User token is : $userToken");
  debugPrint("Current Password is : $currentPassword");
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // _MyAppState() {
  //   _initAlanButton();
  // }

  // void _initAlanButton() {
  //   AlanVoice.addButton(
  //       "314203787ccd9370974f1bf6b6929c1b2e956eca572e1d8b807a3e2338fdd0dc/prod");
  //   AlanVoice.onCommand.add((command) {
  //     debugPrint("got new command ${command.toString()}");
  //     var commandName = command.data["command"] ?? "";
  //     if (commandName == "showAlert") {
  //       /// handle command "showAlert"
  //     }
  //   });

  //   AlanVoice.onEvent.add((event) {
  //     debugPrint("got new event ${event.data.toString()}");
  //   });

  //   AlanVoice.onButtonState.add((state) {
  //     debugPrint("got new button state ${state.name}");
  //   });
  // }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AuthCubit()),
          BlocProvider(
            create: (context) => LayoutCubit(),
          ),
        ],
        child: ScreenUtilInit(
            designSize: const Size(460, 700),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (_, context) {
              return GetMaterialApp(
                debugShowCheckedModeBanner: false,
                themeMode: ThemeMode.system,
                theme: TAppTheme.lightTheme,
                darkTheme: TAppTheme.darkTheme,
                home: Scaffold(
                  backgroundColor: const Color.fromRGBO(219, 219, 219, 1),
                  body: Center(
                    child: AnimatedSplashScreen(
                      duration: 4000,
                      splashIconSize: 400,
                      splash: Image.asset(
                        "assets/user.png",
                        fit: BoxFit.cover,
                        height: 400.h,
                      ),
                      nextScreen: const WelcomeLogin(),
                      splashTransition: SplashTransition.fadeTransition,
                    ),
                  ),
                ),
              );
            }));
  }
}
