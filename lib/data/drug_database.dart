
enum DrugCategory { rsi, shock, arrest }

class Drug {
  final String name;
  final String indication;
  final DrugCategory category;
  final double? doseAdult; // mg/kg or mcg/kg/min
  final double? dosePed;
  final double? doseNeo;
  final String unit; // "mg/kg", "mcg/kg/min", "fixed"
  final String route;
  final String onset;
  final String duration;
  final String warning;

  const Drug({
    required this.name,
    required this.indication,
    required this.category,
    this.doseAdult,
    this.dosePed,
    this.doseNeo,
    required this.unit,
    required this.route,
    required this.onset,
    required this.duration,
    required this.warning,
  });
}

class DrugDatabase {
  static const List<Drug> allDrugs = [
    // RSI
    Drug(
      name: "Etomidate",
      indication: "Induction",
      category: DrugCategory.rsi,
      doseAdult: 0.3,
      dosePed: 0.3,
      doseNeo: null, // Often avoided
      unit: "mg/kg",
      route: "IV",
      onset: "30-60 sec",
      duration: "3-5 min",
      warning: "Adrenal suppression risk.",
    ),
    Drug(
      name: "Ketamine",
      indication: "Induction / Asthma",
      category: DrugCategory.rsi,
      doseAdult: 1.5,
      dosePed: 2.0,
      doseNeo: 2.0,
      unit: "mg/kg",
      route: "IV",
      onset: "30-60 sec",
      duration: "10-20 min",
      warning: "Can increase ICP/IOP (controversial). Bronchodilator.",
    ),
    Drug(
      name: "Succinylcholine",
      indication: "Paralytic",
      category: DrugCategory.rsi,
      doseAdult: 1.5,
      dosePed: 2.0,
      doseNeo: 2.0,
      unit: "mg/kg",
      route: "IV",
      onset: "45 sec",
      duration: "5-10 min",
      warning: "Contraindicated in hyperkalemia, burns >24h, crush injury.",
    ),
    Drug(
      name: "Rocuronium",
      indication: "Paralytic",
      category: DrugCategory.rsi,
      doseAdult: 1.2,
      dosePed: 1.0,
      doseNeo: 1.0, // Caution
      unit: "mg/kg",
      route: "IV",
      onset: "60-90 sec",
      duration: "30-60 min",
      warning: "Long duration. Ensure difficult airway plan.",
    ),
    
    // Shock / Pressors (Note: Doses often titration based)
    Drug(
      name: "Adrenaline (Epinephrine)",
      indication: "Shock / Hypotension",
      category: DrugCategory.shock,
      doseAdult: 0.1, // mcg/kg/min start
      dosePed: 0.1,
      doseNeo: 0.1,
      unit: "mcg/kg/min",
      route: "IV/IO",
      onset: "Immediate",
      duration: "Short",
      warning: "Titrate to effect. Central line preferred.",
    ),
    Drug(
      name: "Noradrenaline",
      indication: "Septic Shock",
      category: DrugCategory.shock,
      doseAdult: 0.1,
      dosePed: 0.1,
      doseNeo: 0.1,
      unit: "mcg/kg/min",
      route: "IV/IO",
      onset: "Immediate",
      duration: "Short",
      warning: "Tissue necrosis if extravasation.",
    ),
    
    // Cardiac Arrest
    Drug(
      name: "Adrenaline (Cardiac Arrest)",
      indication: "VF/pVT/Asystole/PEA",
      category: DrugCategory.arrest,
      doseAdult: 1.0, // Fixed mg
      dosePed: 0.01, // mg/kg (10mcg/kg)
      doseNeo: 0.01,
      unit: "mg/kg (Fixed 1mg Adult)",
      route: "IV/IO",
      onset: "Immediate",
      duration: "3-5 min",
      warning: "Repeat every 3-5 mins.",
    ),
    Drug(
      name: "Amiodarone",
      indication: "Refractory VF/pVT",
      category: DrugCategory.arrest,
      doseAdult: 300.0, // Fixed mg first dose
      dosePed: 5.0,
      doseNeo: 5.0,
      unit: "mg/kg (Fixed 300mg Adult)",
      route: "IV/IO",
      onset: "Variable",
      duration: "Long",
      warning: "Can cause hypotension.",
    ),
  ];

  static List<Drug> getByCategory(DrugCategory category) {
    return allDrugs.where((d) => d.category == category).toList();
  }
}
