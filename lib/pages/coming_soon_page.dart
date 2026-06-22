import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:tayyibat_app/design/widgets/header_with_back_widget.dart';
import 'package:tayyibat_app/design/widgets/location_picker_dialog.dart';
import 'package:tayyibat_app/design/widgets/app_card.dart';

import 'package:tayyibat_app/views/services/clinics_view.dart';
import 'package:tayyibat_app/views/services/restaurants_view.dart';
import 'package:tayyibat_app/views/services/stores_view.dart';
import 'package:tayyibat_app/views/services/bakeries_view.dart';
import 'package:tayyibat_app/views/services/gyms_view.dart';
import 'package:tayyibat_app/views/services/honey_view.dart';
import 'package:tayyibat_app/views/services/birds_view.dart';

class ComingSoonSection extends StatefulWidget {
  const ComingSoonSection({super.key});

  @override
  State<ComingSoonSection> createState() =>
      _ComingSoonSectionState();
}

class _ComingSoonSectionState
    extends State<ComingSoonSection> {
  final supabase = Supabase.instance.client;

  int? countryId;
  int? governorateId;
  int? subregionId;

  String countryName = '';
  String governorateName = '';
  String subregionName = '';

  String locationText =
      'اختر الدولة والمحافظة والمنطقة';

  @override
  void initState() {
    super.initState();
    loadLocation();
  }

  Future<void> saveLocation() async {
    final prefs =
        await SharedPreferences.getInstance();

    await prefs.setInt('countryId', countryId ?? 0);
    await prefs.setInt('governorateId', governorateId ?? 0);
    await prefs.setInt('subregionId', subregionId ?? 0);

    await prefs.setString('countryName', countryName);
    await prefs.setString('governorateName', governorateName);
    await prefs.setString('subregionName', subregionName);
  }

  Future<void> loadLocation() async {
    final prefs =
        await SharedPreferences.getInstance();

    final savedCountry =
        prefs.getString('countryName');

    if (savedCountry == null) return;

    setState(() {
      countryId = prefs.getInt('countryId');
      governorateId = prefs.getInt('governorateId');
      subregionId = prefs.getInt('subregionId');

      countryName = savedCountry;
      governorateName =
          prefs.getString('governorateName') ?? '';
      subregionName =
          prefs.getString('subregionName') ?? '';

      locationText =
          '$countryName - $governorateName - $subregionName';
    });
  }

  Future<void> openLocationDialog() async {
    final result = await showDialog(
      context: context,
      builder: (_) => const LocationPickerDialog(),
    );

    if (result == null) return;

    setState(() {
      countryId = result['countryId'];
      governorateId = result['governorateId'];
      subregionId = result['subregionId'];

      countryName = result['countryName'] ?? '';
      governorateName = result['governorateName'] ?? '';
      subregionName = result['subregionName'] ?? '';

      locationText =
          '$countryName - $governorateName - $subregionName';
    });

    await saveLocation();
  }

  /// 🔴 التعديل المهم هنا
  bool canOpenServices() {
    return countryId != null;
  }

  void showLocationMessage() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('اختر الدولة أولاً'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF4F6F5),
        body: Column(
          children: [
            const HeaderWithBackWidget(),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: ListView(
                  children: [
                    GestureDetector(
                      onTap: openLocationDialog,
                      child: Container(
                        padding: const EdgeInsets.all(18),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 8,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.location_on,
                                color: Colors.green),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                locationText,
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            const Icon(Icons.arrow_forward_ios),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    /// 🟢 الآن كل الخدمات تعتمد على الدولة فقط
                    AppCard(
                      title: 'عيادات دكاترة تغذية وغيرها',
                      subtitle: 'خدمات طبية متخصصة',
                      icon: Icons.local_hospital,
                      color: Colors.purple,
                      onTap: () {
                        if (!canOpenServices()) {
                          showLocationMessage();
                          return;
                        }

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ClinicsView(
                              subregionId: subregionId ?? 0,
                              governorateId: governorateId ?? 0,
                              countryId: countryId!,
                            ),
                          ),
                        );
                      },
                    ),

                    AppCard(
                      title: 'مناحل عسل',
                      subtitle: 'أماكن بيع العسل الطبيعي',
                      icon: Icons.hive,
                      color: Colors.amber,
                      onTap: () {
                        if (!canOpenServices()) {
                          showLocationMessage();
                          return;
                        }

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const HoneyView(),
                          ),
                        );
                      },
                    ),

                    AppCard(
                      title: 'مطاعم الطيبات',
                      subtitle: 'وجبات صحية',
                      icon: Icons.restaurant,
                      color: Colors.deepOrange,
                      onTap: () {
                        if (!canOpenServices()) {
                          showLocationMessage();
                          return;
                        }

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => RestaurantsView(
                              subregionId: subregionId ?? 0,
                              governorateId: governorateId ?? 0,
                              countryId: countryId!,
                            ),
                          ),
                        );
                      },
                    ),

                    AppCard(
                      title: 'مخابز الطيبات',
                      subtitle: 'خبز صحي',
                      icon: Icons.bakery_dining,
                      color: Colors.brown,
                      onTap: () {
                        if (!canOpenServices()) {
                          showLocationMessage();
                          return;
                        }

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => BakeriesView(
                              subregionId: subregionId ?? 0,
                              governorateId: governorateId ?? 0,
                              countryId: countryId!,
                            ),
                          ),
                        );
                      },
                    ),

                    AppCard(
                      title: 'متاجر الطيبات',
                      subtitle: 'منتجات غذائية',
                      icon: Icons.store,
                      color: Colors.teal,
                      onTap: () {
                        if (!canOpenServices()) {
                          showLocationMessage();
                          return;
                        }

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const StoresView(),
                          ),
                        );
                      },
                    ),

                    AppCard(
                      title: 'صالات الجيم',
                      subtitle: 'أماكن رياضية',
                      icon: Icons.fitness_center,
                      color: Colors.indigo,
                      onTap: () {
                        if (!canOpenServices()) {
                          showLocationMessage();
                          return;
                        }

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => GymsView(
                              subregionId: subregionId ?? 0,
                              governorateId: governorateId ?? 0,
                              countryId: countryId!,
                            ),
                          ),
                        );
                      },
                    ),

                    AppCard(
                      title: 'أماكن بيع الطيور والأرانب',
                      subtitle: 'حمام ويمام وأرانب',
                      icon: Icons.pets,
                      color: Colors.grey,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const BirdsView(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}