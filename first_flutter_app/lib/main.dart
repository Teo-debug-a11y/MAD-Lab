import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const StudentInfoApp());
}

class StudentInfoApp extends StatelessWidget {
  const StudentInfoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CSS3344 Lab 02',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.indigo,
      ),
      home: const StudentProfileScreen(),
    );
  }
}

class StudentProfileScreen extends StatefulWidget {
  const StudentProfileScreen({super.key});

  @override
  State<StudentProfileScreen> createState() => _StudentProfileScreenState();
}

class _StudentProfileScreenState extends State<StudentProfileScreen> {
  // State variables for the pickers
  DateTime _selectedDate = DateTime.now();
  String _selectedRole = 'Slytherin';

  // 1. Material Date Picker
  Future<void> _selectMaterialDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  // 2. Cupertino Date Picker
  void _showCupertinoDatePicker(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (_) => Container(
        height: 240,
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: CupertinoDatePicker(
          mode: CupertinoDatePickerMode.date,
          initialDateTime: _selectedDate,
          onDateTimeChanged: (DateTime newDate) {
            setState(() => _selectedDate = newDate);
          },
        ),
      ),
    );
  }

  // 4. Cupertino Wheel Picker
  void _showCupertinoRolePicker(BuildContext context) {
    final List<String> roles = ['Gryffindor', 'Slytherin', 'Ravenclaw', 'Hufflepuff'];
    showCupertinoModalPopup(
      context: context,
      builder: (_) => Container(
        height: 200,
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: CupertinoPicker(
          itemExtent: 32,
          onSelectedItemChanged: (int index) {
            setState(() => _selectedRole = roles[index]);
          },
          children: roles.map((role) => Center(child: Text(role))).toList(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Interactive Pickers (Lab 2.2)'),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return orientation == Orientation.portrait
              ? _buildPortraitView()
              : _buildLandscapeView();
        },
      ),
    );
  }

  // Portrait Mode Layout
  Widget _buildPortraitView() {
    return ListView(
      padding: const EdgeInsets.all(20.0),
      children: [
        _buildProfileCard(),
        const SizedBox(height: 16),
        const TitleSection(
          name: 'Hogwarts School of Witchcraft and Wizardry',
          location: 'Hogsmeade, Scotland',
          starCount: 41,
        ),
        const SizedBox(height: 16),
        _buildPickersCard(),
      ],
    );
  }

  // Landscape Mode Layout
  Widget _buildLandscapeView() {
    return Row(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  _buildProfileCard(),
                  const SizedBox(height: 12),
                  const TitleSection(
                    name: 'Hogwarts School of Witchcraft and Wizardry',
                    location: 'Hogsmeade, Scotland',
                    starCount: 41,
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: _buildPickersCard(),
            ),
          ),
        ),
      ],
    );
  }

  // The Pickers UI Card containing all 4 pickers
  Widget _buildPickersCard() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Interactive Pickers (Lab 2.2)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text('Selected Date: ${_selectedDate.toLocal().toString().split(' ')[0]}'),
            Text('Selected House: $_selectedRole'),
            const Divider(height: 24),

            // 1. Material Date Picker Button
            ElevatedButton(
              onPressed: () => _selectMaterialDate(context),
              child: const Text('Material Date Picker'),
            ),
            const SizedBox(height: 10),

            // 2. Cupertino Date Picker Button
            ElevatedButton(
              onPressed: () => _showCupertinoDatePicker(context),
              child: const Text('Cupertino Date Picker (Modal Sheet)'),
            ),
            const SizedBox(height: 10),

            // 3. Material DropdownButton
            DropdownButton<String>(
              value: _selectedRole,
              isExpanded: true,
              items: ['Gryffindor', 'Slytherin', 'Ravenclaw', 'Hufflepuff'].map((role) {
                return DropdownMenuItem<String>(
                  value: role,
                  child: Text(role),
                );
              }).toList(),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  setState(() => _selectedRole = newValue);
                }
              },
            ),
            const SizedBox(height: 10),

            // 4. Cupertino Wheel Picker Button[cite: 15]
            ElevatedButton(
              onPressed: () => _showCupertinoRolePicker(context),
              child: const Text('Cupertino House Wheel Picker'),
            ),
          ],
        ),
      ),
    );
  }

  // Student Profile Card
  Widget _buildProfileCard() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundColor: Colors.indigo,
              child: Icon(Icons.person, size: 50, color: Colors.white),
            ),
            const SizedBox(height: 20),
            const Text('TEO KAH HAO', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            const Text('Student ID: BCS24090031', style: TextStyle(fontSize: 16, color: Colors.grey)),
            const Divider(height: 32, thickness: 1),
            const Text(
              'Personal Life Goal / Quote: Make Lots of Money/get accepted into Griffindor',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            const Text(
              '"IDK start a coffeeshop"',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, fontStyle: FontStyle.italic, color: Colors.indigo),
            ),
          ],
        ),
      ),
    );
  }
}

class TitleSection extends StatelessWidget {
  final String name;
  final String location;
  final int starCount;

  const TitleSection({
    super.key,
    required this.name,
    required this.location,
    required this.starCount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 4),
                Text(location, style: TextStyle(color: Colors.grey[600])),
              ],
            ),
          ),
          Icon(Icons.star, color: Colors.indigo[400]),
          const SizedBox(width: 4),
          Text('$starCount'),
        ],
      ),
    );
  }
}