// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'constants/app_localizations.dart';
// import 'bloc/locale/locale_bloc.dart';
// import 'core/routing/app_router.dart';
// import 'core/routing/routes.dart';
// import 'core/theming/colors.dart';
//
//
// class DocApp extends StatelessWidget {
//   static final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.light);
//   final AppRouter appRouter;
//
//   const DocApp({super.key, required this.appRouter});
//
//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocProvider(providers: [BlocProvider(create: (context) =>
//     LocaleBloc()
//       ..getSavedLanguage(),
//
//     )
//     ], child: BlocBuilder<LocaleBloc, ChangeLocaleState>(
//       builder: (context, state) {
//         return ScreenUtilInit(
//             designSize: const Size(375, 812),
//             minTextAdapt: true,
//             child: ValueListenableBuilder(
//                 valueListenable: themeNotifier,
//                 builder: (_,ThemeMode currentMode,__) {
//                   return MaterialApp(
//                     locale: state.locale,
//                     supportedLocales: [
//                       Locale('en'),
//                       Locale('ar'),
//                     ],
//                     localizationsDelegates: const [
//                       AppLocalizations.delegate,
//                       GlobalMaterialLocalizations.delegate,
//                       GlobalWidgetsLocalizations.delegate,
//                       GlobalCupertinoLocalizations.delegate,
//                     ],
//                     localeResolutionCallback: (deviceLocale, supportedLocales) {
//                       for (var locale in supportedLocales) {
//                         if (deviceLocale != null &&
//                             deviceLocale.languageCode == locale.languageCode) {
//                           return deviceLocale;
//                         }
//                         return supportedLocales.last;
//                       }
//                     },
//                     title: 'Doc App',
//                     theme: ThemeData(
//                       primaryColor: ColorsManager.mainBlue,
//                       scaffoldBackgroundColor: Colors.white,
//                     ),
//                     darkTheme: ThemeData.dark(),
//                     themeMode: currentMode,
//                     debugShowCheckedModeBanner: false,
//                     initialRoute: Routes.homeScreen,
//                     onGenerateRoute: appRouter.generateRoute,
//                   );
//                 }
//             )
//         );
//       },
//     ),
//     );
//
//
//
//   }
// }




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'bloc/Dark/theme_bloc.dart';
import 'bloc/locale/locale_bloc.dart';
import 'constants/app_localizations.dart';
import 'core/routing/app_router.dart';
import 'core/routing/routes.dart';

class YallaWork extends StatelessWidget {

  final AppRouter appRouter;

  const YallaWork({super.key, required this.appRouter});


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [BlocProvider(create: (context) =>
    LocaleBloc()
      ..getSavedLanguage(),
    )
    ], child: BlocBuilder<LocaleBloc, ChangeLocaleState>(
        builder: (context, state) {

          return ScreenUtilInit(
              designSize: const Size(375, 812),
              minTextAdapt: true,

              child:  BlocProvider<ThemeBloc>(
                create: (context) => ThemeBloc()..add(GetCurrentThemeEvent()),
                child: BlocBuilder<ThemeBloc, ThemeState>(
                  builder: (context, s) {

                    if (s is LoadedThemeState) {

                      return MaterialApp(



                        theme: s.themeData,


                        supportedLocales: [
                          Locale('en'),
                          Locale('ar'),
                        ],
                        localizationsDelegates: const [
                          AppLocalizations.delegate,
                          GlobalMaterialLocalizations.delegate,
                          GlobalWidgetsLocalizations.delegate,
                          GlobalCupertinoLocalizations.delegate,
                        ],
                        localeResolutionCallback: (deviceLocale, supportedLocales)
                        {
                          for (var locale in supportedLocales) {
                            if (deviceLocale != null &&
                                deviceLocale.languageCode == locale.languageCode) {
                              return deviceLocale;
                            }
                            return supportedLocales.last;
                          }
                        },
                        title: 'Yalla Work',
                        debugShowCheckedModeBanner: false,
                        initialRoute: Routes.splashScreen,
                        //isLoggedInUser? Routes.homeScreen :Routes.loginScreen,
                        onGenerateRoute: appRouter.generateRoute,
                        locale: state.locale,


                      );

                    }

                    return Container();
                  },
                ),
              ));

        }
    ));
  }
}