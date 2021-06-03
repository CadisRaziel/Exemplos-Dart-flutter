import 'package:flutter/material.dart';
import 'package:futureyoutube/DetalhePage.dart';
import 'package:futureyoutube/network.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter API placeholder'),
        centerTitle: true,
      ),
      body: Container(
        child: FutureBuilder(
          //esse fetchPhoto é o Map que eu construi la no network.dart
          future: fetchPhoto(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                          snapshot.data[index].url
                        ),
                      ),
                      title: Text(snapshot.data[index].title),
                      subtitle: Text(snapshot.data[index].url),
                      onTap: (){
                        //ao clicar vamos passar o title como parametro para o appbar da segunda tela !
                        Navigator.push(context, 
                        MaterialPageRoute(builder: (context) => DetalhePage(snapshot.data[index])));
                      },
                    );
                  });
            } else if (snapshot.hasError){
              return Container(
                child: Center(child: Text('Not Found data'),),
              );
            } else {
              return Center(
                //precisamos colocar o circularProgress para nao dar um erro de null !!!                
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
