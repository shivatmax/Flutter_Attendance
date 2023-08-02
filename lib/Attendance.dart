import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'utils.dart';
import 'Controller.dart';
import 'User.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  _AttendanceScreenState createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  List<User> students = [
    User(name: 'Shiv', rollNumber: '1', isPresent: false),
    User(name: 'Rupam', rollNumber: '2', isPresent: false),
    User(name: 'Vineet', rollNumber: '3', isPresent: false),
    User(name: 'Somya', rollNumber: '4', isPresent: false),
    User(name: 'Anjali', rollNumber: '5', isPresent: false),
    User(name: 'Dhruv', rollNumber: '6', isPresent: false),
    User(name: 'Pratham', rollNumber: '7', isPresent: false),
    User(name: 'Vedic', rollNumber: '9', isPresent: false),
    User(name: 'Mamatha', rollNumber: '10', isPresent: false),
    User(name: 'Sri Rama Krishna', rollNumber: '11', isPresent: false),
    User(name: 'OM HARI', rollNumber: '12', isPresent: false),
    User(name: 'Madhav', rollNumber: '13', isPresent: false),
    User(name: 'Manu Krishnan', rollNumber: '14', isPresent: false),
    User(name: 'Muhammed Aslah', rollNumber: '15', isPresent: false),
    User(name: 'Aviral ', rollNumber: '16', isPresent: false),
    User(name: 'Joysa', rollNumber: '17', isPresent: false),
    User(name: 'Tarun ', rollNumber: '18', isPresent: false),
    User(name: 'Mohammad Muzahid ', rollNumber: '19', isPresent: false),
    User(name: 'Akash ', rollNumber: '20', isPresent: false),
    User(name: 'Prince', rollNumber: '21', isPresent: false),
    User(name: 'Prem singh ', rollNumber: '22', isPresent: false),
    User(name: 'Raju', rollNumber: '23', isPresent: false),
    User(name: 'Manasa', rollNumber: '24', isPresent: false),
    User(name: 'Vishnulal', rollNumber: '25', isPresent: false),
    User(name: 'Arunima', rollNumber: '26', isPresent: false),
    User(name: 'Shirisha', rollNumber: '27', isPresent: false),
    User(name: 'Tushar ', rollNumber: '28', isPresent: false),
    User(name: 'Arpita', rollNumber: '29', isPresent: false),
    User(name: 'Indu', rollNumber: '30', isPresent: false),
    User(name: 'Akshit', rollNumber: '31', isPresent: false),
    User(name: 'Akhila', rollNumber: '32', isPresent: false),
    User(name: 'Satyam Kumar', rollNumber: '33', isPresent: false),
    User(name: 'Aniket', rollNumber: '34', isPresent: false),
    User(name: 'Arpit', rollNumber: '35', isPresent: false),
    User(name: 'Deepanshu ', rollNumber: '36', isPresent: false),
    User(name: 'Devanshu', rollNumber: '37', isPresent: false),
    User(name: 'Digvijay', rollNumber: '38', isPresent: false),
    User(name: 'Kushagra ', rollNumber: '39', isPresent: false),
    User(name: 'Nishita', rollNumber: '40', isPresent: false),
    User(name: 'Jaynil', rollNumber: '41', isPresent: false),
    User(name: 'Sarang', rollNumber: '42', isPresent: false),
    User(name: 'Kartik', rollNumber: '43', isPresent: false),
    User(name: 'Piyush ', rollNumber: '44', isPresent: false),
    User(name: 'Sahil', rollNumber: '45', isPresent: false),
    User(name: 'Rishi', rollNumber: '46', isPresent: false),
    User(name: 'Pushpender', rollNumber: '47', isPresent: false),
  ];

  String selectedCourse = 'BTech III';
  String selectedSubject = 'Theory of Computation';
  String selectedTime1 = '10:00AM';
  String selectedTime2 = '11:00AM';
  String date = DateFormat('dd-MM-yyyy').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    double baseWidth = 360;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Attendance Dashboard', // Update the title here
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w500,
            color: Color(0xffdcfff4),
          ),
        ),
        titleSpacing: 00.0,
        centerTitle: true,
        toolbarHeight: 60.2,
        toolbarOpacity: 0.8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(25),
            bottomLeft: Radius.circular(25),
          ),
        ),
        elevation: 0.00,
        backgroundColor: const Color(0xff5994a1),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(

                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: DropdownButton<String>(
                          value: selectedCourse,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedCourse = newValue!;
                            });
                          },
                          items: <String>['BTech III', 'BTech II ', 'BTech I']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: const TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff5994a1),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      Positioned(
                        top: -4,
                        left: 8,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          color: Colors.white,
                          child: const Text(
                            'Course:',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff5994a1),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 15),
                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: DropdownButton<String>(
                          value: selectedSubject,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedSubject = newValue!;
                            });
                          },
                          items: <String>[
                            ' Computer Networks',
                            ' Web Development',
                            '   Python',
                            'Theory of Computation',
                            ' Mobile Computing',
                            '   Big Data',
                            ' Cloud Computing'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: const TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xff5994a1),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                      Positioned(
                        top: -4,
                        left: 8,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          color: Colors.white,
                          child: const Text(
                            'Subject:',
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Color(0xff5994a1),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),


          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16 * fem),
                gradient: const LinearGradient(
                  begin: Alignment(0, -1),
                  end: Alignment(0, 1),
                  colors: <Color>[Color(0x595994a1), Color(0x595994a1)],
                  stops: <double>[0.081, 0.975],
                ),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0x1c000000),
                    offset: Offset(2 * fem, 5 * fem),
                    blurRadius: 3 * fem,
                  ),
                ],
              ),
              child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (context, index) {
                  User user = students[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              14 * fem, 0 * fem, 12 * fem, 0 * fem),
                          padding: EdgeInsets.fromLTRB(
                              10 * fem, 7 * fem, 10 * fem, 8 * fem),
                          width: 158 * fem,
                          height: 27 * fem,
                          decoration: BoxDecoration(
                            color: const Color(0xffffffff),
                            borderRadius: BorderRadius.circular(4 * fem),
                          ),
                          child: Text(
                            user.name,
                            style: SafeGoogleFont(
                              'Montserrat',
                              fontSize: 16 * ffem,
                              fontWeight: FontWeight.w500,
                              height: 0.75 * ffem / fem,
                              color: const Color(0xff5994a1),
                            ),
                          ),
                        ),
                        Container(
                          width: 45 * fem,
                          height: 27 * fem,
                          decoration: BoxDecoration(
                            color: const Color(0xffffffff),
                            borderRadius: BorderRadius.circular(4 * fem),
                          ),
                          child: Center(
                            child: Text(
                              user.rollNumber,
                              style: SafeGoogleFont(
                                'Montserrat',
                                fontSize: 16 * ffem,
                                fontWeight: FontWeight.w500,
                                height: 0.75 * ffem / fem,
                                color: const Color(0xff5994a1),
                              ),
                            ),
                          ),
                        ),

                        // Present button
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              user.isPresent = true;
                            });
                          },
                          child: Padding(
                            padding:
                            const EdgeInsets.all(0), // Adjust the padding here
                            child: Container(
                              width: 60 * fem,
                              height: 60 * fem,
                              margin: EdgeInsets.fromLTRB(10 * fem, 10 * fem,
                                  0 * fem, 0 * fem), // Adjust the margin here
                              child: Image.asset(
                                user.isPresent
                                    ? 'assets/Present.png'
                                    : 'assets/clickPresent.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),

                        // Absent button
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              user.isPresent = false;
                            });
                          },
                          child: Padding(
                            padding:
                            const EdgeInsets.all(0), // Adjust the padding here
                            child: Container(
                              width: 60 * fem,
                              height: 60 * fem,
                              margin: EdgeInsets.fromLTRB(0 * fem, 10 * fem,
                                  0 * fem, 0 * fem), // Adjust the margin here
                              child: Image.asset(
                                user.isPresent
                                    ? 'assets/clickAbsent.png'
                                    : 'assets/Absent.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),

          Container(
            margin: const EdgeInsets.fromLTRB(0, 10, 0, 5),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        date = value;
                      });
                    },
                    decoration: InputDecoration(
                      isCollapsed: true, // Reduce the height of the input field
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      labelText: '  dd-MM-yyyy',
                      contentPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 14), // Adjust the padding as needed
                    ),
                    style: const TextStyle(fontSize: 15),
                    controller: TextEditingController(
                      text: date,
                    ),
                  ),
                ),
                Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    DropdownButton<String>(
                      value: selectedTime1,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedTime1 = newValue!;
                        });
                      },
                      items: <String>[
                        '10:00AM',
                        '11:00AM',
                        '12:00PM',
                        '1:00PM',
                        '2:00PM',
                        '3:00PM',
                        '4:00PM',
                        '5:00PM',
                        '6:00PM'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: SafeGoogleFont(
                              'Montserrat',
                              fontSize: 14 * ffem,
                              fontWeight: FontWeight.w500,
                              height: 0.75 * ffem / fem,
                              color: const Color(0xff5994a1),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    const Positioned(
                      top: -2,
                      child: Text(
                        'From', // Replace 'Select Time' with your desired label
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff5994a1)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 5),
                Stack(
                  alignment: Alignment.topLeft,
                  children: [
                    DropdownButton<String>(
                      value: selectedTime2,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedTime2 = newValue!;
                        });
                      },
                      items: <String>[
                        '10:00AM',
                        '11:00AM',
                        '12:00PM',
                        '1:00PM',
                        '2:00PM',
                        '3:00PM',
                        '4:00PM',
                        '5:00PM',
                        '6:00PM'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: SafeGoogleFont(
                              'Montserrat',
                              fontSize: 14 * ffem,
                              fontWeight: FontWeight.w500,
                              height: 0.75 * ffem / fem,
                              color: const Color(0xff5994a1),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    const Positioned(
                      top: -2,
                      child: Text(
                        'To', // Replace 'Select Time' with your desired label
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff5994a1)),
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    AttendanceController.submitAttendance(
                      students,
                      selectedSubject,
                      selectedCourse,
                      date,
                      selectedTime1,
                      selectedTime2,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white, backgroundColor: const Color(0xff5994a1), shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ), // Text color
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24.0, vertical: 12.0),
                    textStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  child: const Text('Submit'),
                ),
                const SizedBox(width: 5),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
