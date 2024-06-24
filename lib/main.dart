import 'Features/checkout/presentation/views/my_cart_view.dart';
import 'Features/checkout/presentation/views/payment_details.dart';
import 'moduels/view/loginPage.dart';
import 'services/services.dart';
import 'moduels/widgets/bottomnavigationbar.dart';
import 'services/autntication/authcubit/authcubit_cubit.dart';
import 'services/layout/layout_cubit/layout_cubit.dart';
import 'services/sharedprefernces/Cachedata.dart';
import 'services/sharedprefernces/bloc_observer.dart';
import 'utils/theme/theme.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

String? userToken;
String? currentPassword;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
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
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => AuthCubit()),
          BlocProvider(
              create: (context) => LayoutCubit()
                ..getProducts()
                ..getCarts()),
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
                        "assets/logoU.png",
                        fit: BoxFit.fitWidth,
                        height: 300.h,
                        //width: 00.w,
                      ),
                      nextScreen:
                          //MyCartView()

                          userToken != null
                              ? const LoginPage()
                              :
                              //const PaymentDetailsView(),
                              const BottomNavigationbar(),
                      splashTransition: SplashTransition.fadeTransition,
                    ),
                  ),
                ),
              );
            }));
  }
}
