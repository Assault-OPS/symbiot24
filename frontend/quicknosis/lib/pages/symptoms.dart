import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class SymptomButton extends StatefulWidget {
  final double width;
  final double height;
  final IconData icon;
  SymptomButton(
    {
      super.key,
      required double this.width,
      required double this.height,
      required IconData this.icon
    }
  );

  @override
  State<SymptomButton> createState() => _SymptomButtonState();
}

class _SymptomButtonState extends State<SymptomButton> {
  bool isSelected = false;
  String? data;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      color: isSelected ? Colors.red : Colors.lightBlue,
      child: IconButton(
        icon: Icon(widget.icon, color: Colors.white),
        onPressed: () {setState(() {
          isSelected = !isSelected;
        });}
      )
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
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SymptomButton(width: 150, height: 150, icon: FontAwesomeIcons.brain),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SymptomButton(width: 150, height: 150, icon: FontAwesomeIcons.heart),
              ),
            ]
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SymptomButton(width: 150, height: 150, icon: FontAwesomeIcons.eye),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SymptomButton(width: 150, height: 150, icon: FontAwesomeIcons.hand),
              ),
            ]
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
