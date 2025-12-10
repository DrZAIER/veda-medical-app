
import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'package:google_fonts/google_fonts.dart';

class AlgorithmsScreen extends StatelessWidget {
  const AlgorithmsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Algorithms"),
          bottom: const TabBar(
            tabs: [
              Tab(text: "Airway"),
              Tab(text: "ALS"),
              Tab(text: "EPALS"),
            ],
            labelColor: AppTheme.primaryBlue,
            unselectedLabelColor: Colors.grey,
            indicatorColor: AppTheme.primaryBlue,
          ),
        ),
        body: TabBarView(
          children: [
            _buildAirwayTab(context),
            _buildALSTab(context),
            _buildEPALSTab(context),
          ],
        ),
      ),
    );
  }

  Widget _buildAirwayTab(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildAlgoCard(
          context,
          "Difficult Intubation (DAS Guidelines)",
          [
            "Plan A: Facemask ventilation and tracheal intubation",
            "Plan B: Supraglottic Airway Device (SAD)",
            "Plan C: Facemask ventilation (FINAL attempt)",
            "Plan D: Emergency Front of Neck Access (CICO)",
          ],
          Colors.blue.shade50,
        ),
        _buildAlgoCard(
          context,
          "LEMON Assessment",
          [
            "L: Look externally",
            "E: Evaluate 3-3-2",
            "M: Mallampati",
            "O: Obstruction",
            "N: Neck Mobility",
          ],
          Colors.orange.shade50,
        ),
      ],
    );
  }

  Widget _buildALSTab(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
          // Image for ALS
          Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: InteractiveViewer(
              child: Image.asset("assets/images/als_algorithm.png", fit: BoxFit.contain),
            ),
          ),
          const SizedBox(height: 16),
        _buildAlgoCard(
          context,
          "Cardiac Arrest (Text Summary)",
          [
            "1. CPR 30:2",
            "2. Attach Defibrillator",
            "3. Assess Rhythm",
            "   - Shockable (VF/pVT): Shock -> CPR 2 min",
            "   - Non-Shockable (PEA/Asystole): CPR 2 min",
            "4. Adrenaline 1mg every 3-5 min",
            "5. Amiodarone 300mg after 3rd shock",
          ],
          Colors.red.shade50,
        ),
      ],
    );
  }

  Widget _buildEPALSTab(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
          // Image for EPALS
          Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: InteractiveViewer(
              child: Image.asset("assets/images/epals_algorithm.png", fit: BoxFit.contain),
            ),
          ),
          const SizedBox(height: 16),
        _buildAlgoCard(
          context,
          "Paediatric Life Support (Text Summary)",
          [
            "1. 5 Rescue Breaths",
            "2. 15:2 CPR",
            "3. Assess Rhythm",
            "   - Shockable: 4 J/kg",
            "   - Non-Shockable: Epinephrine 10 mcg/kg",
          ],
          Colors.purple.shade50,
        ),
      ],
    );
  }

  Widget _buildAlgoCard(BuildContext context, String title, List<String> steps, Color bgColor) {
    return Card(
      color: bgColor,
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.outfit(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const Divider(),
            ...steps.map((step) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.arrow_right, size: 20, color: Colors.blueGrey),
                  Expanded(child: Text(step, style: const TextStyle(fontSize: 15))),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
