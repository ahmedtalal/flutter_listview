import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(MyApp()) ;
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        iconTheme: IconThemeData(
          size: 50 ,
          color: Colors.white
        ) ,
        textTheme: TextTheme(
          headline1: TextStyle(
            color: Colors.white ,
            fontSize: 20 ,
            fontWeight: FontWeight.bold ,
          )
        ),
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> entries = ["Box1" , "Box2" , "Box3" , "Box4" , "Box5" , "Box6"] ;
  var myKey = GlobalKey<ScaffoldState>() ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: myKey ,
      appBar: AppBar(
        title: Text(
          "listview in flutter" ,
        ),
        backgroundColor: Colors.orange,
      ),
      // body: ListView.builder(
      //   itemCount: entries.length,
      //   itemBuilder: (context , index){
      //     return Container(
      //       child: Center(
      //         child: ListTile(
      //           leading: Icon(Icons.more),
      //           title: Text(
      //             entries[index] ,
      //             style: TextStyle(
      //               fontSize: 20 ,
      //               color: Colors.white ,
      //               fontWeight: FontWeight.bold ,
      //             ),
      //           ),
      //           onTap: (){
      //             myKey.currentState.showSnackBar(
      //               SnackBar(content: 
      //               Text("sdds $index"),)
      //             );
      //           },
      //         ) ,
      //       ) ,
      //       height: 120,
      //       decoration: BoxDecoration(
      //         color: Colors.orange ,
      //         borderRadius: BorderRadius.circular(12) ,
      //       ),
      //       margin: EdgeInsets.all(6),
      //     );
      //   },
      // ),
      // body: ListView.separated(
      //   scrollDirection: Axis.vertical,
      //   itemCount: entries.length,
      //   itemBuilder: (context , index) {
      //     return Container(
      //       child: Center(
      //         child: ListTile(
      //           title: Text(
      //             entries[index] ,
      //             style: TextStyle(
      //               fontSize: 20 ,
      //               color: Colors.white ,
      //               fontWeight: FontWeight.bold ,
      //             ),
      //           ),
      //           subtitle: Text(
      //             "subtitle ${entries[index]}" ,
      //           ),
      //           leading: Icon(Icons.home , color: Colors.white, size: 25,),
      //           trailing: Icon(Icons.more , color: Colors.white,size: 25,),
      //           onTap: (){
      //             myKey.currentState.showSnackBar(
      //               SnackBar(
      //                 content: Text(
      //                   "box ${entries[index]}"
      //                 ) ,
      //               )
      //             );
      //           },
      //         ),
      //       ) ,
      //       height: 100,
      //       decoration: BoxDecoration(
      //         color: Colors.orange ,
      //         borderRadius: BorderRadius.circular(12) ,
      //       ),
      //       margin: EdgeInsets.all(6),
      //     );
      //   },
      //   separatorBuilder: (context , index) => Divider(),
      // ),
      body: ListView.custom(
        scrollDirection: Axis.vertical ,
        childrenDelegate:SliverChildListDelegate(
          List.generate(20, (index){
            return Container(
              height: 100,
              child: Center(
                child: ListTile(
                  leading: Icon(
                    Icons.add_box ,
                    color: Colors.white ,
                  ),
                  title: Text(
                    "box $index" ,
                    style: TextStyle(
                      color: Colors.white ,
                      fontSize: 20 ,
                    ),
                  ),
                  subtitle: Text(
                    "subtitle $index" ,
                  ),
                  onTap: (){
                    myKey.currentState.showSnackBar(
                      SnackBar(
                        content: Text(
                          "box $index" ,
                        ),
                      ),
                    );
                  }, 
                  trailing: Icon(Icons.more , size: 25,  color: Colors.white,),
                ),
              ) ,
              decoration: BoxDecoration(
                color: Colors.red ,
                borderRadius: BorderRadius.circular(10) ,
              ),
              margin: EdgeInsets.all(5),
            ) ;
          })
        ) ,
      ),
    );
  }
}