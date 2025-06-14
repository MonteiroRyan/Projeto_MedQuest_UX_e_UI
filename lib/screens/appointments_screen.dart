import 'package:flutter/material.dart';
import '../models/appointment.dart';
import '../widgets/appointment_card.dart';
import '../widgets/search_bar.dart';

class AppointmentsScreen extends StatefulWidget {
  const AppointmentsScreen({super.key});

  @override
  State<AppointmentsScreen> createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen> {
  String filter = "Todos";

  final List<Appointment> appointments = [
    Appointment(
      doctor: 'Dr. Smith',
      specialty: 'Exame de saúde',
      date: DateTime(DateTime.now().year, 4, 29, 9, 0),
      note: 'Jejum necessário',
      mode: 'Pessoalmente',
    ),
    Appointment(
      doctor: 'Dr. White',
      specialty: 'Cardiologista',
      date: DateTime(DateTime.now().year, 5, 1, 13, 0),
      mode: 'Online',
    ),
    Appointment(
      doctor: 'Dr. Stones',
      specialty: 'Dermatologista',
      date: DateTime(DateTime.now().year, 5, 4, 11, 0),
      mode: 'Pessoalmente',
    ),
    Appointment(
      doctor: 'Dr. Jones',
      specialty: 'Dermatologista',
      date: DateTime(DateTime.now().year, 5, 9, 10, 0),
      mode: 'Pessoalmente',
    ),
  ];

  List<Appointment> get filteredAppointments {
    if (filter == "Todos") return appointments;
    return appointments;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          children: [
            Text(
              'Compromissos',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                fontFamily: 'RobotoMono',
              ),
            ),
            SizedBox(height: 10),
            SearchBarWidget(
              hintText: 'Procurar compromissos',
              onChanged: (query) {},
            ),
            SizedBox(height: 12),
            Container(
              height: 40,
              decoration: BoxDecoration(
                color: Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  buildTab("Todos"),
                  buildTab("Próximos"),
                  buildTab("Passados"),
                ],
              ),
            ),
            SizedBox(height: 16),
            ...filteredAppointments.map(
              (a) => Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: AppointmentCard(appointment: a),
              ),
            ),
            SizedBox(height: 50),
            IconButton(
              icon: Icon(Icons.arrow_back, size: 28),
              onPressed: () => Navigator.pushNamed(context, '/home'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTab(String label) {
    bool selected = filter == label;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => filter = label),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: selected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            boxShadow:
                selected
                    ? [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 2,
                        offset: Offset(1, 1),
                      ),
                    ]
                    : [],
          ),
          child: Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: selected ? Colors.black : Colors.grey[700],
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
