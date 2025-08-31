import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const FFMasterHubApp());
}

class FFMasterHubApp extends StatelessWidget {
  const FFMasterHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FF Master Hub',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.orange,
      ),
      home: const LanguageSelectionPage(),
    );
  }
}

class LanguageSelectionPage extends StatefulWidget {
  const LanguageSelectionPage({super.key});

  @override
  _LanguageSelectionPageState createState() => _LanguageSelectionPageState();
}

class _LanguageSelectionPageState extends State<LanguageSelectionPage> {
  String? _selectedLanguage;

  @override
  void initState() {
    super.initState();
    _loadLanguage();
  }

  _loadLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _selectedLanguage = prefs.getString("language") ?? "es";
    });
  }

  _saveLanguage(String lang) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("language", lang);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("FF Master Hub - Idioma")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Selecciona tu idioma:"),
            ElevatedButton(
              onPressed: () {
                _saveLanguage("es");
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const HomePage()),
                );
              },
              child: const Text("Español"),
            ),
            ElevatedButton(
              onPressed: () {
                _saveLanguage("en");
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const HomePage()),
                );
              },
              child: const Text("English"),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("FF Master Hub")),
      body: Center(child: const Text("Bienvenido a FF Master Hub! 🚀")),
    );
  }
}
