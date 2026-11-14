import 'package:flutter/foundation.dart';
import '../models/cruise_destination.dart';

class CruiseBookingViewModel extends ChangeNotifier {
  final CruiseDestination _destination = CruiseDestination(
    title: 'Rajang River Cruise',
    location: 'Sibu Waterfront, Sarawak',
    ratingCount: 41,
    selectedDate: DateTime.now(),
    selectedPackage: 'Private River Cruise',
  );

  CruiseDestination get destination => _destination;

  void updateDate(DateTime newDate) {
    _destination.selectedDate = newDate;
    notifyListeners();
  }

  void updatePackage(String newPackage) {
    _destination.selectedPackage = newPackage;
    notifyListeners();
  }

  void incrementRating() {
    _destination.ratingCount++;
    notifyListeners();
  }
}