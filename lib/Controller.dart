import 'dart:io';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'User.dart';

class AttendanceController {
  static void submitAttendance(List<User> students, String selectedSubject, String selectedCourse, String date,String selectedTime1,String selectedTime2) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.MultiPage(
        build: (context) => [
          pw.Header(
            level: 0,
            child: pw.Text('Attendance Report'),
          ),
          pw.Text('Date: $date', style:pw.TextStyle(fontSize: 20,fontWeight: pw.FontWeight.bold,fontStyle: pw.FontStyle.italic,)),
          pw.SizedBox(height: 10),
          pw.Text('Course: $selectedCourse ', style: const pw.TextStyle(fontSize: 20)),
          pw.SizedBox(height: 10),
          pw.Text('Subject: $selectedSubject ', style: const pw.TextStyle(fontSize: 20)),
          pw.SizedBox(height: 10),
          pw.Text('Time: $selectedTime1 - $selectedTime2', style: const pw.TextStyle(fontSize: 20)),
          pw.SizedBox(height: 10),
          pw.Table(
            border: pw.TableBorder.all(),
            children: [
              pw.TableRow(
                children: [
                  pw.Text('Name', style:pw.TextStyle(fontSize: 14,fontWeight: pw.FontWeight.bold,fontStyle: pw.FontStyle.italic,decoration: pw.TextDecoration.underline,decorationThickness: 2)),
                  pw.Text('Roll Number', style:pw.TextStyle(fontSize: 14,fontWeight: pw.FontWeight.bold,fontStyle: pw.FontStyle.italic,decoration: pw.TextDecoration.underline,decorationThickness: 2)),
                  pw.Text('Attendance', style:pw.TextStyle(fontSize: 14,fontWeight: pw.FontWeight.bold,fontStyle: pw.FontStyle.italic,decoration: pw.TextDecoration.underline,decorationThickness: 2)),
                ],
              ),
              for (var student in students)
                pw.TableRow(
                  children: [
                    pw.Text(student.name),
                    pw.Text('  ${student.rollNumber}'),
                    pw.Container(
                      padding: const pw.EdgeInsets.all(5),
                      color: student.isPresent ? PdfColors.lightGreen : PdfColors.redAccent,
                      child: pw.Text(student.isPresent ? 'Present' : 'Absent', style:pw.TextStyle(fontSize: 10,fontWeight: pw.FontWeight.bold)),
                    ),
                  ],
                ),
            ],
          ),
        ],
      ),
    );



    final output = await getTemporaryDirectory();
    final file = File('${output.path}/$selectedCourse + $selectedSubject + $date.pdf');
    file.writeAsBytes(await pdf.save());

    if (await file.exists()) {
      OpenFile.open(file.path);
    }
  }
}
