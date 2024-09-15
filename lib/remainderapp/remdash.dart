// reminder.dart
import 'package:flutter/material.dart';

class Reminder {
  final String title;
  final String description;
  final DateTime dateTime;
  final String severity;

  Reminder({
    required this.title,
    required this.description,
    required this.dateTime,
    required this.severity,
  });
}

class ReminderList extends StatefulWidget {
  const ReminderList({Key? key}) : super(key: key);

  @override
  _ReminderListState createState() => _ReminderListState();
}

class _ReminderListState extends State<ReminderList> {
  final List<Reminder> _reminders = [
    Reminder(
        title: 'Give Alzheimer Medication',
        description: 'For Mr. Ramesh',
        dateTime: DateTime.now().add(const Duration(hours: 2)),
        severity: 'High'),
    Reminder(
        title: 'Physiotherapy Appointment',
        description: 'For Mr. Devendra',
        dateTime: DateTime.now().add(const Duration(days: 1)),
        severity: 'Medium'),
    Reminder(
        title: 'Asthma Medication',
        description: 'For Ms. Kanti',
        dateTime: DateTime.now().add(const Duration(hours: 6)),
        severity: 'Low'),
    Reminder(
        title: 'Bypass Upcoming',
        description: 'For Ms. Shanta',
        dateTime: DateTime.now().add(const Duration(days: 2)),
        severity: 'High'),
    Reminder(
        title: 'General Checkup',
        description: 'For Mr. Anand',
        dateTime: DateTime.now().add(const Duration(hours: 1)),
        severity: 'Low'),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _reminders.length > 5 ? 5 : _reminders.length,
      itemBuilder: (context, index) {
        final reminder = _reminders[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: _getSeverityColor(reminder.severity),
          ),
          title: Text(reminder.title),
          subtitle: Text('${reminder.description} - ${reminder.dateTime}'),
          trailing: IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: () {
              setState(() {
                _reminders.removeAt(index);
              });
            },
          ),
        );
      },
    );
  }

  Color _getSeverityColor(String severity) {
    switch (severity) {
      case 'High':
        return Colors.red;
      case 'Medium':
        return Colors.orange;
      case 'Low':
      default:
        return Colors.green;
    }
  }
}
