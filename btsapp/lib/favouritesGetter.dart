import 'package:btsapp/createTile.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<String> favs = [];

void favsInit() async {
  try {
    /// Checks if shared preference exist

    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    if (_prefs == null) {
      SharedPreferences.setMockInitialValues({});
    }
    final SharedPreferences prefs = await _prefs;

    if (prefs.getStringList('sharedFavourites') == null) {
      prefs.setStringList('sharedFavourites', []);
    } else {
      favs = prefs.getStringList('sharedFavourites');
    }
  } catch (err) {
    /// setMockInitialValues initiates shared preference
    /// Adds app-name
    print(err);
  }
}
