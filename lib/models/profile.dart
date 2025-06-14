class UserProfile {
  final String name;
  final String email;
  final String? avatarUrl;

  // Preferências
  final NotificationPreferences notificationPreferences;

  UserProfile({
    required this.name,
    required this.email,
    this.avatarUrl,
    required this.notificationPreferences,
  });
}

class NotificationPreferences {
  final bool push;
  final bool email;

  NotificationPreferences({required this.push, required this.email});
}
