// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'VEDA Assistant';

  @override
  String get ventilationTitle => 'Ventilation';

  @override
  String get ventilationSubtitle => 'TV, RR, MV, Tube Depth';

  @override
  String get rsiTitle => 'RSI Drugs';

  @override
  String get rsiSubtitle => 'Induction & Paralytics';

  @override
  String get shockTitle => 'Shock Management';

  @override
  String get shockSubtitle => 'Pressors & Inotropes';

  @override
  String get arrestTitle => 'Cardiac Arrest';

  @override
  String get arrestSubtitle => 'ACLS Medications';

  @override
  String get adult => 'Adult';

  @override
  String get pediatric => 'Pediatric';

  @override
  String get neonate => 'Neonate';

  @override
  String get male => 'Male';

  @override
  String get female => 'Female';

  @override
  String get heightLabel => 'Height (cm)';

  @override
  String get weightLabel => 'Weight (kg)';

  @override
  String get calculate => 'Calculate';

  @override
  String get pbwLabel => 'Predicted Body Weight (PBW)';

  @override
  String get dosingWeightLabel => 'Dosing Weight';

  @override
  String get vtLabel => 'Tidal Volume Target (6-8 mL/kg)';

  @override
  String get rrLabel => 'Initial RR';

  @override
  String get mvLabel => 'Min. Ventilation';

  @override
  String get peepLabel => 'Suggested PEEP';

  @override
  String get tubeDepthLabel => 'ETT Depth Estimate';

  @override
  String get enterParams => 'Enter parameters to see results';

  @override
  String get doseCalculation => 'Dose Calculation';

  @override
  String get standardDose => 'Standard Dose';

  @override
  String get route => 'Route';

  @override
  String get onset => 'Onset';

  @override
  String get duration => 'Duration';

  @override
  String get warning => 'Warning';
}
