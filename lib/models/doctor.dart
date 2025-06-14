class Doctor {
  final String name;
  final String specialty;
  final String? avatarUrl; // opcional, caso queira exibir foto

  Doctor({required this.name, required this.specialty, this.avatarUrl});
}
