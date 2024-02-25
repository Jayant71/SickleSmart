import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sicklesmart/colors.dart';
import 'package:sicklesmart/firebase_options.dart';
import 'package:sicklesmart/screens/registration/welcomeauth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: SickleSmart()));
}

class SickleSmart extends StatelessWidget {
  const SickleSmart({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        themeMode: ThemeMode.light,
        debugShowCheckedModeBanner: false,
        title: 'Sickle Smart',
        theme: ThemeData(
          colorScheme: lightColorScheme,
          appBarTheme: const AppBarTheme(
            color: Color.fromARGB(255, 254, 63, 89),
          ),
          useMaterial3: true,
        ).copyWith(
            textTheme:
                _buildTextTheme(ThemeData.light().textTheme, lightColorScheme)),
        darkTheme: ThemeData(
          useMaterial3: true,
          colorScheme: darkColorScheme,
        ).copyWith(
            textTheme:
                _buildTextTheme(ThemeData.dark().textTheme, darkColorScheme)),
        home: child,
      ),
      child: const WelcomeAuthScreen(),
    );
  }

  TextTheme _buildTextTheme(TextTheme base, ColorScheme colorScheme) {
    return base.copyWith(
      displayLarge: base.displayLarge!.copyWith(color: colorScheme.onSurface),
      displayMedium: base.displayMedium!.copyWith(color: colorScheme.onSurface),
      displaySmall: base.displaySmall!.copyWith(color: colorScheme.onSurface),
      titleLarge: base.titleLarge!.copyWith(color: colorScheme.onSurface),
      titleMedium: base.titleMedium!.copyWith(color: colorScheme.onSurface),
      titleSmall: base.titleSmall!.copyWith(color: colorScheme.onSurface),
      bodyLarge: base.bodyLarge!.copyWith(color: colorScheme.onSurface),
      bodyMedium: base.bodyMedium!.copyWith(color: colorScheme.onSurface),
      bodySmall: base.bodySmall!.copyWith(color: colorScheme.onSurface),
      headlineLarge: base.headlineLarge!.copyWith(color: colorScheme.onSurface),
      headlineMedium:
          base.headlineMedium!.copyWith(color: colorScheme.onSurface),
      headlineSmall: base.headlineSmall!.copyWith(color: colorScheme.onSurface),
      labelLarge: base.labelLarge!.copyWith(color: colorScheme.onSurface),
      labelMedium: base.labelMedium!.copyWith(color: colorScheme.onSurface),
      labelSmall: base.labelSmall!.copyWith(color: colorScheme.onSurface),
      // Add other text styles as needed
    );
  }
}
