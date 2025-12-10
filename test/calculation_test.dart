
import 'package:flutter_test/flutter_test.dart';
import 'package:veda_app/utils/ventilation_math.dart';
import 'package:veda_app/data/drug_database.dart';
import 'package:veda_app/utils/drug_dosing.dart';

void main() {
  group('Ventilation Math Tests', () {
    test('IBW Calculation - Male 180cm', () {
      // 50 + 0.91 * (180 - 152.4) = 50 + 0.91 * 27.6 = 50 + 25.116 = 75.116
      double ibw = VentilationMath.calculateIBW(180, Sex.male);
      expect(ibw, closeTo(75.1, 0.1));
    });

    test('IBW Calculation - Female 160cm', () {
      // 45.5 + 0.91 * (160 - 152.4) = 45.5 + 0.91 * 7.6 = 45.5 + 6.916 = 52.416
      double ibw = VentilationMath.calculateIBW(160, Sex.female);
      expect(ibw, closeTo(52.4, 0.1));
    });

    test('VT Calculation - 70kg', () {
      var vt = VentilationMath.calculateVT(70);
      expect(vt['low_6ml'], 420.0); // 70*6
      expect(vt['high_8ml'], 560.0); // 70*8
    });
  });

  group('Drug Dosing Tests', () {
    test('Etomidate Adult Dose - 70kg', () {
      // 0.3 mg/kg
      Drug etomidate = DrugDatabase.allDrugs.firstWhere((d) => d.name == "Etomidate");
      String dose = DrugDosing.calculateDoseString(etomidate, 70, AgeGroup.adult);
      expect(dose, contains("21.0 mg"));
    });

    test('Adrenaline Shock Peds Dose - 20kg', () {
      // 0.1 mcg/kg/min -> 2 mcg/min -> 120 mcg/hr
      Drug adrenaline = DrugDatabase.allDrugs.firstWhere((d) => d.name.contains("Adrenaline (Epinephrine)"));
      String dose = DrugDosing.calculateDoseString(adrenaline, 20, AgeGroup.pediatric);
      expect(dose, contains("0.10 mcg/kg/min"));
    });
  });
}
