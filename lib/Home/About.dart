import 'package:flutter/material.dart';
//IMPORT PACKAGE UNTUK HTTP REQUEST DAN ASYNCHRONOUS
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


void main(){
  runApp(About());
}

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  void initState(){
    super.initState();
    this.getData(); // PANGGIL FUNGSI YANG TELAH DIBUAT SEBELUMNYA
  }

  // DEFINE VARIABLE url untuk menampung end point
  final String url = 'https://api.banghasan.com/quran/format/json/surat';
  List data; //DEFINE VARIABLE data DENGAN TYPE List AGAR DAPAT MENAMPUNG COLLECTION / ARRAY

  Future<String> getData() async{
    // MEMINTA DATA KE SERVER DENGAN KETENTUAN YANG DI ACCEPT ADALAH JSON
    var res = await http.get(Uri.encodeFull(url), headers: {'accept':'application/json'});

    setState(() {
      // RESPONSE YANG DIDAPATKAN DARI API TERSEBUT DI DECODE
      var content = json.decode(res.body);
      //KEMUDIAN DATANYA DISIMPAN KE DALAM VARIABLE data,
      //DIMANA SECARA SPESIFIK YANG INGIN KITA AMBIL ADALAH ISI DARI KEY hasil
      data = content['hasil'];
    });
    return 'success!';
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0), // set margin dari container
      child: ListView.builder(
          itemCount: data == null ? 0:data.length,
           // jika datanya ksosong kita isi dengan 0 , jika ada kita hitung jumlah datanya
           itemBuilder: (BuildContext contex, int index){
               return Container(
                  child: Card(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget> [
                        //ListTile MENGELOMPOKKAN WIDGET MENJADI BEBERAPA BAGIAN
                        ListTile(
                          // leading tampil pada sebelah kiri
                          // dimana value dari leading adalah widget text
                          // yang berisi nomor surah
                          leading: Text(data[index]['nomor'], style: TextStyle(fontSize: 20),),
                          // title tampil ditengah leading
                          // value nya adalh widget text
                          // yang berisi nomor surah
                          title: Text(data[index]['nama'],style: TextStyle(fontSize: 20.0),),
                          //trailing TAMPIL PADA SEBELAH KANAN SETELAH title
                          //VALUE NYA ADALAH IMAGE, KETIKA VALUENYA DARI type ADALAH
                          // MEKAH MAKA AKAN MENAMPILKAN mekah.jpg
                          // SELAIN DARI ITU MENAMPILKAN IMAGE madinah.png
                          trailing: Image.asset(data[index]['type'] == 'mekah' ? 'madina1.png':'mekah1.png', width: 32.0, height: 32.0,),
                          // subtitle tampil tepat dibawah title
                          subtitle: Column(children: <Widget> [
                            Row(
                              children: <Widget> [
                                // menampilkan arti
                                Text('Arti : ', style: TextStyle(fontWeight:  FontWeight.bold),),
                                // menampilkan teks dari value
                                Text(data[index]['arti'], style: TextStyle(fontStyle:  FontStyle.italic, fontSize: 15.0),)
                              ],
                            ),
                            Row(
                              children: <Widget> [
                                Text('Jumlah Ayat : ', style: TextStyle(fontWeight: FontWeight.bold),),
                                // kit ambil dari index api
                                Text(data[index]['ayat'])
                              ],
                            ),
                            Row(
                              children: <Widget> [
                                Text('Diturunkan : ', style: TextStyle(fontWeight: FontWeight.bold),),
                                Text(data[index]['type']),
                              ],
                            ),
                          ],),
                        ),
                        // ignore: deprecated_member_use
                        ButtonTheme.bar(
                          child: ButtonBar(
                            children: <Widget> [
                              FlatButton(
                                  onPressed: (){/*...*/},
                                  child: const Text('lihat detail')

                          ),
                              FlatButton(onPressed: () {/*...*/}, child: const Text('Dengarkan')),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),

               );
           }
      )
    );
  }
}
