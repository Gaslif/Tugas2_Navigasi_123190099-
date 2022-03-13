import 'package:flutter/material.dart';
import 'login_page.dart';
import 'detail_page.dart';

import 'model/movie.dart';

class HomePage extends StatefulWidget{
  final String username;
  const HomePage({Key? key, required this.username}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("Movie List"),
        actions: <Widget>[

          IconButton(icon: new Icon(Icons.logout, color: Colors.white), onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) {
                return LoginPage();
              }), (route) => false,
            );
          },),

        ],
      ),

      body: Container(
        padding: EdgeInsets.all(20),
        child: _createListCard(),
      ),
    );
  }

  Widget _createListCard() {
    var dataMovie = getData;

    return ListView.separated(
      itemBuilder: (context, index) {
        return _createCard(dataMovie[index], context);
      },
      itemCount: dataMovie.length,
      separatorBuilder: (context, index) {
        return Container(
          color: Colors.grey,
          height: 1,
          margin: EdgeInsets.symmetric(vertical: 4),
        );
      },
    );
  }

  Widget _createCard(Movie data, BuildContext context) {
    return Card(
      child: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return DetailPage(image: data.image, name: data.name, price: data.price);
          }));
        },
        child: Container(
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Image.network(data.image),
              ),
              Expanded(
                flex: 3,
                child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    child: Text(data.name)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}