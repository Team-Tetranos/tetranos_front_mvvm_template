import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tetranos_template/dependency_injection/di.dart';
import 'package:tetranos_template/utils/routes/route_names.dart';
import 'package:tetranos_template/utils/routes/routes.dart';
import 'package:tetranos_template/view_models/home_view_model.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependency();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>HomeViewModel())

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(

          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        initialRoute: RouteNames.home_screen,
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}


