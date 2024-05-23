import 'package:app/pages/PlantPage.dart'; // Ensure the correct path is used here

// plant_view.dart
class PlantView {
  final String imageUrl;
  final String species;
  final String condition;
  final DateTime date;

  const PlantView({
    required this.imageUrl,
    required this.species,
    required this.condition,
    required this.date,
  });
}
