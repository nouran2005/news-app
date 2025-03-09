import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/DI/di.dart';
import 'package:news_app/core/resources/Style/AppStyle.dart';
import 'package:news_app/features/category_details/presentation/manager/category_cubit.dart';
import 'package:news_app/features/home_screen/presentation/manager/theme_cubit.dart';
import 'package:news_app/features/home_screen/presentation/pages/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  configureDependencies();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<CategoryCubit>()),
        BlocProvider(create: (context) => ThemeCubit()), 
      ],
      child: const NewsApp(),
    ),
  );
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        return ScreenUtilInit(
          designSize: const Size(393, 852),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (_, child) {
            return MaterialApp(
              title: 'News App',
              debugShowCheckedModeBanner: false,
              theme: AppStyle.lightTheme,
              darkTheme: AppStyle.darkTheme,
              themeMode: themeMode,
              home: const HomeScreen(),
            );
          },
        );
      },
    );
  }
}
