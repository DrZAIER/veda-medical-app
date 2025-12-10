// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get appTitle => 'Asistente VEDA';

  @override
  String get ventilationTitle => 'Ventilación';

  @override
  String get ventilationSubtitle => 'VC, FR, VM, Prof. Tubo';

  @override
  String get rsiTitle => 'Fármacos SIR';

  @override
  String get rsiSubtitle => 'Inducción y Parálisis';

  @override
  String get shockTitle => 'Manejo del Shock';

  @override
  String get shockSubtitle => 'Vasopresores e Inotrópicos';

  @override
  String get arrestTitle => 'Paro Cardíaco';

  @override
  String get arrestSubtitle => 'Medicamentos ACLS';

  @override
  String get adult => 'Adulto';

  @override
  String get pediatric => 'Pediátrico';

  @override
  String get neonate => 'Neonato';

  @override
  String get male => 'Hombre';

  @override
  String get female => 'Mujer';

  @override
  String get heightLabel => 'Altura (cm)';

  @override
  String get weightLabel => 'Peso (kg)';

  @override
  String get calculate => 'Calcular';

  @override
  String get pbwLabel => 'Peso Corporal Predicho';

  @override
  String get dosingWeightLabel => 'Peso de dosificación';

  @override
  String get vtLabel => 'Vol. Corriente Objetivo (6-8 mL/kg)';

  @override
  String get rrLabel => 'FR Inicial';

  @override
  String get mvLabel => 'Ventilación Minuto';

  @override
  String get peepLabel => 'PEEP Sugerida';

  @override
  String get tubeDepthLabel => 'Prof. Tubo (ETT)';

  @override
  String get enterParams => 'Ingrese parámetros';

  @override
  String get doseCalculation => 'Cálculo de Dosis';

  @override
  String get standardDose => 'Dosis Estándar';

  @override
  String get route => 'Vía';

  @override
  String get onset => 'Inicio';

  @override
  String get duration => 'Duración';

  @override
  String get warning => 'Advertencia';
}
