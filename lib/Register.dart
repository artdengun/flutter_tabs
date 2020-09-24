import 'package:flutter/material.dart';

void main(){
  runApp(Register());
}

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget> [
          Row(
            children: <Widget> [
              Icon(Icons.account_balance_wallet),
              Text("Register")
            ],),
          Card(
            child: Column(
              children: <Widget> [
                Image.network('https://i0.wp.com/wp.laravel-news.com/wp-content/uploads/2016/11/laravel-query-dump.png'),
                Text("Baru isi"),
              ],
            ),
          ),
          Card(
            child: Column(
              verticalDirection: VerticalDirection.down,
              children: <Widget> [

                Text("ini judul"),
                Image.asset("images/login.png"),
                Text("Baru isi"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
