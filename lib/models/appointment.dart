class Appointment {
  final String doctor;
  final String specialty;
  final DateTime date;
  final String? note;
  final String mode; // 'Online' ou 'Pessoalmente'

  Appointment({
    required this.doctor,
    required this.specialty,
    required this.date,
    this.note,
    required this.mode,
  });
}
