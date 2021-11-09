

import 'package:flutter/cupertino.dart';
import 'package:great_places_app/models/place.dart';


class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }
}