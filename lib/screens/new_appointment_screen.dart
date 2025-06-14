import 'package:flutter/material.dart';

class NewAppointmentScreen extends StatefulWidget {
  const NewAppointmentScreen({super.key});

  @override
  State<NewAppointmentScreen> createState() => _NewAppointmentScreenState();
}

class _NewAppointmentScreenState extends State<NewAppointmentScreen> {
  String? selectedDoctor;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  String selectedType = 'Online';
  final notesController = TextEditingController();

  final doctors = ['Dr. Smith', 'Dr. White', 'Dr. Stones', 'Dr. Jones'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          children: [
            Text(
              'Novo compromisso',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                fontFamily: 'RobotoMono',
              ),
            ),
            SizedBox(height: 18),
            Text('Escolha um médico'),
            SizedBox(height: 6),
            DropdownButtonFormField<String>(
              value: selectedDoctor,
              hint: Text('Selecione um médico'),
              items:
                  doctors
                      .map((m) => DropdownMenuItem(value: m, child: Text(m)))
                      .toList(),
              onChanged: (v) => setState(() => selectedDoctor = v),
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFFF5F5F5),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 18),
            Text('Data'),
            SizedBox(height: 6),
            GestureDetector(
              onTap: () async {
                final date = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now(),
                  lastDate: DateTime.now().add(Duration(days: 365)),
                );
                if (date != null) setState(() => selectedDate = date);
              },
              child: InputDecorator(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xFFF5F5F5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      selectedDate == null
                          ? 'Escolha uma data'
                          : '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',
                    ),
                    Icon(Icons.calendar_today),
                  ],
                ),
              ),
            ),
            SizedBox(height: 18),
            Text('Hora'),
            SizedBox(height: 6),
            DropdownButtonFormField<TimeOfDay>(
              value: selectedTime,
              hint: Text('Escolha uma hora'),
              items:
                  List.generate(24, (h) => TimeOfDay(hour: h, minute: 0))
                      .map(
                        (t) => DropdownMenuItem(
                          value: t,
                          child: Text(
                            '${t.hour.toString().padLeft(2, '0')}:00',
                          ),
                        ),
                      )
                      .toList(),
              onChanged: (v) => setState(() => selectedTime = v),
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFFF5F5F5),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 18),
            Text('Tipo de consulta'),
            SizedBox(height: 6),
            DropdownButtonFormField<String>(
              value: selectedType,
              items:
                  ['Online', 'Pessoalmente']
                      .map((t) => DropdownMenuItem(value: t, child: Text(t)))
                      .toList(),
              onChanged: (v) => setState(() => selectedType = v ?? 'Online'),
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFFF5F5F5),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 18),
            Text(
              'Anotações (Opcional)',
              style: TextStyle(fontFamily: 'RobotoMono'),
            ),
            SizedBox(height: 6),
            TextField(
              controller: notesController,
              minLines: 3,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Escreva alguma coisa para seu médico',
                filled: true,
                fillColor: Color(0xFFF5F5F5),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 22),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF40BFFF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                },
                child: Text(
                  'Salvar',
                  style: TextStyle(fontWeight: FontWeight.bold),
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
