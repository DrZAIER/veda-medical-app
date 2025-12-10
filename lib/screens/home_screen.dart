
import 'package:flutter/material.dart';
import 'package:veda_app/l10n/app_localizations.dart';
import '../theme/app_theme.dart';
import 'ventilation_screen.dart';
import 'drug_list_screen.dart';
import 'algorithms_screen.dart';
import '../data/drug_database.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      // Gradient Background
      body: Container(
        decoration: const BoxDecoration(
          gradient: AppTheme.primaryGradient,
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Custom App Bar Area
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          l10n.appTitle,
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Critical Care Companion",
                          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white24,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.medical_services, color: Colors.white),
                    )
                  ],
                ),
              ),
              
              // Content
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: AppTheme.backgroundLight,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: ListView(
                    padding: const EdgeInsets.all(24.0),
                    children: [
                      _buildSectionHeader(context, "Calculators"),
                      _buildNavCard(
                        context,
                        title: l10n.ventilationTitle,
                        subtitle: l10n.ventilationSubtitle,
                        icon: Icons.air,
                        color: AppTheme.primaryBlue,
                        destination: const VentilationScreen(),
                      ),
                      
                      const SizedBox(height: 16),
                      _buildSectionHeader(context, "Emergency Drugs"),
                      _buildNavCard(
                        context,
                        title: l10n.rsiTitle,
                        subtitle: l10n.rsiSubtitle,
                        icon: Icons.local_hospital,
                        color: AppTheme.accentIndigo,
                        destination: const DrugListScreen(title: "RSI", category: DrugCategory.rsi),
                      ),
                      _buildNavCard(
                        context,
                        title: l10n.shockTitle,
                        subtitle: l10n.shockSubtitle,
                        icon: Icons.flash_on,
                        color: Colors.orange.shade700,
                        destination: const DrugListScreen(title: "Shock", category: DrugCategory.shock),
                      ),
                      _buildNavCard(
                        context,
                        title: l10n.arrestTitle,
                        subtitle: l10n.arrestSubtitle,
                        icon: Icons.favorite,
                        color: Colors.red.shade600,
                        destination: const DrugListScreen(title: "ACLS", category: DrugCategory.arrest),
                      ),

                      const SizedBox(height: 16),
                      _buildSectionHeader(context, "Protocols"),
                      // New Algorithms Screen (Placeholder for now until created)
                       _buildNavCard(
                        context,
                        title: "Algorithms",
                        subtitle: "ALS, EPALS, Difficult Intubation",
                        icon: Icons.library_books,
                        color: Colors.teal,
                         destination: const AlgorithmsScreen(), // We will create this next
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0, left: 4),
      child: Text(
        title.toUpperCase(),
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
          color: Colors.grey.shade600,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.2,
        ),
      ),
    );
  }

  Widget _buildNavCard(BuildContext context,
      {required String title,
      required String subtitle,
      required IconData icon,
      required Color color,
      required Widget destination}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, 4),
            blurRadius: 15,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(20),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => destination),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [color.withOpacity(0.1), color.withOpacity(0.2)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, color: color, size: 28),
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey.shade900,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.blueGrey.shade500,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.chevron_right, color: Colors.grey.shade300, size: 28),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
