import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int _counter = 0;

  void increment() {
    setState(() {
      _counter++;
    });
  }

  void decrement() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  bool decrementEnabled() {
    return _counter > 0;
  }

  void reset() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CounterDisplay(count: _counter),
            Wrap(
              children: [
                ElevatedButton.icon(
                  onPressed: decrementEnabled() ? decrement : null,
                  icon: const Icon(Icons.remove),
                  label: const Text('Minus'),
                ),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton.icon(
                  onPressed: increment,
                  icon: const Icon(Icons.add),
                  label: const Text('Plus'),
                ),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton.icon(
                  onPressed: reset,
                  icon: const Icon(Icons.refresh),
                  label: const Text('Reset'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CounterDisplay extends StatelessWidget {
  const CounterDisplay({
    super.key,
    required this.count,
  });

  final int count;

  @override
  Widget build(BuildContext context) {
    return Text('Count: $count');
  }
}
