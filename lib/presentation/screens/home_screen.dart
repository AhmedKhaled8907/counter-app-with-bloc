import 'package:counter_app/constants/enums/internet_enum.dart';
import 'package:counter_app/cubits/counter_cubit/counter_cubit.dart';
import 'package:counter_app/cubits/internet_cubit/internet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return BlocListener<InternetCubit, InternetState>(
      listener: (context, state) {
        if (state is InternetConnected &&
            state.connectionType == ConnectionType.wifi) {
          context.read<CounterCubit>().increment();
        }
        if (state is InternetConnected &&
            state.connectionType == ConnectionType.mobile) {
          context.read<CounterCubit>().decrement();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: color,
          title: const Text('Home Screen'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<InternetCubit, InternetState>(
                builder: (context, state) {
                  if (state is InternetConnected &&
                      state.connectionType == ConnectionType.wifi) {
                    return const Text(
                      'wifi',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.greenAccent,
                      ),
                    );
                  }
                  if (state is InternetConnected &&
                      state.connectionType == ConnectionType.mobile) {
                    return const Text(
                      'mobile',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.grey,
                      ),
                    );
                  }
                  if (state is InternetDisconnected) {
                    return const Text(
                      'Disconnected',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.red,
                      ),
                    );
                  }
                  return Container();
                },
              ),
              const SizedBox(height: 16),
              BlocConsumer<CounterCubit, CounterState>(
                listener: (context, state) {
                  if (state.wasIncremented == true) {
                    ScaffoldMessenger.of(context).clearSnackBars();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Incremented'),
                      ),
                    );
                  }
                  if (state.wasIncremented == false) {
                    ScaffoldMessenger.of(context).clearSnackBars();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Decremented'),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state.counterValue < 0) {
                    return Text(
                      'Brr , Negative  ${state.counterValue}',
                      style: Theme.of(context).textTheme.headlineMedium,
                    );
                  }
                  if (state.counterValue == 0) {
                    return Text(
                      'Oh Yeah ${state.counterValue}',
                      style: Theme.of(context).textTheme.headlineMedium,
                    );
                  }
                  if (state.counterValue % 2 == 0) {
                    return Text(
                      'Yaaay  ${state.counterValue}',
                      style: Theme.of(context).textTheme.headlineMedium,
                    );
                  }
                  if (state.counterValue % 2 == 1) {
                    return Text(
                      'Noooooo  ${state.counterValue}',
                      style: Theme.of(context).textTheme.headlineMedium,
                    );
                  }
                  return Text(
                    state.counterValue.toString(),
                    style: Theme.of(context).textTheme.headlineMedium,
                  );
                },
              ),
              const SizedBox(height: 16),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   children: [
              //     FloatingActionButton(
              //       onPressed: () {
              //         BlocProvider.of<CounterCubit>(context).decrement();
              //       },
              //       tooltip: 'Decrement',
              //       child: const Icon(Icons.remove),
              //     ),
              //     FloatingActionButton(
              //       onPressed: () {
              //         // BlocProvider.of<CounterCubit>(context).increment();
              //         context.read<CounterCubit>().increment();
              //       },
              //       tooltip: 'Increment',
              //       child: const Icon(Icons.add),
              //     ),
              //   ],
              // ),
              const SizedBox(height: 24),
              MaterialButton(
                color: Colors.red,
                child: const Text(
                  'Go to the second page',
                  style: TextStyle(fontSize: 24),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed('/second');
                },
              ),
              const SizedBox(height: 24),
              MaterialButton(
                color: Colors.green,
                child: const Text(
                  'Go to the Third page',
                  style: TextStyle(fontSize: 24),
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed('/third');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
