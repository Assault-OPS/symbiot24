import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:multi_dropdown/enum/app_enums.dart';
import 'package:multi_dropdown/models/chip_config.dart';
import 'package:multi_dropdown/models/network_config.dart';
import 'package:multi_dropdown/models/value_item.dart';
import 'package:multi_dropdown/multiselect_dropdown.dart';
import 'package:multi_dropdown/widgets/hint_text.dart';
import 'package:multi_dropdown/widgets/selection_chip.dart';
import 'package:multi_dropdown/widgets/single_selected_item.dart';
import 'package:quicknosis/wrapper.dart';



class SymptomButton extends StatefulWidget {
  final double width;
  final double height;
  final List<IconData> icons;
  SymptomButton(
    {
      super.key,
      required double this.width,
      required double this.height,
      required List<IconData> this.icons,
    }
  );

  @override
  State<SymptomButton> createState() => _SymptomButtonState();
}

class _SymptomButtonState extends State<SymptomButton> {
  bool isSelected1 = false;
  bool isSelected2 = false;
  bool isSelected3 = false;
  bool isSelected4 = false;
  List<String> all_filters = ["Headache", "Heart Attack", "Blindness", "Rashes"];
  List<String> filters = [
        "fatigue",
        "mood swings",
        "weight loss",
        "restlessness",
        "sweating",
        "diarrhoea",
        "fast heart rate",
        "excessive hunger",
        "muscle weakness",
        "irritability",
        "abnormal menstruation",
  ];
  List<String> selectedFilters = [];
  final MultiSelectController _controller = MultiSelectController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: widget.width,
                    height: widget.height,
                    color: isSelected1 ? Colors.red : Colors.lightBlue,
                    child: IconButton(
                      icon: Icon(widget.icons[0], color: Colors.white),
                      onPressed: () {setState(() {
                        if(isSelected1 == false) {
                          if(!filters.contains("Headache"))
                            filters.add("Headache");
                        }
                        isSelected1 = !isSelected1;
                      }
                      );
                      }
                    )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: widget.width,
                    height: widget.height,
                    color: isSelected2 ? Colors.red : Colors.lightBlue,
                    child: IconButton(
                      icon: Icon(widget.icons[1], color: Colors.white),
                      onPressed: () {setState(() {
                        if(isSelected2 == false) {
                          if(!filters.contains("Heart Attack"))
                            filters.add("Heart Attack");
                        }
                        isSelected2 = !isSelected2;
                      }
                      );
                      }
                    )
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: widget.width,
                    height: widget.height,
                    color: isSelected3 ? Colors.red : Colors.lightBlue,
                    child: IconButton(
                      icon: Icon(widget.icons[2], color: Colors.white),
                      onPressed: () {setState(() {
                        if(isSelected1 == false) {
                          if(!filters.contains("Blindness"))
                            filters.add("Blindness");
                        }
                        isSelected3 = !isSelected3;
                      }
                      );
                      }
                    )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: widget.width,
                    height: widget.height,
                    color: isSelected4 ? Colors.red : Colors.lightBlue,
                    child: IconButton(
                      icon: Icon(widget.icons[3], color: Colors.white),
                      onPressed: () {setState(() { 
                        if(isSelected1 == false) {
                          if(!filters.contains("Rashes"))
                            filters.add("Rashes");
                        };
                        isSelected4 = !isSelected4;
                      }
                      );
                      }
                    )
                  ),
                ),
              ],
            ),
            MultiSelectDropDown(
            controller: _controller,
            optionsBackgroundColor: Colors.grey[200],
            onOptionSelected: (options) {
              selectedFilters = options.map((ValueItem<dynamic> item) {
                  return item.label;
              }).toList();
              print(selectedFilters);
            },
            options: filters.map(
              (String item) {
                return ValueItem<dynamic>(label: item, value: item);
              }
            ).toList(),
            maxItems: 4,
            disabledOptions: const [ValueItem(label: 'Option 1', value: '1')],
            selectionType: SelectionType.multi,
            chipConfig: const ChipConfig(wrapType: WrapType.wrap),
            dropdownHeight: 200,
            optionTextStyle: const TextStyle(fontSize: 20),
            selectedOptionIcon: const Icon(Icons.check_circle),
          ),
          ],
        ),
        SizedBox(height: 100),
        Center(
          child: ElevatedButton(
            onPressed: () async {
              Map<String,dynamic>? response = await sendPostRequest(selectedFilters);
              print('RESPONSE: ' + response.toString());
            },
            child: Text("Submit")
          )
        )
      ],
    );
  }
}


class Symptoms extends StatefulWidget {
  const Symptoms({super.key});

  @override
  State<Symptoms> createState() => _SymptomsState();
}

class _SymptomsState extends State<Symptoms> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Symptoms", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.lightBlue
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: SymptomButton(width: 150, height: 150, icons: [FontAwesomeIcons.brain, FontAwesomeIcons.heart, FontAwesomeIcons.eye, FontAwesomeIcons.hand]),
          ),
        ],
      )
    );
  }
}
