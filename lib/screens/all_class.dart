import 'package:flutter/material.dart';
import 'package:attendance/screens/screens.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class AllClass extends StatefulWidget {
  @override
  _AllClassState createState() => _AllClassState();
}


class ClassScreen extends StatelessWidget{
  @override 
  final String _className, _studentsCount;
  ClassScreen(this._className, this._studentsCount);
  Widget build (BuildContext context){
    return Scaffold(
      body: Container(
        width: double.infinity, 
        
        decoration: BoxDecoration(
          gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                        colors: [
                            Color(0xFF3383CD),
                            Color(0xFF11249F),
                        ],
          ),
          image: DecorationImage(
            image: AssetImage("assets/images/person.png",
            
            ),
            alignment: Alignment.topRight,
            
          ),
        ),
        child: Column(
          children: <Widget> [
            SizedBox(height: 230),
            Expanded(
              
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(  
                  borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30)),
                  color: Colors.white,
                ),
                child: Stack(
                  children: <Widget> [
                   ListView(
                  padding: const EdgeInsets.all(30),
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(_className, style: kHeadingextStyle),
                        SizedBox(height: 10),
                        Text("${_studentsCount} Students", style: kTitleTextStyle.copyWith(color: kTextColor.withOpacity(.50))),
                        SizedBox(height: 35),
                        Students(name: "Akil Vishnu", rollNo: "2018115010", numBer: "01",),
                        Students(name: "Virat Kohli", rollNo: "2018115010", numBer: "02",),
                        Students(name: "MS Dhoni", rollNo: "2018115010", numBer: "03",),
                        Students(name: "Anushka Sharma", rollNo: "2018115010", numBer: "04",),
                        Students(name: "Pooja Hegde", rollNo: "2018115010", numBer: "05",),
                        Students(name: "Samantha", rollNo: "2018115010", numBer: "06",),
                        Students(name: "Disha Patani", rollNo: "2018115010", numBer: "07",),
                        Students(name: "Bala", rollNo: "2018115010", numBer: "08",),
                        Students(name: "Jasprit Bumrah", rollNo: "2018115010", numBer: "09",),
                        
                      ],
                    ),
                ],
                ),

                Positioned(
                          right: 0,
                          left: 0,
                          bottom: 0,
                          child: Container(
                            padding: EdgeInsets.all(20),
                            height: 80,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(topRight: Radius.circular(30), topLeft: Radius.circular(30)),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 50,
                                  offset: Offset(0, 4),
                                  color: kTextColor.withOpacity(.1),
                                ),
                              ]
                            ),
                          child: Row(
                            children: <Widget>[
                              InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => AddUserClass("Student")), );
                                },
                                child:Container(
                                  padding: EdgeInsets.all(10),
                                  height: 56,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFD0D0D0),
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  child: SvgPicture.asset(
                                      "assets/icons/profile.svg", color: Color(0xFF11249F), ),
                                ),
                              ),
                            SizedBox(width: 20),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => CaptureImage()), );
                        },
                              child: Container(
                                alignment: Alignment.center,
                                height: 56,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  gradient: LinearGradient(
                                    begin: Alignment.topRight,
                                    end: Alignment.bottomLeft,
                                    colors: [
                                        Color(0xFF3383CD),
                                        Color(0xFF11249F),
                                    ],
                                  ),

                                ),
                                child: Text(
                                  "Take Attendance",
                                  style: kSubtitleTextSyule.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              ),
                            )
                          ],
                          ),
                          ),
                        ),


                  ],
                ),
              ),
            ),
            
          ],
        ),

      ),
    );
  }
}

class Students extends StatelessWidget{
  final String numBer;
  final String rollNo;
  final String name;
  const Students({
    Key key,
    this.numBer,
    this.rollNo,
    this.name,
  }) : super(key: key);
  @override 
  Widget build (BuildContext context){
    return  Padding( 
      padding: EdgeInsets.all(10),
                    child:Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget> [
                            Text(
                              numBer,
                              style: kHeadingextStyle.copyWith(color: kTextColor.withOpacity(.15)),
                            ),
                            SizedBox(width: 30),
                            RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                  text: name,
                                  style: kSubtitleTextSyule.copyWith(
                                    fontWeight: FontWeight.w600,
                                    height: 1.5,
                                  ),
                                  ),
                                ],
                              ),
                            ),
                            
                          ],
                        ),
    );
  }
}
class RedScreen extends StatelessWidget{
  @override 
  Widget build (BuildContext context){
    return Scaffold(backgroundColor: Colors.red,);
  }
}
class GreenScreen extends StatelessWidget{
  @override 
  Widget build (BuildContext context){
    return Scaffold(backgroundColor: Colors.green,);
  }
}

final List _colorScreen = [
  ClassScreen("Cloud Computing", "17"),
  ClassScreen("Flutter", "200"),
  ClassScreen("Compiler", "1"),
];
int other(int index){
  if(index >= 2) return 2;
  else return index;
}
class _AllClassState extends State<AllClass> {
  
  double helper(var index){
    return index % 4 == 0 || index % 3 == 0 ? 240 : 200;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: EdgeInsets.only(left: 20, top: 20, right:20),
          child: Column(
            children: <Widget>[
              SizedBox(height: 30),
              Text("Good Morning, Akil", style:kTitleTextStyle),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Classes", style: kHeadingextStyle),
                  ],
              ),

              // SizedBox(height: 10),
              
              Expanded(
                child: StaggeredGridView.countBuilder(
                  
                  crossAxisCount: 2,
                  itemCount: classes.length, 
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  itemBuilder: (context, index){
                    return Material(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => _colorScreen[other(index)]), );
                        },
                        child: Container(
 
                      padding: EdgeInsets.all(20),
                      height: helper(index),
                      decoration: BoxDecoration( 
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(image: AssetImage(classes[index].image), fit:BoxFit.fill,),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(classes[index].name,
                          style: kTitleTextStyle),
                        ],
                      ),
                      
                    ),
                      ),
                    );
                  },
                  staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                ),
              ),

            ],
          ),

      ),
    );
  }
}
