import 'package:shared_preferences/shared_preferences.dart';

class LocationManager {

  static String country = '';
  static String city = '';
  static String area = '';

  static Future<void> loadLocation() async {

    final prefs = await SharedPreferences.getInstance();

    country = prefs.getString('country') ?? '';
    city = prefs.getString('city') ?? '';
    area = prefs.getString('area') ?? '';
  }

  static Future<void> saveLocation({
    required String selectedCountry,
    required String selectedCity,
    required String selectedArea,
  }) async {

    final prefs = await SharedPreferences.getInstance();

    await prefs.setString('country', selectedCountry);
    await prefs.setString('city', selectedCity);
    await prefs.setString('area', selectedArea);

    country = selectedCountry;
    city = selectedCity;
    area = selectedArea;
  }

  static bool hasLocation() {

    return country.isNotEmpty &&
        city.isNotEmpty &&
        area.isNotEmpty;
  }
}