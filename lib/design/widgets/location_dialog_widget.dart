import 'package:flutter/material.dart';
import 'package:tayyibat_app/services/location_manager.dart';

import '../../data/location_data/egypt_locations.dart';
import '../../data/location_data/uae_locations.dart';
import '../../data/location_data/saudi_locations.dart';
import '../../data/location_data/algeria_locations.dart';
import '../../data/location_data/morocco_locations.dart';
import '../../data/location_data/tunisia_locations.dart';
import '../../data/location_data/libya_locations.dart';
import '../../data/location_data/sudan_locations.dart';
import '../../data/location_data/yemen_locations.dart';
import '../../data/location_data/syria_locations.dart';
import '../../data/location_data/lebanon_locations.dart';
import '../../data/location_data/jordan_locations.dart';

class LocationDialogWidget extends StatefulWidget {
  final VoidCallback onSaved;

  const LocationDialogWidget({
    super.key,
    required this.onSaved,
  });

  @override
  State<LocationDialogWidget> createState() =>
      _LocationDialogWidgetState();
}

class _LocationDialogWidgetState
    extends State<LocationDialogWidget> {

  String selectedCountry = EgyptLocations.countryName;
  String selectedCity = 'القاهرة';
  String selectedArea = 'مدينة نصر';

  final Map<String, List<String>> countries = {
    EgyptLocations.countryName: EgyptLocations.governorates.keys.toList(),
    UaeLocations.countryName: UaeLocations.emirates.keys.toList(),
    SaudiLocations.countryName: SaudiLocations.regions.keys.toList(),
    AlgeriaLocations.countryName: AlgeriaLocations.provinces.keys.toList(),
    MoroccoLocations.countryName: MoroccoLocations.regions.keys.toList(),
    TunisiaLocations.countryName: TunisiaLocations.governorates.keys.toList(),
    LibyaLocations.countryName: LibyaLocations.cities.keys.toList(),
    SudanLocations.countryName: SudanLocations.states.keys.toList(),
    YemenLocations.countryName: YemenLocations.governorates.keys.toList(),
    SyriaLocations.countryName: SyriaLocations.governorates.keys.toList(),
    LebanonLocations.countryName: LebanonLocations.governorates.keys.toList(),
    JordanLocations.countryName: JordanLocations.governorates.keys.toList(),
  };

  final Map<String, List<String>> areas = {
    ...EgyptLocations.governorates,
    ...UaeLocations.emirates,
    ...SaudiLocations.regions,
    ...AlgeriaLocations.provinces,
    ...MoroccoLocations.regions,
    ...TunisiaLocations.governorates,
    ...LibyaLocations.cities,
    ...SudanLocations.states,
    ...YemenLocations.governorates,
    ...SyriaLocations.governorates,
    ...LebanonLocations.governorates,
    ...JordanLocations.governorates,
  };

  @override
  Widget build(BuildContext context) {

    final cities = countries[selectedCountry] ?? [];

    final currentAreas = areas[selectedCity] ?? [];

    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),

      title: const Text(
        'اختر موقعك',
        textAlign: TextAlign.center,
      ),

      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            const Text(
              'يساعدنا موقعك في عرض المطاعم والعيادات والمتاجر الأقرب إليك',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black54,
                fontSize: 14,
                height: 1.5,
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 20),

            DropdownButtonFormField<String>(
              initialValue: selectedCountry,

              decoration: InputDecoration(
                labelText: 'الدولة',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),

              items: countries.keys.map((country) {
                return DropdownMenuItem(
                  value: country,
                  child: Text(country),
                );
              }).toList(),
              onChanged: (value) {
                if (value == null) return;

                setState(() {
                  selectedCountry = value;

                  final firstCity =
                      countries[selectedCountry]?.first;

                  if (firstCity != null) {
                    selectedCity = firstCity;
                  }

                  final firstArea =
                      areas[selectedCity]?.first;

                  if (firstArea != null) {
                    selectedArea = firstArea;
                  }
                });
              },
            ),

            const SizedBox(height: 18),

            DropdownButtonFormField<String>(
              initialValue: selectedCity,

              decoration: InputDecoration(
                labelText:
                    'المحافظة / الإمارة / الولاية',

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),

              items: cities.map((city) {
                return DropdownMenuItem(
                  value: city,
                  child: Text(city),
                );
              }).toList(),

              onChanged: (value) {
                if (value == null) return;

                setState(() {
                  selectedCity = value;

                  final firstArea =
                      areas[selectedCity]?.first;

                  if (firstArea != null) {
                    selectedArea = firstArea;
                  }
                });
              },
            ),

            const SizedBox(height: 18),

            DropdownButtonFormField<String>(
              initialValue: selectedArea,

              decoration: InputDecoration(
                labelText: 'المنطقة',

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),

              items: currentAreas.map((area) {
                return DropdownMenuItem(
                  value: area,
                  child: Text(area),
                );
              }).toList(),

              onChanged: (value) {
                if (value == null) return;

                setState(() {
                  selectedArea = value;
                });
              },
            ),

            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              height: 52,

              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      const Color(0xFF1B8F5A),

                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(16),
                  ),
                ),

                onPressed: () async {
                  await LocationManager.saveLocation(
                    selectedCountry: selectedCountry,
                    selectedCity: selectedCity,
                    selectedArea: selectedArea,
                  );

                  if (!context.mounted) return;

                  widget.onSaved();

                  Navigator.pop(context);
                },

                child: const Text(
                  'حفظ الموقع',

                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
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