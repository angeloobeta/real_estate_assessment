import 'package:real_estate_assessment/model/utilities/import/generalImport.dart';
import 'package:real_estate_assessment/views/main/main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          title: AppConstant.appName,
          home: const MainScreen(),
          theme: ThemeData(
            fontFamily: AppConstant.fontFamily,
          ),
        );
      },
    );
  }
}
