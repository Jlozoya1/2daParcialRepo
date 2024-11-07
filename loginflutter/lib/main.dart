import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Login With Flutter'),
        ),
        body: cuerpo(),
      ),
    );
  }
}

class cuerpo extends StatelessWidget {
  const cuerpo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  'https://images.unsplash.com/photo-1491833485966-73cfb9ccea53?q=80&w=2787&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
              fit: BoxFit.cover)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Etiqueta(), campoUser(), campoPass(), btnEntrar()],
      ),
    );
  }

  Widget Etiqueta() {
    return Container(
      child: Center(
        child: Text(
          'Sign In',
          style: TextStyle(fontSize: 25, color: Colors.black),
        ),
      ),
    );
  }

  Widget campoUser() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
      child: TextField(
        decoration: InputDecoration(
            hintText: 'user', fillColor: Colors.white, filled: true),
      ),
    );
  }

  Widget campoPass() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
            hintText: 'password', fillColor: Colors.white, filled: true),
      ),
    );
  }

  Widget btnEntrar() {
    return ElevatedButton(
      onPressed: () {},
      child: Text(
        'Intro Now',
        style: TextStyle(fontSize: 20, color: Colors.blue),
      ),
    );
  }
}
