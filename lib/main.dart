import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:counter_app/cubits/counter_cubit/counter_cubit.dart';
import 'package:counter_app/cubits/internet_cubit/internet_cubit.dart';
import 'package:counter_app/presentation/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp(
    connectivity: Connectivity(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.connectivity,
  });

  final Connectivity connectivity;

  @override
  Widget build(BuildContext context) {
    final AppRouter appRouter = AppRouter();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CounterCubit(),
        ),
        BlocProvider(
          create: (context) => InternetCubit(
            connectivity: connectivity,
          ),
        ),
      ],
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
