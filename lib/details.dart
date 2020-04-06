import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
          floating: false, pinned: true, snap: false,
            title: Container(color: Colors.black, child: Text('SliverAppBar')),
            backgroundColor: Colors.deepOrangeAccent,
            expandedHeight: 220.0,

            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.print),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.print),
                onPressed: () {},
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,
              background: Stack(
                fit: StackFit.expand,
                alignment: Alignment.center,
                children: <Widget>[
                  Image.asset('assets/images/cover.jpeg', fit: BoxFit.fill),
                  Center(
                      child: Text(
                    "Hi",
                    style: TextStyle(fontSize: 32, color: Colors.white),
                  )),
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          color: Colors.white, shape: BoxShape.circle),
                    ),
                  ),
                ],
              ),
            ),
          ),

          SliverAnimatedList(initialItemCount: 100,itemBuilder: (BuildContext context, int index, Animation<double> animation) {
            return ListTile(title: Text("$index"),);
          },),
/*
          SliverFixedExtentList(
            delegate: SliverChildBuilderDelegate((context, index){
              return ListTile(title: Text("$index"),);
            }), itemExtent: 80,

          ),
*/
        ],
      ),
    );
  }
}
