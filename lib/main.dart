import 'package:flutter/material.dart';
import 'package:medquest_app/screens/daily_questionnaire_screen.dart';
import 'package:medquest_app/screens/medications_screen.dart';
import 'package:medquest_app/screens/notifications_screen.dart';
import 'package:medquest_app/screens/profile_screen.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/appointments_screen.dart';
import 'screens/new_appointment_screen.dart';
import 'widgets/bottom_nav_bar.dart';

void main() {
  runApp(MedQuestApp());
}

class MedQuestApp extends StatelessWidget {
  const MedQuestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MedQuest',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Color(0xFFE3F2FD),
        fontFamily: 'RobotoMono',
      ),
      initialRoute: '/login',
      routes: {
        '/login': (_) => LoginScreen(),
        '/home': (_) => MainNavigation(),
        '/appointments': (_) => AppointmentsScreen(),
        '/new_appointment': (_) => NewAppointmentScreen(),
        '/questionnaire': (_) => DailyQuestionnaireScreen(),
        '/medications': (_) => MedicationsScreen(),
        '/profile': (_) => ProfileScreen(),
        '/notifications': (_) => NotificationsScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    AppointmentsScreen(),
    DailyQuestionnaireScreen(),
    NewAppointmentScreen(),
    MedicationsScreen(),
    NotificationsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
      ),
    );
  }
}
