
import 'dart:math';

enum Sex { male, female }
enum AgeGroup { adult, pediatric, neonate }

class VentilationMath {
  /// Calculate Predicted Body Weight (PBW) / Ideal Body Weight (IBW)
  /// Male: 50 + 0.91 * (height_cm - 152.4)
  /// Female: 45.5 + 0.91 * (height_cm - 152.4)
  /// For pediatrics/neonates, we might use actual weight, but here we provide IBW context for adults.
  static double calculateIBW(double heightCm, Sex sex) {
    if (heightCm <= 0) return 0;
    double base = (sex == Sex.male) ? 50.0 : 45.5;
    double ibw = base + 0.91 * (heightCm - 152.4);
    return ibw > 0 ? ibw : 0; // Safety clamp
  }

  /// Tidal Volume (VT)
  /// Target: 6-8 mL/kg IBW (ARDSnet)
  static Map<String, double> calculateVT(double weightKg) {
    return {
      'low_6ml': double.parse((weightKg * 6).toStringAsFixed(1)),
      'high_8ml': double.parse((weightKg * 8).toStringAsFixed(1)),
    };
  }

  /// Estimated Minute Ventilation (MV)
  /// Normal roughly 100 mL/kg/min for peds, or 5-8 L/min for adults.
  /// Here we calculate based on set RR and VT.
  static double calculateMV(double rr, double vtMl) {
    return (rr * vtMl) / 1000.0; // in Liters
  }

  /// Initial Respiratory Rate (RR) suggestions
  static int getInitialRR(AgeGroup age) {
    switch (age) {
      case AgeGroup.neonate:
        return 40;
      case AgeGroup.pediatric:
        return 20;
      case AgeGroup.adult:
        return 16; // 12-20
    }
  }

  /// Initial PEEP suggestions (cmH2O)
  static int getInitialPEEP(AgeGroup age) {
    return 5; // Standard starting point
  }

  /// Tube Depth estimate (Oral)
  /// Peds: Age/2 + 12 (approx) or Weight(kg) + 6
  /// Neonate: Weight + 6
  /// Adult: Fixed (21-23cm)
  static String estimateTubeDepth(AgeGroup age, double? weight, double? ageYears) {
    switch (age) {
      case AgeGroup.neonate:
        if (weight != null) return "${(weight + 6).toStringAsFixed(1)} cm at lip";
        return "Unknown";
      case AgeGroup.pediatric:
        if (ageYears != null) return "${(ageYears / 2 + 12).toStringAsFixed(1)} cm at lip";
        return "Unknown";
      case AgeGroup.adult:
        return "21-23 cm at lip";
    }
  }
}
