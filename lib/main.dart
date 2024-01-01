import 'package:counter_app/cubit/counter_cubit.dart';
import 'package:counter_app/presentation/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final AppRouter appRouter = AppRouter();
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Counter App',
          theme: ThemeData(
            brightness: Brightness.dark,
          ),
          onGenerateRoute: appRouter.onGenerateRoute,
        ),
    );
  }
}
