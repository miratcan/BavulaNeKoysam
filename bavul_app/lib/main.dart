import 'package:flutter/material.dart';
import 'checklist_data.dart';

void main() {
  runApp(const BavulApp());
}

class BavulApp extends StatelessWidget {
  const BavulApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bavul App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'sans-serif',
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: const Color(0xFF0081BC)),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();

  String? _selectedGender = GENDERS.keys.first;
  int? _selectedTravelDays = TRAVEL_DAYS.keys.first;
  String? _selectedDestinationType = DESTINATION_TYPES.keys.first;
  String? _selectedEventType = EVENT_TYPES.keys.first;
  String? _selectedWeatherType = WEATHER_TYPES.keys.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0081BC),
      appBar: AppBar(
        title: const Text('Bavul Ne Koysam?'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage('assets/img/paperbody.png'),
                fit: BoxFit.fill,
              ),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 450,
                  right: 10,
                  child: Image.asset('assets/img/stamp.png', width: 100),
                ),
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(40, 15, 70, 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        _buildDropdown(
                          label: 'Cinsiyet',
                          value: _selectedGender,
                          items: GENDERS,
                          onChanged: (value) =>
                              setState(() => _selectedGender = value),
                        ),
                        const Divider(color: Color(0xFF0081BC), thickness: 1, height: 20, endIndent: 20),
                        _buildDropdown(
                          label: 'Etkinlik',
                          value: _selectedEventType,
                          items: EVENT_TYPES,
                          onChanged: (value) =>
                              setState(() => _selectedEventType = value),
                        ),
                        const Divider(color: Color(0xFF0081BC), thickness: 1, height: 20, endIndent: 20),
                        Container(
                          height: 180,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/img/plane-stripe.png'),
                              fit: BoxFit.contain,
                              alignment: Alignment.centerLeft,
                            ),
                          ),
                          child: Center(
                            child: _buildDropdownInt(
                              label: 'Süre',
                              value: _selectedTravelDays,
                              items: TRAVEL_DAYS,
                              onChanged: (value) => setState(
                                  () => _selectedTravelDays = value),
                            ),
                          ),
                        ),
                        const Divider(color: Color(0xFF0081BC), thickness: 1, height: 20, endIndent: 20),
                        _buildDropdown(
                          label: 'Hava',
                          value: _selectedWeatherType,
                          items: WEATHER_TYPES,
                          onChanged: (value) =>
                              setState(() => _selectedWeatherType = value),
                        ),
                        const Divider(color: Color(0xFF0081BC), thickness: 1, height: 20, endIndent: 20),
                        _buildDropdown(
                          label: 'Hedef',
                          value: _selectedDestinationType,
                          items: DESTINATION_TYPES,
                          onChanged: (value) => setState(
                              () => _selectedDestinationType = value),
                        ),
                        const SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset('assets/img/barcode.png', width: 150),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                              ),
                              child: const Text('LISTELE', style: TextStyle(letterSpacing: 2)),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  final checklist = getNeeds(
                                    _selectedGender!,
                                    _selectedDestinationType!,
                                    _selectedEventType!,
                                    _selectedWeatherType!,
                                    _selectedTravelDays!,
                                  );
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ChecklistScreen(checklist: checklist),
                                    ),
                                  );
                                }
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown<T>({
    required String label,
    required T value,
    required Map<T, String> items,
    required ValueChanged<T?> onChanged,
  }) {
    return DropdownButtonFormField<T>(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.black54),
        border: InputBorder.none,
      ),
      value: value,
      items: items.entries.map((entry) {
        return DropdownMenuItem<T>(
          value: entry.key,
          child: Text(entry.value, style: const TextStyle(color: Colors.black87)),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }

  Widget _buildDropdownInt({
    required String label,
    required int? value,
    required Map<int, String> items,
    required ValueChanged<int?> onChanged,
  }) {
    return DropdownButtonFormField<int>(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.black54),
        border: InputBorder.none,
      ),
      value: value,
      items: items.entries.map((entry) {
        return DropdownMenuItem<int>(
          value: entry.key,
          child: Text(entry.value, style: const TextStyle(color: Colors.black87)),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }
}

class ChecklistScreen extends StatelessWidget {
  final Map<String, List<Map<String, dynamic>>> checklist;

  const ChecklistScreen({Key? key, required this.checklist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categories = checklist.keys.toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bavul Listeniz'),
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          final items = checklist[category]!;
          return ExpansionTile(
            title: Text(category,
                style: Theme.of(context).textTheme.headline6),
            initiallyExpanded: true,
            children: items.map((item) {
              final itemName = item['item'] ?? 'Bilinmeyen Eşya';
              final amount = item['total_amount']?.toString();
              final description = item['description'] as String?;
              final notes = (item['notes'] as List<dynamic>?)?.join(', ');

              String subtitle = '';
              if (amount != null) {
                subtitle += '$amount adet';
              }
              if (description != null) {
                subtitle += (subtitle.isNotEmpty ? ' - ' : '') + description;
              }
              if (notes != null) {
                subtitle += (subtitle.isNotEmpty ? '\n' : '') + 'Not: ' + notes;
              }

              return ListTile(
                title: Text(itemName),
                subtitle: subtitle.isNotEmpty ? Text(subtitle) : null,
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
