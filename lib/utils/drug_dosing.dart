
import '../data/drug_database.dart';
import 'ventilation_math.dart'; // for AgeGroup enum

class DrugDosing {
  static String calculateDoseString(Drug drug, double weightKg, AgeGroup ageGroup) {
    double? dosePerKg;
    
    switch (ageGroup) {
      case AgeGroup.adult:
        dosePerKg = drug.doseAdult;
        break;
      case AgeGroup.pediatric:
        dosePerKg = drug.dosePed;
        break;
      case AgeGroup.neonate:
        dosePerKg = drug.doseNeo;
        break;
    }

    if (dosePerKg == null) {
      return "Not recommended / Consult specialist";
    }

    // Special Handling for fixed doses (hacky check based on unit string, ideal is struct flag)
    if (drug.unit.contains("Fixed") && ageGroup == AgeGroup.adult) {
      return "${dosePerKg.toStringAsFixed(1)} mg (Fixed)"; // Assuming mg for fixed
    }

    // Calculation
    double totalDose = dosePerKg * weightKg;

    // Formatting
    if (drug.unit.contains("mcg/kg/min")) {
      return "${dosePerKg.toStringAsFixed(2)} mcg/kg/min\n(Rate: ${(totalDose * 60).toStringAsFixed(1)} mcg/hr)";
    }
    
    // Standard mg/kg
    return "${totalDose.toStringAsFixed(1)} mg";
  }
}
