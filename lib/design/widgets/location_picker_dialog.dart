import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LocationPickerDialog extends StatefulWidget {
  const LocationPickerDialog({super.key});

  @override
  State<LocationPickerDialog> createState() =>
      _LocationPickerDialogState();
}

class _LocationPickerDialogState
    extends State<LocationPickerDialog> {
  final supabase = Supabase.instance.client;

  List<Map<String, dynamic>> countries = [];
  List<Map<String, dynamic>> governorates = [];
  List<Map<String, dynamic>> subregions = [];

  int? countryId;
  int? governorateId;
  int? subregionId;

  String countryName = '';
  String governorateName = '';
  String subregionName = '';

  bool isLoading = true;
  bool hasError = false;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    loadCountries();
  }

  Future<void> loadCountries() async {
    try {
      setState(() {
        isLoading = true;
        hasError = false;
      });

      final data = await supabase
          .from('countries')
          .select()
          .timeout(const Duration(seconds: 10));

      if (!mounted) return;

      setState(() {
        countries =
            List<Map<String, dynamic>>.from(data);
        isLoading = false;
      });
    } catch (_) {
      if (!mounted) return;

      setState(() {
        isLoading = false;
        hasError = true;
        errorMessage = 'تعذر تحميل الدول';
      });
    }
  }

  Future<void> loadGovernorates(int id) async {
    try {
      setState(() {
        isLoading = true;
        governorates = [];
        subregions = [];
        governorateId = null;
        subregionId = null;
      });

      final data = await supabase
          .from('governorates')
          .select()
          .eq('country_id', id)
          .timeout(const Duration(seconds: 10));

      if (!mounted) return;

      setState(() {
        governorates =
            List<Map<String, dynamic>>.from(data);
        countryId = id;
        isLoading = false;
      });
    } catch (_) {
      setState(() => isLoading = false);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('فشل تحميل المحافظات'),
        ),
      );
    }
  }

  Future<void> loadSubregions(int id) async {
    try {
      setState(() {
        isLoading = true;
        subregions = [];
        subregionId = null;
      });

      final data = await supabase
          .from('subregions')
          .select()
          .eq('region_id', id)
          .timeout(const Duration(seconds: 10));

      if (!mounted) return;

      setState(() {
        subregions =
            List<Map<String, dynamic>>.from(data);
        governorateId = id;
        isLoading = false;
      });
    } catch (_) {
      setState(() => isLoading = false);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('فشل تحميل المناطق'),
        ),
      );
    }
  }

  Future<void> openSelectionSheet({
    required String title,
    required List<Map<String, dynamic>> items,
    required Function(Map<String, dynamic>) onSelected,
  }) async {
    await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.75,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(30),
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 12),
              Container(
                width: 60,
                height: 6,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: items.length,
                  itemBuilder: (context, index) {
                    final item = items[index];

                    return ListTile(
                      leading: const Icon(
                        Icons.location_on,
                        color: Color(0xFF1B8F5A),
                      ),
                      title: Text(item['name'].toString()),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () {
                        Navigator.pop(context);
                        onSelected(item);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildSelector({
    required String title,
    required String value,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: isLoading ? null : onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Row(
          children: [
            const Icon(Icons.location_on,
                color: Color(0xFF1B8F5A)),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                value.isEmpty ? title : value,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: value.isEmpty
                      ? Colors.black45
                      : Colors.black,
                ),
              ),
            ),
            isLoading
                ? const SizedBox(
                    width: 18,
                    height: 18,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.keyboard_arrow_down),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFFF4F6F5),
          borderRadius: BorderRadius.circular(30),
        ),
        child: hasError
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.wifi_off,
                      size: 70, color: Colors.red),
                  const SizedBox(height: 20),
                  Text(
                    errorMessage,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: loadCountries,
                    child: const Text('إعادة المحاولة'),
                  ),
                ],
              )
            : Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'اختر موقعك',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 24),

                  buildSelector(
                    title: 'اختر الدولة',
                    value: countryName,
                    onTap: () {
                      openSelectionSheet(
                        title: 'اختر الدولة',
                        items: countries,
                        onSelected: (item) async {
                          countryId = item['id'];
                          countryName = item['name'];

                          governorateId = null;
                          subregionId = null;

                          governorateName = '';
                          subregionName = '';

                          await loadGovernorates(countryId!);
                          setState(() {});
                        },
                      );
                    },
                  ),

                  buildSelector(
                    title: 'اختر المحافظة (اختياري)',
                    value: governorateName,
                    onTap: () {
                      if (governorates.isEmpty) return;

                      openSelectionSheet(
                        title: 'اختر المحافظة',
                        items: governorates,
                        onSelected: (item) async {
                          governorateId = item['id'];
                          governorateName = item['name'];

                          subregionId = null;
                          subregionName = '';

                          await loadSubregions(governorateId!);
                          setState(() {});
                        },
                      );
                    },
                  ),

                  buildSelector(
                    title: 'اختر المنطقة (اختياري)',
                    value: subregionName,
                    onTap: () {
                      if (subregions.isEmpty) return;

                      openSelectionSheet(
                        title: 'اختر المنطقة',
                        items: subregions,
                        onSelected: (item) {
                          subregionId = item['id'];
                          subregionName = item['name'];
                          setState(() {});
                        },
                      );
                    },
                  ),

                  const SizedBox(height: 10),

                  SizedBox(
                    width: double.infinity,
                    height: 54,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context, {
                          'countryId': countryId,
                          'governorateId': governorateId,
                          'subregionId': subregionId,
                          'countryName': countryName,
                          'governorateName': governorateName,
                          'subregionName': subregionName,
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1B8F5A),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                      child: const Text(
                        'حفظ الموقع',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}