import 'package:flutter/material.dart';
import '../models/profile.dart';

class ProfileScreen extends StatelessWidget {
  final UserProfile user = UserProfile(
    name: "Usuário",
    email: "usuario@email.com",
    avatarUrl: null,
    notificationPreferences: NotificationPreferences(push: true, email: true),
  );

  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 22, vertical: 12),
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 18),
              padding: EdgeInsets.symmetric(vertical: 24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 4,
                    offset: Offset(2, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Color(0xFFB3E0FF),
                    radius: 38,
                    child: Text(
                      user.name.isNotEmpty ? user.name[0].toUpperCase() : 'U',
                      style: TextStyle(
                        fontSize: 36,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    user.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      fontFamily: 'RobotoMono',
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    user.email,
                    style: TextStyle(color: Colors.grey[700], fontSize: 14),
                  ),
                  SizedBox(height: 10),
                  OutlinedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.edit, size: 20, color: Color(0xFF40BFFF)),
                    label: Text(
                      "Editar perfil",
                      style: TextStyle(color: Color(0xFF40BFFF)),
                    ),
                    style: OutlinedButton.styleFrom(
                      shape: StadiumBorder(),
                      side: BorderSide(color: Color(0xFF40BFFF)),
                    ),
                  ),
                ],
              ),
            ),
            ..._buildProfileOption(
              icon: Icons.settings,
              title: "Configurações da conta",
              subtitle: "Gerencie os detalhes da sua conta",
            ),
            ..._buildProfileOption(
              icon: Icons.lock_outline,
              title: "Privacidade & Segurança",
              subtitle: "Atualize sua senha e segurança",
            ),
            ..._buildProfileOption(
              icon: Icons.notifications_outlined,
              title: "Preferências de notificações",
              subtitle: "Gerenciar notificações push e notificações de email",
            ),
            ..._buildProfileOption(
              icon: Icons.help_outline,
              title: "Help & Suporte",
              subtitle: "Peça ajuda e contate o suporte",
            ),
            SizedBox(height: 18),
            OutlinedButton.icon(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/login');
              },
              icon: Icon(Icons.logout, color: Colors.redAccent),
              label: Text(
                "Sair",
                style: TextStyle(
                  color: Colors.redAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
              style: OutlinedButton.styleFrom(
                shape: StadiumBorder(),
                side: BorderSide(color: Colors.redAccent),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildProfileOption({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return [
      Container(
        margin: EdgeInsets.only(bottom: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: ListTile(
          leading: Icon(icon, color: Colors.black, size: 28),
          title: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'RobotoMono',
            ),
          ),
          subtitle: Text(subtitle, style: TextStyle(fontSize: 13)),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 18,
            color: Colors.grey[400],
          ),
          onTap: () {},
        ),
      ),
    ];
  }
}
