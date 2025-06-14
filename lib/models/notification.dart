enum NotificationType {
  compromisso,
  lembreteMedicacao,
  jejum,
  proximoCompromisso,
  outro,
}

class AppNotification {
  final String title;
  final String message;
  final DateTime dateTime;
  final NotificationType type;
  final bool read;

  AppNotification({
    required this.title,
    required this.message,
    required this.dateTime,
    required this.type,
    this.read = false,
  });
}
