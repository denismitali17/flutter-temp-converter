import 'package:flutter/material.dart';

void main() => runApp(TempConverterApp());

class TempConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Converter',
      home: TemperatureConverter(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TemperatureConverter extends StatefulWidget {
  @override
  _TemperatureConverterState createState() => _TemperatureConverterState();
}

enum ConversionType { fToC, cToF }

class _TemperatureConverterState extends State<TemperatureConverter> {
  final TextEditingController _controller = TextEditingController();
  ConversionType _conversionType = ConversionType.fToC;
  String _result = '';
  List<String> _history = [];

  void _convert() {
    final input = double.tryParse(_controller.text);
    if (input == null) return;

    double converted;
    String entry;

    if (_conversionType == ConversionType.fToC) {
      converted = ((input - 32) * 5 / 9);
      entry = "F to C: $input => ${converted.toStringAsFixed(2)}";
    } else {
      converted = (input * 9 / 5 + 32);
      entry = "C to F: $input => ${converted.toStringAsFixed(2)}";
    }

    setState(() {
      _result = converted.toStringAsFixed(2);
      _history.insert(0, entry);
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

    Widget converterSection = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Conversion:", style: TextStyle(fontWeight: FontWeight.bold)),
        Row(
          children: [
            Radio<ConversionType>(
              value: ConversionType.fToC,
              groupValue: _conversionType,
              onChanged: (value) => setState(() => _conversionType = value!),
            ),
            Text("Fahrenheit to Celsius"),
            Radio<ConversionType>(
              value: ConversionType.cToF,
              groupValue: _conversionType,
              onChanged: (value) => setState(() => _conversionType = value!),
            ),
            Text("Celsius to Fahrenheit"),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: "Enter temperature"),
              ),
            ),
            SizedBox(width: 10),
            Text(" = "),
            SizedBox(width: 10),
            Container(
              width: 80,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(5)),
              child: Text(_result, textAlign: TextAlign.center),
            ),
          ],
        ),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: _convert,
          child: Text("CONVERT"),
        ),
      ],
    );

    Widget historySection = Expanded(
      child: ListView.builder(
        itemCount: _history.length,
        itemBuilder: (context, index) => Text(_history[index]),
      ),
    );

    return Scaffold(
      appBar: AppBar(title: Text("Converter")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: isPortrait
            ? Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            converterSection,
            SizedBox(height: 20),
            Text("History (latest at top):",
                style: TextStyle(fontWeight: FontWeight.bold)),
            historySection,
          ],
        )
            : Row(
          children: [
            Expanded(child: converterSection),
            VerticalDivider(),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("History (latest at top):",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Expanded(child: historySection),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
