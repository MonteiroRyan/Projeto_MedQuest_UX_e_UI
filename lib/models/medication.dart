enum MedicationFrequency { diariamente, duasVezesPorDia, semanalmente }

enum MedicationTime { manha, tarde, noite, aoAnoitecer }

class Medication {
  final String name;
  final String dosage; // Ex: "10 mg"
  final MedicationFrequency frequency;
  final List<MedicationTime> times; // Ex: [manha, aoAnoitecer]
  final bool takenToday;

  Medication({
    required this.name,
    required this.dosage,
    required this.frequency,
    required this.times,
    this.takenToday = false,
  });
}
