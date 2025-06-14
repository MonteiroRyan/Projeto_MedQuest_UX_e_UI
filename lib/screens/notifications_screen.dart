import 'package:flutter/material.dart';
import '../models/notification.dart';

class NotificationsScreen extends StatelessWidget {
  final List<AppNotification> notifications = [
    AppNotification(
      title: "Compromisso do dia",
      message: "Exame diário com Dr.Smith às 9:00 am",
      dateTime: DateTime.now().subtract(Duration(hours: 2)),
      type: NotificationType.compromisso,
      read: false,
    ),
    AppNotification(
      title: "Lembrete de medicação",
      message: "Não esqueça de tomar sua dose de metformina",
      dateTime: DateTime.now().subtract(Duration(minutes: 15)),
      type: NotificationType.lembreteMedicacao,
      read: false,
    ),
    AppNotification(
      title: "Jejum requerido",
      message: "Lembre-se de jejuar por 8 horas antes do exame de sangue",
      dateTime: DateTime.now().subtract(Duration(hours: 1)),
      type: NotificationType.jejum,
      read: false,
    ),
    AppNotification(
      title: "Próximos compromissos",
      message: "Exame cardiológico com Dr.White em 2 de Maio",
      dateTime: DateTime.now().subtract(Duration(days: 1)),
      type: NotificationType.proximoCompromisso,
      read: true,
    ),
  ];

  NotificationsScreen({super.key});

  String timeAgo(DateTime dt) {
    final now = DateTime.now();
    final diff = now.difference(dt);
    if (diff.inMinutes < 60 && diff.inMinutes > 0) {
      return "${diff.inMinutes} minutos atrás";
    } else if (diff.inHours < 24 && diff.inHours > 0) {
      return "${diff.inHours} horas atrás";
    } else if (diff.inDays == 0) {
      return "Hoje";
    } else if (diff.inDays == 1) {
      return "Ontem";
    } else {
      return "${diff.inDays} dias atrás";
    }
  }

  IconData getIcon(NotificationType type) {
    switch (type) {
      case NotificationType.compromisso:
      case NotificationType.lembreteMedicacao:
        return Icons.notifications_none_outlined;
      case NotificationType.jejum:
        return Icons.do_not_disturb_alt;
      case NotificationType.proximoCompromisso:
        return Icons.event_note_outlined;
      default:
        return Icons.notifications_none_outlined;
    }
  }

  Color getIconColor(NotificationType type, bool read) {
    if (read) return Colors.grey[400]!;
    switch (type) {
      case NotificationType.jejum:
        return Colors.redAccent;
      default:
        return Colors.blueAccent;
    }
  }

  @override
  Widget build(BuildContext context) {
    int unreadCount = notifications.where((n) => !n.read).length;

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 14),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Notificações",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    fontFamily: 'RobotoMono',
                  ),
                ),
                Text(
                  "Marcar todas como lida",
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontFamily: 'RobotoMono',
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            ...notifications.map(
              (n) => Padding(
                padding: const EdgeInsets.only(bottom: 14.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: n.read ? Colors.white : Color(0xFFB3E0FF),
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(3, 3),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        getIcon(n.type),
                        color: getIconColor(n.type, n.read),
                        size: 29,
                      ),
                      SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    n.title,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      fontFamily: 'RobotoMono',
                                    ),
                                  ),
                                ),
                                Text(
                                  timeAgo(n.dateTime),
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey[700],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 2),
                            Text(
                              n.message,
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            if (unreadCount > 0)
              Align(
                alignment: Alignment.center,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 22, vertical: 8),
                  decoration: BoxDecoration(
                    color: Color(0xFF40BFFF),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    "$unreadCount notificações",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            SizedBox(height: 120),
            IconButton(
              icon: Icon(Icons.arrow_back, size: 28),
              onPressed: () => Navigator.pushNamed(context, '/home'),
            ),
          ],
        ),
      ),
    );
  }
}
