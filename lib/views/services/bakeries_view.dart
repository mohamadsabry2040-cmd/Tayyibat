import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:tayyibat_app/design/widgets/service_card.dart';
import 'package:tayyibat_app/design/widgets/header_with_back_widget.dart';

class BakeriesView extends StatefulWidget {
  final int countryId;
  final int? governorateId;
  final int? subregionId;

  const BakeriesView({
    super.key,
    required this.countryId,
    this.governorateId,
    this.subregionId,
  });

  @override
  State<BakeriesView> createState() => _BakeriesViewState();
}

class _BakeriesViewState extends State<BakeriesView> {
  final supabase = Supabase.instance.client;

  List<Map<String, dynamic>> services = [];
  String message = '';

  @override
  void initState() {
    super.initState();
    loadServices();
  }

  Future<void> loadServices() async {
    try {
      List<Map<String, dynamic>> data = [];

      // 1️⃣ البحث في المنطقة (إذا موجودة)
      if (widget.subregionId != null) {
        data = List<Map<String, dynamic>>.from(
          await supabase
              .from('services')
              .select()
              .eq('category', 'bakery')
              .eq('subregion_id', widget.subregionId!),
        );

        if (data.isNotEmpty) {
          setState(() {
            services = data;
            message = '';
          });
          return;
        }
      }

      // 2️⃣ البحث في المحافظة (إذا موجودة)
      if (widget.governorateId != null) {
        data = List<Map<String, dynamic>>.from(
          await supabase
              .from('services')
              .select()
              .eq('category', 'bakery')
              .eq('governorate_id', widget.governorateId!),
        );

        if (data.isNotEmpty) {
          setState(() {
            services = data;
            message =
                'يتم عرض بيانات من نفس المحافظة لعدم توفر خدمات في منطقتك';
          });
          return;
        }
      }

      // 3️⃣ الدولة (إجباري دائمًا)
      data = List<Map<String, dynamic>>.from(
        await supabase
            .from('services')
            .select()
            .eq('category', 'bakery')
            .eq('country_id', widget.countryId),
      );

      if (data.isNotEmpty) {
        setState(() {
          services = data;
          message =
              'يتم عرض بيانات من نفس الدولة لعدم توفر خدمات أقرب';
        });
        return;
      }

      // لا يوجد بيانات
      setState(() {
        services = [];
        message = 'لا توجد مخابز متاحة حالياً';
      });
    } catch (e) {
      setState(() {
        services = [];
        message = 'حدث خطأ أثناء تحميل البيانات';
      });
    }
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

            const SizedBox(height: 10),

            const Text(
              'مخابز الطيبات',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1B5E20),
              ),
            ),

            const SizedBox(height: 10),

            Expanded(
              child: services.isEmpty
                  ? Center(child: Text(message))
                  : Column(
                      children: [
                        if (message.isNotEmpty)
                          Container(
                            width: double.infinity,
                            margin: const EdgeInsets.all(16),
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              color: Colors.orange.shade100,
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Text(
                              message,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                          ),

                        Expanded(
                          child: ListView.builder(
                            padding: const EdgeInsets.all(16),
                            itemCount: services.length,
                            itemBuilder: (context, index) {
                              return ServiceCard(
                                service: services[index],
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