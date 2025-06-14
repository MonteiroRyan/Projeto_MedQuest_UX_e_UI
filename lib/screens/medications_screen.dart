import 'package:flutter/material.dart';
import '../models/medication.dart';

class MedicationsScreen extends StatelessWidget {
  final List<Medication> medications = [
    Medication(
      name: "Lisinopril",
      dosage: "10 mg",
      frequency: MedicationFrequency.diariamente,
      times: [MedicationTime.manha],
    ),
    Medication(
      name: "Metformina",
      dosage: "500 mg",
      frequency: MedicationFrequency.duasVezesPorDia,
      times: [MedicationTime.manha, MedicationTime.aoAnoitecer],
    ),
    Medication(
      name: "Atorvastatina",
      dosage: "20 mg",
      frequency: MedicationFrequency.diariamente,
      times: [MedicationTime.manha],
    ),
  ];

  MedicationsScreen({super.key});

  String getFrequencyText(MedicationFrequency freq) {
    switch (freq) {
      case MedicationFrequency.diariamente:
        return "Diariamente";
      case MedicationFrequency.duasVezesPorDia:
        return "Duas vezes p/dia";
      case MedicationFrequency.semanalmente:
        return "Semanalmente";
    }
  }

  String getTimeText(MedicationTime time) {
    switch (time) {
      case MedicationTime.manha:
        return "De manhã";
      case MedicationTime.tarde:
        return "À tarde";
      case MedicationTime.noite:
        return "À noite";
      case MedicationTime.aoAnoitecer:
        return "Ao anoitecer";
    }
  }

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    String weekDay =
        [
          "Domingo",
          "Segunda-Feira",
          "Terça-Feira",
          "Quarta-Feira",
          "Quinta-Feira",
          "Sexta-Feira",
          "Sábado",
        ][today.weekday % 7];

    String dateStr = "${today.day} de ${_getMonthName(today.month)}";

    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 14),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Medicações",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    fontFamily: 'RobotoMono',
                  ),
                ),
                Text(
                  "$weekDay, $dateStr",
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontFamily: 'RobotoMono',
                  ),
                ),
              ],
            ),
            SizedBox(height: 18),
            Container(
              padding: EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Color(0xFFB3E0FF),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Icon(Icons.access_time, color: Colors.black, size: 28),
                  SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Medicações devidas",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          "3 pendentes para hoje",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.grey[800],
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF40BFFF),
                      shape: StadiumBorder(),
                    ),
                    child: Text(
                      "Tomar tudo",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            ...medications.map(
              (m) => Padding(
                padding: const EdgeInsets.only(bottom: 14.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              m.name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                fontFamily: 'RobotoMono',
                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Color(0xFFB3E0FF),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              getFrequencyText(m.frequency),
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 3),
                      Text(m.dosage, style: TextStyle(fontSize: 13)),
                      SizedBox(height: 8),
                      ...m.times.map(
                        (t) => Row(
                          children: [
                            Icon(
                              Icons.north_east,
                              size: 16,
                              color: Colors.grey[700],
                            ),
                            SizedBox(width: 6),
                            Text(
                              getTimeText(t),
                              style: TextStyle(fontSize: 13),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.centerRight,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF40BFFF),
                            shape: StadiumBorder(),
                            padding: EdgeInsets.symmetric(
                              horizontal: 22,
                              vertical: 8,
                            ),
                          ),
                          child: Text(
                            "Tomar",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            OutlinedButton.icon(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                side: BorderSide(width: 1.3, color: Colors.black),
                minimumSize: Size(double.infinity, 48),
              ),
              icon: Icon(Icons.add, color: Colors.black),
              label: Text(
                "Adicionar medicação",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(height: 70),
            IconButton(
              icon: Icon(Icons.arrow_back, size: 28),
              onPressed: () => Navigator.pushNamed(context, '/home'),
            ),
          ],
        ),
      ),
    );
  }

  String _getMonthName(int month) {
    final months = [
      '',
      'Janeiro',
      'Fevereiro',
      'Março',
      'Abril',
      'Maio',
      'Junho',
      'Julho',
      'Agosto',
      'Setembro',
      'Outubro',
      'Novembro',
      'Dezembro',
    ];
    return months[month];
  }
}
