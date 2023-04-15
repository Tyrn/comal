// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:auto_route/auto_route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Project imports:
import 'package:comal/alter_counter/alter_counter.dart';
import 'package:comal/l10n/l10n.dart';

@RoutePage()
class AlterCounterPage extends StatelessWidget {
  const AlterCounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AlterCounterBloc(),
      child: const AlterCounterView(),
    );
  }
}

class AlterCounterView extends StatelessWidget {
  const AlterCounterView({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.counterAppBarTitle)),
      body: const Center(child: AlterCounterText()),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => context.read<AlterCounterBloc>().increment(),
            child: const Icon(Icons.arrow_circle_up),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            onPressed: () => context.read<AlterCounterBloc>().decrement(),
            child: const Icon(Icons.arrow_circle_down),
          ),
        ],
      ),
    );
  }
}

class AlterCounterText extends StatelessWidget {
  const AlterCounterText({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final count = context.select((AlterCounterBloc bloc) => bloc.state.value);
    return Text('$count', style: theme.textTheme.displayLarge);
  }
}
