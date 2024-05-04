import 'package:daily_value_calculator/nutrition_list.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const DailyValueCalculator());
}

class DailyValueCalculator extends StatelessWidget {
  const DailyValueCalculator({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daily Value Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      home: const HomePage(title: 'Daily Value Calculator'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(
            widget.title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
                onPressed: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: Text('About ${widget.title}'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text.rich(
                              TextSpan(children: [
                                const TextSpan(
                                    text: 'Created by ',
                                    style: TextStyle(color: Colors.black)),
                                TextSpan(
                                    text: 'Alden Davidson',
                                    style: const TextStyle(color: Colors.blue),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () async {
                                        final Uri url =
                                            Uri.parse('https://adavidson.us');
                                        _launchUrl(url);
                                      })
                              ]),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 12),
                            Text.rich(
                              TextSpan(children: [
                                const TextSpan(
                                    text: "Inspired by/stolen from this neat\n",
                                    style: TextStyle(color: Colors.black)),
                                TextSpan(
                                    text: 'Daily Value Calculator',
                                    style: const TextStyle(color: Colors.blue),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () async {
                                        final Uri url = Uri.parse(
                                            'https://dailyvaluecalculator.netlify.app/');
                                        _launchUrl(url);
                                      })
                              ]),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 12),
                            Text.rich(
                              TextSpan(children: [
                                const TextSpan(
                                    text: "All Daily Values sourced from ",
                                    style: TextStyle(color: Colors.black)),
                                TextSpan(
                                    text: 'the FDA',
                                    style: const TextStyle(color: Colors.blue),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () async {
                                        final Uri url = Uri.parse(
                                            'https://www.fda.gov/food/nutrition-facts-label/daily-value-nutrition-and-supplement-facts-labels');
                                        _launchUrl(url);
                                      })
                              ]),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                        actions: [
                          TextButton(
                              onPressed: () => Navigator.pop(context, 'Close'),
                              child: const Text('Close'))
                        ],
                      ),
                    ),
                icon: const Icon(Icons.info))
          ],
        ),
        body: const NutrientList());
  }
}

Future<void> _launchUrl(Uri url) async {
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}
