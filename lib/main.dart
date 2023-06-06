import 'package:flutter/material.dart';
import 'config/config.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  await Environment.initEnvironment();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(goRouterProvider);
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
