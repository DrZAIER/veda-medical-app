import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
    Locale('fr')
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'VEDA Assistant'**
  String get appTitle;

  /// No description provided for @ventilationTitle.
  ///
  /// In en, this message translates to:
  /// **'Ventilation'**
  String get ventilationTitle;

  /// No description provided for @ventilationSubtitle.
  ///
  /// In en, this message translates to:
  /// **'TV, RR, MV, Tube Depth'**
  String get ventilationSubtitle;

  /// No description provided for @rsiTitle.
  ///
  /// In en, this message translates to:
  /// **'RSI Drugs'**
  String get rsiTitle;

  /// No description provided for @rsiSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Induction & Paralytics'**
  String get rsiSubtitle;

  /// No description provided for @shockTitle.
  ///
  /// In en, this message translates to:
  /// **'Shock Management'**
  String get shockTitle;

  /// No description provided for @shockSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Pressors & Inotropes'**
  String get shockSubtitle;

  /// No description provided for @arrestTitle.
  ///
  /// In en, this message translates to:
  /// **'Cardiac Arrest'**
  String get arrestTitle;

  /// No description provided for @arrestSubtitle.
  ///
  /// In en, this message translates to:
  /// **'ACLS Medications'**
  String get arrestSubtitle;

  /// No description provided for @adult.
  ///
  /// In en, this message translates to:
  /// **'Adult'**
  String get adult;

  /// No description provided for @pediatric.
  ///
  /// In en, this message translates to:
  /// **'Pediatric'**
  String get pediatric;

  /// No description provided for @neonate.
  ///
  /// In en, this message translates to:
  /// **'Neonate'**
  String get neonate;

  /// No description provided for @male.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get male;

  /// No description provided for @female.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get female;

  /// No description provided for @heightLabel.
  ///
  /// In en, this message translates to:
  /// **'Height (cm)'**
  String get heightLabel;

  /// No description provided for @weightLabel.
  ///
  /// In en, this message translates to:
  /// **'Weight (kg)'**
  String get weightLabel;

  /// No description provided for @calculate.
  ///
  /// In en, this message translates to:
  /// **'Calculate'**
  String get calculate;

  /// No description provided for @pbwLabel.
  ///
  /// In en, this message translates to:
  /// **'Predicted Body Weight (PBW)'**
  String get pbwLabel;

  /// No description provided for @dosingWeightLabel.
  ///
  /// In en, this message translates to:
  /// **'Dosing Weight'**
  String get dosingWeightLabel;

  /// No description provided for @vtLabel.
  ///
  /// In en, this message translates to:
  /// **'Tidal Volume Target (6-8 mL/kg)'**
  String get vtLabel;

  /// No description provided for @rrLabel.
  ///
  /// In en, this message translates to:
  /// **'Initial RR'**
  String get rrLabel;

  /// No description provided for @mvLabel.
  ///
  /// In en, this message translates to:
  /// **'Min. Ventilation'**
  String get mvLabel;

  /// No description provided for @peepLabel.
  ///
  /// In en, this message translates to:
  /// **'Suggested PEEP'**
  String get peepLabel;

  /// No description provided for @tubeDepthLabel.
  ///
  /// In en, this message translates to:
  /// **'ETT Depth Estimate'**
  String get tubeDepthLabel;

  /// No description provided for @enterParams.
  ///
  /// In en, this message translates to:
  /// **'Enter parameters to see results'**
  String get enterParams;

  /// No description provided for @doseCalculation.
  ///
  /// In en, this message translates to:
  /// **'Dose Calculation'**
  String get doseCalculation;

  /// No description provided for @standardDose.
  ///
  /// In en, this message translates to:
  /// **'Standard Dose'**
  String get standardDose;

  /// No description provided for @route.
  ///
  /// In en, this message translates to:
  /// **'Route'**
  String get route;

  /// No description provided for @onset.
  ///
  /// In en, this message translates to:
  /// **'Onset'**
  String get onset;

  /// No description provided for @duration.
  ///
  /// In en, this message translates to:
  /// **'Duration'**
  String get duration;

  /// No description provided for @warning.
  ///
  /// In en, this message translates to:
  /// **'Warning'**
  String get warning;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
