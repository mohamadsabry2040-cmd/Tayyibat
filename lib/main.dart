import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:tayyibat_app/pages/home_page.dart';
import 'package:tayyibat_app/pages/allowed_page.dart';
import 'package:tayyibat_app/pages/breakfast_page.dart';
import 'package:tayyibat_app/pages/lunch_page.dart';
import 'package:tayyibat_app/pages/kebda_page.dart';
import 'package:tayyibat_app/pages/kawar3_page.dart';
import 'package:tayyibat_app/pages/ahsha_page.dart';
import 'package:tayyibat_app/pages/lunch_folder_page.dart';
import 'package:tayyibat_app/pages/bio_page.dart';
import 'package:tayyibat_app/pages/forbidden_page.dart';
import 'package:tayyibat_app/pages/dairy_page.dart';
import 'package:tayyibat_app/pages/white_flour_page.dart';
import 'package:tayyibat_app/pages/sweets_page.dart';
import 'package:tayyibat_app/pages/drinks_page.dart';
import 'package:tayyibat_app/pages/legumes_page.dart';
import 'package:tayyibat_app/pages/vegetables_page.dart';
import 'package:tayyibat_app/pages/birds_page.dart';
import 'package:tayyibat_app/pages/allowed_drinks_page.dart';
import 'package:tayyibat_app/pages/goat_page.dart';
import 'package:tayyibat_app/pages/fruits_page.dart';
import 'package:tayyibat_app/pages/birds_extra_page.dart';
import 'package:tayyibat_app/pages/NaturalFruitsPage.dart';
import 'package:tayyibat_app/pages/settings_page.dart';
import 'package:tayyibat_app/pages/scientific_research_page.dart';
import 'package:tayyibat_app/pages/coming_soon_page.dart';
import 'package:tayyibat_app/pages/fats_and_oils_page.dart';
import 'package:tayyibat_app/pages/fish_page.dart';

// الخضروات
import 'package:tayyibat_app/pages/healthy_vegetables_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://vumivazlwagqgdfyswxj.supabase.co',
    anonKey:
        'sb_publishable_a2lb0aFKdyubJNRxObkDHw_vaHhbpVr',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'الطيبات',

      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor:
            const Color(0xFFF4F6F5),
        fontFamily: 'Cairo',
      ),

      initialRoute: '/',

      routes: {

        /// الرئيسية
        '/': (context) => HomePage(),

        /// المسموحات
        '/allowed': (context) => const AllowedPage(),

        '/lunch': (context) => const LunchPage(),

        '/lunchFolder': (context) =>
            const LunchFolderPage(),

        '/breakfast': (context) =>
            const BreakfastPage(),

        '/kebda': (context) => const KebdaPage(),

        '/kawar3': (context) => const Kawar3Page(),

        '/ahsha': (context) => const AhshaPage(),

        '/goat': (context) => const GoatPage(),

        '/birds': (context) => const BirdsPage(),

        '/birdsExtra': (context) =>
            const BirdsExtraPage(),

        '/fish': (context) => const FishPage(),

        '/fruits': (context) => const FruitsPage(),

        '/naturalFruits': (context) =>
            const NaturalFruitsPage(),

        '/vegetables': (context) =>
            const VegetablesPage(),

        '/healthyVegetables': (context) =>
            const HealthyVegetablesPage(),

        '/legumes': (context) =>
            const LegumesPage(),

        '/allowedDrinks': (context) =>
            const AllowedDrinksPage(),

        '/fatsAndOils': (context) =>
            const FatsAndOilsPage(),

        /// الممنوعات
        '/forbidden': (context) =>
            const ForbiddenPage(),

        '/dairy': (context) => const DairyPage(),

        '/whiteFlour': (context) =>
            const WhiteFlourPage(),

        '/sweets': (context) => const SweetsPage(),

        '/drinks': (context) => const DrinksPage(),

        /// باقي الصفحات
        '/bio': (context) => const BioPage(),

        '/settings': (context) =>
            const SettingsPage(),
            '/research': (context) =>
            const ScientificResearchPage(),

        '/comingSoon': (context) =>
            const ComingSoonSection(),
      },
    );
  }
}