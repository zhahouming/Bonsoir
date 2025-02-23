import 'package:bonsoir_example/models/app_service.dart';
import 'package:bonsoir_example/pages/current_page.dart';
import 'package:bonsoir_example/widgets/add_icon.dart';
import 'package:bonsoir_example/widgets/bottom_bar.dart';
import 'package:bonsoir_example/widgets/eager_initialization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Plugin's main method.
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DefaultAppService.initialize();
  runApp(const ProviderScope(child: BonsoirExampleMainWidget()));
}

/// The main widget.
class BonsoirExampleMainWidget extends StatelessWidget {
  /// Creates a new main widget instance.
  const BonsoirExampleMainWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) => EagerInitialization(
        child: MaterialApp(
          home: Scaffold(
            appBar: AppBar(
              title: const Text('Bonsoir demo'),
              actions: const [AddIcon()],
              centerTitle: false,
            ),
            body: const CurrentPageWidget(),
            bottomNavigationBar: const BottomBar(),
          ),
        ),
      );
}
