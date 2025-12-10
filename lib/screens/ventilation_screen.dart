
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:veda_app/l10n/app_localizations.dart';
import '../utils/ventilation_math.dart';
import '../widgets/input_field.dart';
import '../widgets/result_card.dart';
import '../theme/app_theme.dart';

class VentilationScreen extends StatefulWidget {
  const VentilationScreen({super.key});

  @override
  State<VentilationScreen> createState() => _VentilationScreenState();
}

class _VentilationScreenState extends State<VentilationScreen> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  
  Sex _selectedSex = Sex.male;
  AgeGroup _selectedAge = AgeGroup.adult;

  double _ibw = 0;
  double _vtLow = 0;
  double _vtHigh = 0;
  int _rr = 0;
  double _mvLow = 0;
  double _mvHigh = 0;
  String _tubeDepth = "Unknown";
  
  // Validation Errors
  String? _heightError;
  String? _weightError;

  void _calculate() {
    setState(() {
      _heightError = null;
      _weightError = null;

      double height = double.tryParse(_heightController.text) ?? 0;
      double actualWeight = double.tryParse(_weightController.text) ?? 0;

      // Validate Inputs
      if (height > 300) {
        _heightError = "Max 300cm";
      }
      if (actualWeight > 250) {
        _weightError = "Max 250kg";
      }

      if (_heightError != null || _weightError != null) {
         // Stop calculation if invalid (or minimal return)
         _ibw = 0; _vtLow = 0; _vtHigh = 0; _rr = 0; _mvLow = 0; _mvHigh = 0; _tubeDepth = "Invalid Input";
         return; 
      }

      if (_selectedAge == AgeGroup.adult) {
        _ibw = VentilationMath.calculateIBW(height, _selectedSex);
        if (_ibw > 0) {
          var vt = VentilationMath.calculateVT(_ibw);
          _vtLow = vt['low_6ml']!;
          _vtHigh = vt['high_8ml']!;
        } else {
           _vtLow = 0; _vtHigh = 0;
        }
      } else {
        // Pediatric / Neonate use actual weight usually
        _ibw = actualWeight; // Display actual weight as the "dosing weight"
        var vt = VentilationMath.calculateVT(actualWeight);
        _vtLow = vt['low_6ml']!;
        _vtHigh = vt['high_8ml']!;
      }

      _rr = VentilationMath.getInitialRR(_selectedAge);

      if (_vtLow > 0) {
        _mvLow = VentilationMath.calculateMV(_rr.toDouble(), _vtLow);
        _mvHigh = VentilationMath.calculateMV(_rr.toDouble(), _vtHigh);
      } else {
        _mvLow = 0; _mvHigh = 0;
      }
      
      // Tube Depth
      double? ageParam; // Ideally we'd have an age input in years, simply assuming null for now or estimating
      _tubeDepth = VentilationMath.estimateTubeDepth(_selectedAge, actualWeight > 0 ? actualWeight : _ibw, null);
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.ventilationTitle),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Input Card
            Card(
              elevation: 4,
              shadowColor: Colors.black26,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    // Age Segmented Control
                    SizedBox(
                      width: double.infinity,
                      child: SegmentedButton<AgeGroup>(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.selected)) {
                                return AppTheme.primaryBlue;
                              }
                              return Colors.white; 
                            },
                          ),
                          foregroundColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.selected)) {
                                return Colors.white;
                              }
                              return Colors.black87;
                            },
                          ),
                        ),
                        segments: [
                          ButtonSegment(value: AgeGroup.adult, label: Text(l10n.adult)),
                          ButtonSegment(value: AgeGroup.pediatric, label: Text(l10n.pediatric)),
                          ButtonSegment(value: AgeGroup.neonate, label: Text(l10n.neonate)),
                        ],
                        selected: {_selectedAge},
                        onSelectionChanged: (Set<AgeGroup> newSelection) {
                          setState(() {
                            _selectedAge = newSelection.first;
                            _calculate();
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 20),

                    if (_selectedAge == AgeGroup.adult) ...[
                      // Sex Selector for Adults
                      Row(
                        children: [
                          Expanded(
                            child: _buildSexSelector(Sex.male, l10n.male, Icons.male),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _buildSexSelector(Sex.female, l10n.female, Icons.female),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      InputField(
                        label: l10n.heightLabel,
                        controller: _heightController,
                        suffixText: "cm",
                        errorText: _heightError,
                        onChanged: (val) => _calculate(),
                      ),
                    ] else ...[
                      // Weight Input for Peds/Neo
                      InputField(
                        label: l10n.weightLabel,
                        controller: _weightController,
                        suffixText: "kg",
                        errorText: _weightError,
                        onChanged: (val) => _calculate(),
                      ),
                    ]
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Results Section
            if (_ibw > 0 || (_selectedAge != AgeGroup.adult && double.tryParse(_weightController.text) != null)) ...[
              ResultCard(
                title: _selectedAge == AgeGroup.adult ? l10n.pbwLabel : l10n.dosingWeightLabel,
                value: "${_ibw.toStringAsFixed(1)} kg",
                icon: Icons.monitor_weight,
                color: AppTheme.secondaryTeal.withOpacity(0.1),
              ),
              ResultCard(
                title: l10n.vtLabel,
                value: "${_vtLow.toInt()} - ${_vtHigh.toInt()} mL",
                icon: Icons.air,
                color: AppTheme.primaryBlue.withOpacity(0.1),
              ),
              Row(
                children: [
                  Expanded(
                    child: ResultCard(
                      title: l10n.rrLabel,
                      value: "$_rr bpm",
                      icon: Icons.timer,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ResultCard(
                      title: l10n.mvLabel,
                      value: "${_mvLow.toStringAsFixed(1)}-${_mvHigh.toStringAsFixed(1)} L/min",
                      icon: Icons.speed,
                    ),
                  ),
                ],
              ),
              ResultCard(
                title: l10n.peepLabel,
                value: "${VentilationMath.getInitialPEEP(_selectedAge)} cmH2O",
                icon: Icons.waves,
              ),
               ResultCard(
                title: l10n.tubeDepthLabel,
                value: _tubeDepth,
                icon: Icons.linear_scale,
              ),
            ] else 
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Column(
                  children: [
                    Icon(Icons.arrow_upward, size: 48, color: Colors.grey.withOpacity(0.3)),
                    const SizedBox(height: 16),
                    Text(
                      l10n.enterParams,
                      style: GoogleFonts.outfit(color: Colors.grey, fontSize: 18),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildSexSelector(Sex sex, String label, IconData icon) {
    bool isSelected = _selectedSex == sex;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedSex = sex;
          _calculate();
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.primaryBlue : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppTheme.primaryBlue : Colors.grey.shade300,
          ),
          boxShadow: isSelected ? [
            BoxShadow(
              color: AppTheme.primaryBlue.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            )
          ] : [],
        ),
        child: Column(
          children: [
            Icon(icon, color: isSelected ? Colors.white : Colors.grey, size: 28),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : Colors.grey.shade700,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
