import 'package:flutter/material.dart';

// ghkckflhjk'

import 'package:intl/intl.dart';

class ReminderApp extends StatefulWidget {
  const ReminderApp({super.key});

  @override
  State<ReminderApp> createState() => _ReminderAppState();
}

class _ReminderAppState extends State<ReminderApp> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, dynamic>> _reminders = [];
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  String _selectedSeverity = 'Low';

  void _addReminder(String title) {
    if (title.isNotEmpty && _selectedDate != null && _selectedTime != null) {
      final reminder = {
        'title': title,
        'date': _selectedDate,
        'time': _selectedTime,
        'severity': _selectedSeverity
      };
      setState(() {
        _reminders.add(reminder);
      });
      _controller.clear();
      _selectedDate = null;
      _selectedTime = null;
      _selectedSeverity = 'Low';
    }
  }

  void _deleteReminder(int index) {
    setState(() {
      _reminders.removeAt(index);
    });
  }

  void _toggleReminderCompletion(int index) {
    setState(() {
      _reminders[index]['completed'] =
          !(_reminders[index]['completed'] ?? false);
    });
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  String _formatDateTime(DateTime? date, TimeOfDay? time) {
    if (date == null || time == null) return '';
    final DateFormat dateFormat = DateFormat('yyyy-MM-dd');
    final String formattedDate = dateFormat.format(date);
    final String formattedTime = time.format(context);
    return '$formattedDate $formattedTime';
  }

  Color _getSeverityColor(String severity) {
    switch (severity) {
      case 'High':
        return const Color.fromARGB(255, 255, 17, 0);
      case 'Medium':
        return Colors.orange;
      case 'Low':
      default:
        return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reminders',
            style: TextStyle(
                color: Color(0xFF1A2B49), fontWeight: FontWeight.bold)),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Add a new Reminder',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const SizedBox(height: 10),
            TextFormField(
              controller: _controller,
              decoration: const InputDecoration(labelText: 'Reminder Title'),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => _selectDate(context),
                    child: Text(
                        _selectedDate == null
                            ? 'Select Date'
                            : DateFormat('yyyy-MM-dd').format(_selectedDate!),
                        style: TextStyle(
                            color: Color(0xFF1A2B49),
                            fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => _selectTime(context),
                    child: Text(
                        _selectedTime == null
                            ? 'Select Time'
                            : _selectedTime!.format(context),
                        style: TextStyle(
                            color: Color(0xFF1A2B49),
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            DropdownButton<String>(
              value: _selectedSeverity,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedSeverity = newValue!;
                });
              },
              items: <String>['Low', 'Medium', 'High']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _addReminder(_controller.text);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    const Color(0xFF567DF4), // Set the button color here
              ),
              child: const Text(
                'Add Reminder',
                style: TextStyle(color: Color(0xFF1A2B49)),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Reminders:",
              style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 63, 63, 63)),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _reminders.length,
                itemBuilder: (context, index) {
                  final reminder = _reminders[index];
                  return ListTile(
                    title: Text(reminder['title'],
                        style: TextStyle(
                            color: Color(0xFF1A2B49),
                            fontWeight: FontWeight.bold)),
                    subtitle: Text(
                        _formatDateTime(reminder['date'], reminder['time']),
                        style: TextStyle(
                            color: Color(0xFF1A2B49),
                            fontWeight: FontWeight.bold)),
                    trailing: IconButton(
                      icon: Icon(Icons.check,
                          color: reminder['completed'] == true
                              ? Colors.green
                              : Colors.grey),
                      onPressed: () {
                        _toggleReminderCompletion(index);
                      },
                    ),
                    leading: CircleAvatar(
                      backgroundColor: _getSeverityColor(reminder['severity']),
                    ),
                    onLongPress: () {
                      _deleteReminder(index);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
