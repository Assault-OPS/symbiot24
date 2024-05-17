import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class SymptomButton extends StatefulWidget {
  final double width;
  final double height;
  final List<IconData> icons;
  final String data;
  SymptomButton(
    {
      super.key,
      required double this.width,
      required double this.height,
      required List<IconData> this.icons,
      required String this.data
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
  
  @override
  Widget build(BuildContext context) {
    return Column(
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
                    isSelected4 = !isSelected4;
                  }
                  );
                  }
                )
              ),
            ),
          ],
        ),
      ],
    );
  }
}


class SwitchGrid extends StatefulWidget {
  @override
  _SwitchGridState createState() => _SwitchGridState();
}

class _SwitchGridState extends State<SwitchGrid> {
  List<bool> _switchValues = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          childAspectRatio: 1.0, // Aspect ratio of each grid item
        ),
        itemCount: 4, // Number of items in the grid
        itemBuilder: (context, index) {
          return Card(
            elevation: 4.0,
            child: Center(
              child: Switch(
                value: _switchValues[index],
                onChanged: (bool newValue) {
                  setState(() {
                    _switchValues[index] = newValue;
                  });
                },
              ),
            ),
          );
        },
      ),
    );
  }
}


class Symptoms extends StatefulWidget {
  const Symptoms({super.key});

  @override
  State<Symptoms> createState() => _SymptomsState();
}

class _SymptomsState extends State<Symptoms> {
  String? _selectedItem;
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
            child: SymptomButton(width: 150, height: 150, icons: [FontAwesomeIcons.brain, FontAwesomeIcons.heart, FontAwesomeIcons.eye, FontAwesomeIcons.hand], data: "brain"),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: DropdownButton<String>(
              value: _selectedItem,
              hint: Text('Select an item'),
              onChanged: (newValue) {
                setState(() {
                  _selectedItem = newValue;
                });
              },
              items: <String>['Item 1', 'Item 2', 'Item 3', 'Item 4']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ],
      )
    );
  }
}
