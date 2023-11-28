import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

class ClientMenu extends StatefulWidget {
  @override
  _ClientMenuState createState() => _ClientMenuState();
}

class _ClientMenuState extends State<ClientMenu> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    CalendarScreen(),
    PageIntervention(),
    PersonalInformationScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon:  Container(
                      width: 24,
                      height: 24,
                      child: Image.asset(
                        './images/home.png',
                        fit: BoxFit.contain,
                      ),
                    ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon:Container(
                      width: 24,
                      height: 24,
                      child: Image.asset(
                        './images/add.png',
                        fit: BoxFit.contain,
                      ),
                    ),
            label: 'Add Intervontion',
          ),
          BottomNavigationBarItem(
            icon: Container(
                      width: 24,
                      height: 24,
                      child: Image.asset(
                        './images/user.png',
                        fit: BoxFit.contain,
                      ),
                    ),
            label: 'PersonalInformation',
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

class PlaceholderWidget extends StatelessWidget {
  final Color color;

  const PlaceholderWidget(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
    );
  }
}

class PageIntervention extends StatefulWidget {
  @override
  _PageInterventionState createState() => _PageInterventionState();
}

class _PageInterventionState extends State<PageIntervention> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  Future<void> _selectDateTime() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        setState(() {
          selectedDate = DateTime(
            pickedDate.year,
            pickedDate.month,
            pickedDate.day,
            pickedTime.hour,
            pickedTime.minute,
          );
          selectedTime = pickedTime;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFB8E6D7),
              Color(0xFF397367),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 16),
                child: Text(
                  'Title info d\'intervention',
                  style:  GoogleFonts.playfairDisplay(
                     fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent[300],
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Type de déchet',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              SizedBox(height: 8),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Enter the type of waste',
                    hintStyle: TextStyle(color: Colors.white70),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Quantity',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              SizedBox(height: 8),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Enter the quantity',
                    hintStyle: TextStyle(color: Colors.white70),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Date and Hour',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              SizedBox(height: 8),
              InkWell(
                onTap: _selectDateTime,
                child: Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                  ),
                  child: selectedDate != null && selectedTime != null
                      ? Text(
                          '${selectedDate!.toString().substring(0, 10)} ${selectedTime!.format(context)}',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        )
                      : Text(
                          'Select Date and Hour',
                          style: TextStyle(fontSize: 16, color: Colors.white70),
                        ),
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Handle confirmation button press
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.teal,
                    ),
                    child: Text(
                      'Confirmer',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {
                      // Handle cancel button press
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.teal,
                    ),
                    child: Text(
                      'Annuler',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();
  Map<DateTime, List<String>> _tasks = {
    DateTime(2023, 5, 31): ['Task 1', 'Task 2'],
    DateTime(2023, 6, 1): ['Task 3'],
    DateTime(2023, 6, 3): ['Task 4', 'Task 5'],
  };

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _selectedDay = selectedDay;
      _focusedDay = focusedDay;
    });
  }

  List<String> _getTasksForDay(DateTime day) {
    return _tasks[day] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
       padding: EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 16.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFB8E6D7),
              Color(0xFF397367),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            TableCalendar(
              firstDay: DateTime.now().subtract(Duration(days: 365)),
              lastDay: DateTime.now().add(Duration(days: 365)),
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              calendarFormat: _calendarFormat,
              onDaySelected: _onDaySelected,
              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },
              availableCalendarFormats: {
                CalendarFormat.month: 'Month',
                CalendarFormat.week: 'Week',
              },
            ),
            SizedBox(height: 16),
            Text(
              'Tasks for ${_selectedDay.toString().substring(0, 10)}:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: _getTasksForDay(_selectedDay).length,
                itemBuilder: (context, index) {
                  final task = _getTasksForDay(_selectedDay)[index];
                  return ListTile(
                    title: Text(task),
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

class PersonalInformationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(16.0),
        children: [
          ProfileWidget(),
          SizedBox(height: 24.0),
          buildNameTile('Client Name', 'John Doe'),
          buildNameTile('Company Name', 'ABC Corporation'),
          buildNameTile('ID', '1234567890'),
          buildNameTile('Type of Waste', 'General Waste'),
          SizedBox(height: 24.0),
          buildDescription(
            'Certified Personal Trainer and Nutritionist with years of experience in creating effective diets and training plans focused on achieving individual customers goals in a smooth way.',
          ),
        ],
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        'Client Information',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  Widget buildNameTile(String title, String subtitle) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(fontSize: 16.0),
      ),
    );
  }

  Widget buildDescription(String description) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description',
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.0),
        Text(
          description,
          style: TextStyle(fontSize: 16.0),
        ),
      ],
    );
  }
}

class ProfileWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          CircleAvatar(
            radius: 64.0,
            backgroundImage: AssetImage('./images/user.png'),
          ),
          buildEditIcon(),
        ],
      ),
    );
  }

  Widget buildEditIcon() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      padding: EdgeInsets.all(8.0),
      child: Icon(
        Icons.edit,
        color: Colors.black,
        size: 20.0,
      ),
    );
  }
}
