// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'Assistant VEDA';

  @override
  String get ventilationTitle => 'Ventilation';

  @override
  String get ventilationSubtitle => 'VT, FR, MV, Prof. Sonde';

  @override
  String get rsiTitle => 'Drogues ISR';

  @override
  String get rsiSubtitle => 'Induction & Paralysie';

  @override
  String get shockTitle => 'Choc';

  @override
  String get shockSubtitle => 'Vasopresseurs & Inotropes';

  @override
  String get arrestTitle => 'Arrêt Cardiaque';

  @override
  String get arrestSubtitle => 'Médicaments SARC';

  @override
  String get adult => 'Adulte';

  @override
  String get pediatric => 'Pédiatrie';

  @override
  String get neonate => 'Néonat';

  @override
  String get male => 'Homme';

  @override
  String get female => 'Femme';

  @override
  String get heightLabel => 'Taille (cm)';

  @override
  String get weightLabel => 'Poids (kg)';

  @override
  String get calculate => 'Calculer';

  @override
  String get pbwLabel => 'Poids Idéal Théorique (PBW)';

  @override
  String get dosingWeightLabel => 'Poids de dosage';

  @override
  String get vtLabel => 'Volume Courant Cible (6-8 mL/kg)';

  @override
  String get rrLabel => 'FR Initiale';

  @override
  String get mvLabel => 'Ventilation Minute';

  @override
  String get peepLabel => 'PEEP Suggérée';

  @override
  String get tubeDepthLabel => 'Prof. Sonde (ETT)';

  @override
  String get enterParams => 'Entrez les paramètres';

  @override
  String get doseCalculation => 'Calcul de Dose';

  @override
  String get standardDose => 'Dose Standard';

  @override
  String get route => 'Voie';

  @override
  String get onset => 'Délai';

  @override
  String get duration => 'Durée';

  @override
  String get warning => 'Attention';
}
