// import 'package:flutter/material.dart';
//
// class Addpage extends StatelessWidget {
//   const Addpage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Color.fromARGB(255, 204, 0, 255),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For date formatting

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AddResidentPage(),
    );
  }
}

class AddResidentPage extends StatefulWidget {
  @override
  _AddResidentPageState createState() => _AddResidentPageState();
}

class _AddResidentPageState extends State<AddResidentPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _roomNumberController = TextEditingController();
  final TextEditingController _foodPreferenceController =
      TextEditingController();
  final TextEditingController _homeTownController = TextEditingController();
  final TextEditingController _caretakerController = TextEditingController();
  final TextEditingController _emergencyContactController =
      TextEditingController();
  final TextEditingController _activitiesController = TextEditingController();

  DateTime _admissionDate = DateTime.now();
  final DateFormat _dateFormatter = DateFormat('yyyy-MM-dd');

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _admissionDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _admissionDate) {
      setState(() {
        _admissionDate = picked;
      });
    }
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      // Process the data (e.g., send to server, save to database)
      final newResident = {
        'name': _nameController.text,
        'roomNumber': _roomNumberController.text,
        'foodPreference': _foodPreferenceController.text,
        'homeTown': _homeTownController.text,
        'caretaker': _caretakerController.text,
        'admissionDate': _dateFormatter.format(_admissionDate),
        'emergencyContact': _emergencyContactController.text,
        'activities': _activitiesController.text,
      };

      // Here you can handle the form data as needed
      print('New Resident: $newResident');

      // Show a success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Resident added successfully!')),
      );

      // Clear the form
      _formKey.currentState!.reset();
      setState(() {
        _admissionDate = DateTime.now();
        _nameController.clear();
        _roomNumberController.clear();
        _foodPreferenceController.clear();
        _homeTownController.clear();
        _caretakerController.clear();
        _emergencyContactController.clear();
        _activitiesController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 80),
            child: Text('Add New Resident'),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTextField(
                  controller: _nameController,
                  label: 'Name',
                ),
                _buildTextField(
                  controller: _roomNumberController,
                  label: 'Room Number',
                  keyboardType: TextInputType.number,
                ),
                _buildTextField(
                  controller: _foodPreferenceController,
                  label: 'Food Preference',
                ),
                _buildTextField(
                  controller: _homeTownController,
                  label: 'Home Town',
                ),
                _buildTextField(
                  controller: _caretakerController,
                  label: 'Caretaker',
                ),
                _buildTextField(
                  controller: _emergencyContactController,
                  label: 'Emergency Contact',
                  keyboardType: TextInputType.phone,
                ),
                _buildTextField(
                  controller: _activitiesController,
                  label: 'Activities',
                ),
                SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Admission Date: ${_dateFormatter.format(_admissionDate)}',
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      height: 40,
                      width: 100,
                      child: ElevatedButton(
                        onPressed: () => _selectDate(context),
                        child: Text('Select Date'),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16.0),
                Center(
                  child: ElevatedButton(
                    onPressed: _submit,
                    child: Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
          contentPadding:
              EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
        ),
        keyboardType: keyboardType,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $label';
          }
          return null;
        },
      ),
    );
  }
}
