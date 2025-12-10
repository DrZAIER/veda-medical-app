
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:veda_app/l10n/app_localizations.dart';
import '../data/drug_database.dart';
import '../utils/drug_dosing.dart';
import '../utils/ventilation_math.dart'; 
import '../widgets/input_field.dart';
import '../theme/app_theme.dart';

class DrugListScreen extends StatefulWidget {
  final String title;
  final DrugCategory category;

  const DrugListScreen({
    super.key,
    required this.title,
    required this.category,
  });

  @override
  State<DrugListScreen> createState() => _DrugListScreenState();
}

class _DrugListScreenState extends State<DrugListScreen> {
  final TextEditingController _weightController = TextEditingController();
  AgeGroup _selectedAge = AgeGroup.adult;
  double _weight = 0;
  String? _weightError;

  void _updateCalculations() {
    setState(() {
      _weightError = null;
      double w = double.tryParse(_weightController.text) ?? 0;
      
      if (w > 250) {
        _weightError = "Max 250kg";
        _weight = 0;
      } else {
        _weight = w;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final drugs = DrugDatabase.getByCategory(widget.category);
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        children: [
          // Header: Patient Context
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.vertical(bottom: Radius.circular(24)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                )
              ],
            ),
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: SegmentedButton<AgeGroup>(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.selected)) {
                            return AppTheme.primaryBlue;
                          }
                          return Colors.grey.shade50;
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
                        _updateCalculations();
                      });
                    },
                  ),
                ),
                const SizedBox(height: 16),
                InputField(
                  label: l10n.weightLabel,
                  controller: _weightController,
                  suffixText: "kg",
                  errorText: _weightError,
                  onChanged: (val) => _updateCalculations(),
                ),
              ],
            ),
          ),
          
          // Drug List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: drugs.length,
              itemBuilder: (context, index) {
                final drug = drugs[index];
                final calculatedDose = (_weight > 0)
                    ? DrugDosing.calculateDoseString(drug, _weight, _selectedAge)
                    : l10n.enterParams;

                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ExpansionTile(
                    shape: Border.all(color: Colors.transparent),
                    collapsedShape: Border.all(color: Colors.transparent),
                    leading: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppTheme.secondaryTeal.withOpacity(0.1),
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        drug.name.substring(0, 1),
                        style: const TextStyle(
                          color: AppTheme.secondaryTeal, 
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    title: Text(
                      drug.name,
                      style: GoogleFonts.outfit(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    subtitle: Text(
                      drug.indication,
                      style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                    ),
                    // Trailing dose bubble
                    trailing: (_weight > 0) 
                      ? Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                          decoration: BoxDecoration(
                            color: Colors.green.shade50,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.green.shade200),
                          ),
                          child: Text(
                            calculatedDose.split('\n')[0], // Show first line
                            style: TextStyle(
                              color: Colors.green.shade800, 
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                          ),
                        )
                      : const Icon(Icons.arrow_drop_down, color: Colors.grey),
                    children: [
                       Container(
                         padding: const EdgeInsets.all(16.0),
                         decoration: BoxDecoration(
                           color: Colors.grey.shade50,
                           borderRadius: const BorderRadius.vertical(bottom: Radius.circular(16)),
                         ),
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.stretch,
                           children: [
                             _buildDetailRow(l10n.doseCalculation, calculatedDose, isHighlight: true),
                             const Divider(height: 24),
                             _buildDetailRow(l10n.standardDose, "${drug.unit}"),
                             _buildDetailRow(l10n.route, drug.route),
                             _buildDetailRow(l10n.onset, drug.onset),
                             _buildDetailRow(l10n.duration, drug.duration),
                             if (drug.warning.isNotEmpty)
                               _buildDetailRow(l10n.warning, drug.warning, isWarning: true),
                           ],
                         ),
                       )
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, {bool isHighlight = false, bool isWarning = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.bold, 
                color: Colors.grey.shade700,
                fontSize: 13,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                fontWeight: isHighlight ? FontWeight.bold : FontWeight.normal,
                color: isWarning ? Colors.red.shade700 : (isHighlight ? AppTheme.primaryBlue : Colors.black87),
                fontSize: isHighlight ? 16 : 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
