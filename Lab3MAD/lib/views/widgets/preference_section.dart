import 'package:flutter/material.dart';

class PreferenceSection extends StatefulWidget {
  const PreferenceSection({super.key});

  @override
  State<PreferenceSection> createState() => _PreferenceSectionState();
}

class _PreferenceSectionState extends State<PreferenceSection> {
  // State for Date Picker
  DateTime _selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2026),
      lastDate: DateTime(2030),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  // State for Package Dropdown
  String _selectedPackage = 'Private River Cruise';
  final List<String> _packages = [
    'Private River Cruise',
    'Sunset Cruise',
    'Sunrise Cruise',
    'Rural Cruise',
    'SMI Park Cruise',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Booking Preferences',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          // Date Picker Tile
          ListTile(
            tileColor: Colors.grey[200],
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: const Text('Visit Date'),
            subtitle: Text("${_selectedDate.toLocal()}".split(' ')[0]),
            trailing: const Icon(Icons.calendar_today),
            onTap: () => _selectDate(context),
          ),
          const SizedBox(height: 15),
          // Package Dropdown
          DropdownButtonFormField<String>(
            value: _selectedPackage,
            decoration: InputDecoration(
              labelText: 'Cruise Package',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            ),
            items: _packages.map((String package) {
              return DropdownMenuItem<String>(
                value: package,
                child: Text(package),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                _selectedPackage = newValue!;
              });
            },
          ),
        ],
      ),
    );
  }
}