import 'package:flutter/material.dart';

void main() => runApp(MyAppIteso());

class MyAppIteso extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App ITESO',
      home: HomePage(),
    );
  }
}

class _LikeWidgetState extends State<LikeWidget> {
  int _likeCount = 0;

  void _dislike() {
    setState(() {
      _likeCount -= 1;
    });
  }

  void _like() {
    setState(() {
      _likeCount += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            print("Dislike");
            _dislike();
          },
          icon: Icon(
            Icons.thumb_down,
            color: Colors.red,
          ),
        ),
        IconButton(
          onPressed: () {
            print("Like");
            _like();
          },
          icon: Icon(
            Icons.thumb_up,
            color: Colors.blue,
          ),
        ),
        Text('$_likeCount'),
      ],
    );
  }
}

class LikeWidget extends StatefulWidget {
  const LikeWidget({Key? key}) : super(key: key);

  @override
  _LikeWidgetState createState() => _LikeWidgetState();
}

class _ActionWidgetState extends State<ActionWidget> {
  bool _currColor = false;

  void _actions() {
    setState(() {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Snackbar de acciones'),
          action: SnackBarAction(
            label: 'Link',
            onPressed: () {
              // Code to execute.
            },
          ),
        ),
      );
      _currColor = !_currColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            IconButton(
              padding: const EdgeInsets.all(0),
              alignment: Alignment.centerRight,
              onPressed: _actions,
              icon: Icon(
                Icons.mail,
                size: 64,
                color: _currColor ? Colors.indigo : Colors.black,
              ),
            ),
            Text("Correo"),
          ],
        ),
        Column(
          children: [
            IconButton(
              padding: const EdgeInsets.all(0),
              alignment: Alignment.centerRight,
              onPressed: _actions,
              icon: Icon(
                Icons.phone,
                size: 64,
                color: _currColor ? Colors.indigo : Colors.black,
              ),
            ),
            Text("Llamada"),
          ],
        ),
        Column(
          children: [
            IconButton(
              padding: const EdgeInsets.all(0),
              alignment: Alignment.centerRight,
              onPressed: _actions,
              icon: Icon(
                Icons.directions,
                size: 64,
                color: _currColor ? Colors.indigo : Colors.black,
              ),
            ),
            Text("Ruta"),
          ],
        )
      ],
    );
  }
}

class ActionWidget extends StatefulWidget {
  const ActionWidget({Key? key}) : super(key: key);

  @override
  _ActionWidgetState createState() => _ActionWidgetState();
}

class HomePage extends StatelessWidget {
  HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('App ITESO'),
      ),
      body: Column(
        children: [
          // Imagen
          Image.network(
              "https://cruce.iteso.mx/wp-content/uploads/sites/123/2018/04/Portada-2-e1525031912445.jpg"),
          Container(
            height: 30,
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "ITESO Universidad Jesuita de Guadalajara",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "San Pedro Tlaquepaque",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              LikeWidget(),
            ],
          ),
          Container(
            height: 30,
          ),
          ActionWidget(),
          Container(
            height: 40,
          ),
          Text(
            "El ITESO, Universidad Jesuita de Guadalajara (Instituto Tecnológico y de Estudios Superiores de Occidente), es una universidad privada ubicada en la Zona Metropolitana de Guadalajara, Jalisco, México, fundada en el año 1957. La institución forma parte del Sistema Universitario Jesuita (SUJ) que integra a ocho universidades en México. La universidad es nombrada como la Universidad Jesuita de Guadalajara.1​",
            textAlign: TextAlign.justify,
          )
        ],
      ),
    );
  }
}
