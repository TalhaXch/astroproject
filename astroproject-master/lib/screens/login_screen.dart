import 'package:astroproject/components/button.dart';
import 'package:astroproject/components/switch.dart';
import 'package:astroproject/helpers/colorset.dart';
import 'package:astroproject/helpers/grabtime.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController dateOfBirthController = TextEditingController();
  final TextEditingController hourOfBirthController = TextEditingController();
  final TextEditingController placeOfBirthController = TextEditingController();

  String savedData = '';
  bool is24HourFormat = true;

  Future<void> _selectDate(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );

    if (selectedDate != null) {
      setState(() {
        dateOfBirthController.text = DateFormat('dd/MM/yyyy').format(selectedDate);
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (selectedTime != null) {
      setState(() {
        final now = DateTime.now();
        final formattedTime = DateFormat('HH:mm').format(
          DateTime(now.year, now.month, now.day, selectedTime.hour, selectedTime.minute),
        );
        hourOfBirthController.text = formattedTime;
      });
    }
  }

  void saveData() {
    String firstName = firstNameController.text;
    String lastName = lastNameController.text;
    String dateOfBirth = dateOfBirthController.text;
    String hourOfBirth = hourOfBirthController.text;
    String placeOfBirth = placeOfBirthController.text;

    // Format the date and hour of birth
    DateTime parsedDate = DateFormat('dd/MM/yyyy').parse(dateOfBirth);
    String formattedDate = DateFormat('yyyy-MM-dd').format(parsedDate);
    String formattedHour = hourOfBirth;

    // Concatenate all the inputs into a single string
    savedData = '$firstName $lastName $formattedDate $formattedHour $placeOfBirth';

    // Now you can use savedData elsewhere in your app
    print('Saved Data: $savedData');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Create Account',
            style: TextStyle(
                color: Color(0XFF7C4AE5),
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
                fontSize: 20),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0XFF7C4AE5)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 80.0),
                child: Text(
                  'Please register your name, surname and birth details to check your horoscope:',
                  style: GoogleFonts.poppins(
                    textStyle: const TextStyle(
                        fontSize: 18,
                        color: Color(0XFF373737),
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              _buildTextField(
                  controller: firstNameController, label: 'First name'),
              const SizedBox(height: 16),
              _buildTextField(
                  controller: lastNameController, label: 'Last name'),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () => _selectDate(context),
                child: AbsorbPointer(
                  child: _buildTextField(
                    controller: dateOfBirthController,
                    label: 'Date of Birth',
                    keyboardType: TextInputType.datetime,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () => _selectTime(context),
                child: AbsorbPointer(
                  child: _buildTextField(
                    controller: hourOfBirthController,
                    label: 'Hour of Birth',
                    keyboardType: TextInputType.datetime,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              _buildTextField(
                  controller: placeOfBirthController, label: 'Place of Birth'),

              const SizedBox(height: 16),
                      SwitchComponent(value: is24HourFormat,
                        onChanged: (value) {
                          setState(() {
                            is24HourFormat = value;
                            String currentTime;
                            final now = DateTime.now();

                            if (is24HourFormat) {
                              // 24H format
                              currentTime = DateFormat('HH:mm').format(now);
                            } else {
                              // 12H format
                              currentTime = DateFormat('hh:mm a').format(now);
                            }

                            // Print the current time
                            print('Current Time: $currentTime');

                          });
                        },


                      ),
              const SizedBox(height: 35),
              PrimaryButton(
                  onTap: saveData,
                  text: 'Save',
                  textColor: Colors.white,
                  bgColor: AppColor.kPrimary)
            ],
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
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Color(0XFFB4B4B4), fontSize: 18),
        filled: true,
        fillColor: Colors.white,
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        contentPadding:
        const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      ),
      style: const TextStyle(fontSize: 16),
    );
  }
}
