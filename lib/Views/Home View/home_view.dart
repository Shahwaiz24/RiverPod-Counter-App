import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final hello = StateProvider<int>((ref) {
  return 0;
});

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint("Whole Widget Build");
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Counter in RiverPod",
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(
            height: 20,
          ),
          Consumer(builder: (context, ref, child) {
            int count = ref.watch(hello);
            debugPrint("Count Builded");
            return Text(
              count.toString(),
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            );
          }),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                ref.read(hello.notifier).state++;
              },
              child: Text("Addition")),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
              onPressed: () {
                ref.read(hello.notifier).state--;
              },
              child: Text("Substraction"))
        ],
      ),
    ));
  }
}
