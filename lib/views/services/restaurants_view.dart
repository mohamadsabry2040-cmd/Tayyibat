import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:tayyibat_app/design/widgets/service_card.dart';
import 'package:tayyibat_app/design/widgets/header_with_back_widget.dart';

class RestaurantsView extends StatefulWidget {
  final int subregionId;
  final int governorateId;
  final int countryId;

  const RestaurantsView({
    super.key,
    required this.subregionId,
    required this.governorateId,
    required this.countryId,
  });

  @override
  State<RestaurantsView> createState() =>
      _RestaurantsViewState();
}

class _RestaurantsViewState
    extends State<RestaurantsView> {
  final supabase =
      Supabase.instance.client;

  List<Map<String, dynamic>> services = [];

  String message = '';

  @override
  void initState() {
    super.initState();
    loadServices();
  }

  Future<void> loadServices() async {
    try {
      /// البحث بنفس المنطقة

      final subregionData =
          await supabase
              .from('services')
              .select()
              .eq(
                'category',
                'rest',
              )
              .eq(
                'subregion_id',
                widget.subregionId,
              );

      if (subregionData.isNotEmpty) {
        setState(() {
          services =
              List<Map<String, dynamic>>.from(
            subregionData,
          );

          message = '';
        });

        return;
      }

      /// البحث بنفس المحافظة

      final governorateData =
          await supabase
              .from('services')
              .select()
              .eq(
                'category',
                'rest',
              )
              .eq(
                'governorate_id',
                widget.governorateId,
              );

      if (governorateData.isNotEmpty) {
        setState(() {
          services =
              List<Map<String, dynamic>>.from(
            governorateData,
          );

          message =
              'يتم عرض بيانات من نفس المحافظة لعدم توفر خدمات في منطقتك';
        });

        return;
      }

      /// البحث بنفس الدولة

      final countryData =
          await supabase
              .from('services')
              .select()
              .eq(
                'category',
                'rest',
              )
              .eq(
                'country_id',
                widget.countryId,
              );

      if (countryData.isNotEmpty) {
        setState(() {
          services =
              List<Map<String, dynamic>>.from(
            countryData,
          );

          message =
              'يتم عرض بيانات من نفس الدولة لعدم توفر خدمات قريبة';
        });

        return;
      }

      /// لا توجد بيانات

      setState(() {
        services = [];

        message =
            'لا توجد مطاعم متاحة حالياً';
      });
    } catch (e) {
      setState(() {
        services = [];

        message =
            'حدث خطأ أثناء تحميل البيانات';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,

      child: Scaffold(
        backgroundColor:
            const Color(0xFFF4F6F5),

        body: Column(
          children: [
            // ✅ الهيدر الخارجي
            const HeaderWithBackWidget(),

            const SizedBox(height: 10),

            // ✅ عنوان الصفحة
            const Text(
              'مطاعم الطيبات',

              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1B5E20),
              ),
            ),

            const SizedBox(height: 10),

            Expanded(
              child: services.isEmpty
                  ? Center(
                      child: Text(
                        message,
                      ),
                    )
                  : Column(
                      children: [
                        if (message.isNotEmpty)
                          Container(
                            width:
                                double.infinity,

                            margin:
                                const EdgeInsets.all(
                              16,
                            ),

                            padding:
                                const EdgeInsets.all(
                              14,
                            ),

                            decoration:
                                BoxDecoration(
                              color: Colors
                                  .orange
                                  .shade100,

                              borderRadius:
                                  BorderRadius.circular(
                                14,
                              ),
                            ),

                            child: Text(
                              message,

                              textAlign:
                                  TextAlign.center,

                              style:
                                  const TextStyle(
                                fontWeight:
                                    FontWeight.bold,

                                color:
                                    Colors.black87,
                              ),
                            ),
                          ),

                        Expanded(
                          child:
                              ListView.builder(
                            padding:
                                const EdgeInsets.all(
                              16,
                            ),

                            itemCount:
                                services.length,

                            itemBuilder:
                                (
                              context,
                              index,
                            ) {
                              return ServiceCard(
                                service:
                                    services[index],
                              );
                            },
                          ),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}