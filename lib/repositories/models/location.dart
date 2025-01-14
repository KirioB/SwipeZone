import 'package:swipezone/repositories/models/weekly_schedule.dart';

import 'activities.dart';
import 'categories.dart';
import 'contact.dart';
import 'localization.dart';

class Location {
  final String nom;
  final String? description;
  final WeeklySchedule? schedule;
  final Contact? contact;
  final String? photoUrl;
  final Categories category;
  final List<Activities>? activities;
  final Localization localization;

  Location(
      {required this.nom,
      required this.description,
      this.schedule,
      this.contact,
      required this.photoUrl,
      required this.category,
      required this.activities,
      required this.localization});
}
