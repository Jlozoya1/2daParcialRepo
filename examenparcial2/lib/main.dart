import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Demo',
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();
  int _attemptCounter = 0;
  String _errorMessage = '';

  // Lista de usuarios simulada
  final List<Map<String, String>> users = [
    {'login': 'pepe', 'password': '1234', 'name': ' '},
    {'login': 'juan', 'password': '5678', 'name': 'Juan Pérez'},
  ];

  void _validateLogin() {
    String login = _loginController.text;
    String password = _passwordController.text;

    // Busca si el login y la contraseña coinciden con alguno en la lista
    final user = users.firstWhere(
      (user) => user['login'] == login && user['password'] == password,
      orElse: () => {}, // Devuelve un map vacío si no encuentra coincidencias
    );

    if (user.isNotEmpty) {
      // Si el usuario es válido, navega a la siguiente pantalla
      setState(() {
        _attemptCounter = 0; // Reinicia el contador
        _errorMessage = '';
      });

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => UserDetailsScreen(
            login: user['login']!,
            name: user['name']!,
          ),
        ),
      );
    } else {
      // Si la validación falla, incrementa el contador de intentos
      setState(() {
        _attemptCounter++;
        _errorMessage = 'Login o contraseña incorrectos';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio de sesión'),
        backgroundColor: Colors.redAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _loginController,
              decoration: InputDecoration(labelText: 'Login'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _validateLogin,
              child: Text('Entrar'),
            ),
            SizedBox(height: 20),
            Text('Intentos: $_attemptCounter'),
            if (_errorMessage.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  _errorMessage,
                  style: TextStyle(color: Colors.red),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class UserDetailsScreen extends StatelessWidget {
  final String login;
  final String name;

  UserDetailsScreen({required this.login, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles del usuario'),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('login del usuario: $login'),
            Text('Nombre: $name'),
            Text('Encontrado!!!'),
          ],
        ),
      ),
    );
  }
}
