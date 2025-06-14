import 'package:flutter/material.dart';
import '../widgets/appointment_card.dart';
import '../models/appointment.dart';

class HomeScreen extends StatelessWidget {
  final List<Appointment> upcoming = [
    Appointment(
      doctor: 'Dr. Smith',
      specialty: 'Exame de saúde',
      date: DateTime(DateTime.now().year, 4, 29, 9, 0),
      mode: 'Pessoalmente',
      note: 'Jejum necessário',
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
  ];

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Olá, usuário!',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              Icon(Icons.account_circle_rounded, size: 45),
            ],
          ),
          SizedBox(height: 18),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Color(0xFFB3E0FF),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sem compromissos hoje',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Agende sua próxima visita',
                        style: TextStyle(fontSize: 13),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed:
                      () => Navigator.pushNamed(context, '/new_appointment'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF40BFFF),
                    shape: StadiumBorder(),
                  ),
                  child: Text('+ Novo', style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
          SizedBox(height: 22),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Próximos compromissos',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              TextButton(
                onPressed: () => Navigator.pushNamed(context, '/appointments'),
                child: Text(
                  'Ver tudo →',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                ),
              ),
            ],
          ),
          ...upcoming.map(
            (a) => Padding(
              padding: const EdgeInsets.only(bottom: 14.0),
              child: AppointmentCard(appointment: a),
            ),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/questionnaire');
                  },
                  child: Container(
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 3,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.fact_check_outlined, size: 28),
                        SizedBox(height: 2),
                        Text(
                          'Exame diário',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/medications');
                  },
                  child: Container(
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 3,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.medication_outlined, size: 28),
                        SizedBox(height: 2),
                        Text(
                          'Medicações',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
