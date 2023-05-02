import 'package:flutter/material.dart';
import 'package:login_clevercost_1/pages/navigation_dummy.dart';
import 'package:login_clevercost_1/Widgets/dropdown_year_picker.dart';
import 'package:login_clevercost_1/Widgets/dropdown_month_picker.dart';
import 'package:login_clevercost_1/Widgets/custom_check_box.dart';

class VatCalculatorPage extends StatefulWidget {
  const VatCalculatorPage({Key? key}) : super(key: key);

  static const String routeName = '/vat_calc';

  @override
  _VatCalculatorPageState createState() => _VatCalculatorPageState();
}

class _VatCalculatorPageState extends State<VatCalculatorPage> {
  // TODO: state variables og funktioner her
  int selectedCheckboxValue = 0;
  String selectedYear = '';
  String selectedMonth = '';
//Gemmer selectedCheckboxValue så den kan blive brugt i den store VAT udregningsmetode
//som ikke er udviklet endnu
  void handleValueChangedCheckBox(int value) {
    setState(() {
      selectedCheckboxValue = value;
    });
  }

  void handleValueChangedMonthDD(String value) {
    setState(() {
      selectedMonth = value;
    });
  }

  void handleValueChangedYearDD(String value) {
    setState(() {
      selectedYear = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const ListTile(
          title: Text('Vat Calculator'),
          subtitle: Text('Company'),
        ),
        backgroundColor: Colors.white,
        //Sætte kontrast farver på icon så det kan ses med en hvid baggrund
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Divider(
            height: 7,
            thickness: 20,
            color: Color.fromARGB(255, 224, 223, 223),
          ),
          Container(
            color: Colors.white,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Choose a year',
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                    const SizedBox(height: 15),
                    
                    YearDropdown(
                      onValueChanged: handleValueChangedYearDD,
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'How often do you pay VAT?',
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        CustomVATCheckboxes(
                          onValueChanged: handleValueChangedCheckBox,
                        ),
                      ],
                    ),
                    MonthDropdown(onValueChanged: handleValueChangedMonthDD),
                    const SizedBox(height: 10),
                    Text('Selected year: $selectedYear'),
                     const SizedBox(height: 10,),
                    Text('Selected month: $selectedMonth'),
                    const SizedBox(height: 10,),
                    Text('Selected checkbox: $selectedCheckboxValue'),
                    const SizedBox(height: 10,),
                    FloatingActionButton(onPressed: () => Navigator.pushNamed(context, NavigationPage.routeName) ),
                  ],
                ),
              ),
            ),
          ),
          // TODO: Add widgets for the VAT calculator UI here
        ],
      ),
    );
  }
}
