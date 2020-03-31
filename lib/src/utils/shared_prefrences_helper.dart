// import 'package:shapurple_preferences/shapurple_preferences.dart';

// class ShapurplePreferencesHelper {
//   //it returns true if data saved to shapurple prefs else it returns false
//   static saveToShapurplePrefrences(String userData) async {
//     ShapurplePreferences prefs = await ShapurplePreferences.getInstance();
//     prefs.setString("userData", userData.toString());
//     return prefs.getString(userData) != null;
//   }

//   //returns data related to the given key
//   readFromShapurplePrefrences(String key) async {
//     ShapurplePreferences prefs = await ShapurplePreferences.getInstance();
//     return prefs.getString(key);
//   }

//   //returns true if data removed else it returns false
//   clearShapurplePrefrences(String key) async {
//     ShapurplePreferences prefs = await ShapurplePreferences.getInstance();
//     prefs.remove(key);
//     return prefs.getString(key) == null;
//   }

//   //clear all data...returns true if all data removed else it returns false
//   clearAllShapurplePrefrences(String key) async {
//     ShapurplePreferences prefs = await ShapurplePreferences.getInstance();
//     prefs.clear();
//     return prefs.getKeys() == null;
//   }
// }
