import 'package:bmi_calculator_app/bmi_store.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:velocity_x/velocity_x.dart';
import '../components/icon_content.dart';
import '../components/page_bottom_button.dart';
import 'results_page.dart';
import '../components/reusable_card.dart';
import '../constants.dart';
import '../components/round_icon_button.dart';
import '../calculator.dart';

enum Sex { Male, Female }

class InputPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    BMIStore store = VxState.store as BMIStore;

    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            PageBottomButton(
              label: 'CALCULATE',
              onPress: () {
                final calc =
                Calculator(height: store.height, weight: store.weight);
                final bmi = calc.calculate();
                final result = calc.getResult();
                final interpretation = calc.getInterpretation();

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultsPage(
                          bmi: bmi,
                          result: result,
                          interpretation: interpretation,
                        )));
              },
            ),
          ],
        ));
  }
}
