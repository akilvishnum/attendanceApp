
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:attendance/screens/screens.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AllClass extends StatefulWidget {
  final String email;
  AllClass(this.email);
  @override
  _AllClassState createState() => _AllClassState();
}

class ClassScreen extends StatefulWidget {
  final String _className, _studentsCount, userEmail;
  ClassScreen(this._className, this._studentsCount, this.userEmail);
  @override
  _ClassScreenState createState() => _ClassScreenState();
}

class _ClassScreenState extends State<ClassScreen> {
  @override
  Widget build(BuildContext context) {
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
            image: AssetImage(
              "assets/images/person.png",
            ),
            alignment: Alignment.topRight,
          ),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(height: 230),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30)),
                  color: Colors.white,
                ),
                child: Stack(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: ListView(
                        shrinkWrap: true,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(widget._className, style: kHeadingextStyle),
                              SizedBox(height: 10),
                              Text("${widget._studentsCount} Students",
                                  style: kTitleTextStyle.copyWith(
                                      color: kTextColor.withOpacity(.50))),
                              SizedBox(height: 35),
                              StreamBuilder(
                                stream: FirebaseFirestore.instance
                                    .collection('Staff')
                                    .doc(email)
                                    .collection('Classrooms')
                                    .doc(widget._className)
                                    .snapshots(),
                                builder: (BuildContext context,
                                    AsyncSnapshot<DocumentSnapshot> snapshot) {
                                  if (!snapshot.hasData)
                                    return CircularProgressIndicator();
                                  return StudentBuilder(snapshot.data.data());
                                },
                              ),
                              SizedBox(height:60),
                            ],
                          ),
                        ],
                      ),
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
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30),
                                topLeft: Radius.circular(30)),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 50,
                                offset: Offset(0, 4),
                                color: kTextColor.withOpacity(.1),
                              ),
                            ]),
                        child: Row(
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AddUserClass(
                                          "Student", widget._className)),
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.all(10),
                                height: 56,
                                width: 80,
                                decoration: BoxDecoration(
                                  color: Color(0xFFD0D0D0),
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                child: SvgPicture.asset(
                                  "assets/icons/profile.svg",
                                  color: Color(0xFF11249F),
                                ),
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CaptureImage()),
                                  );
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

class StudentBuilder extends StatelessWidget {
  final Map<String, dynamic> docData;
  StudentBuilder(this.docData);
  @override
  Widget build(BuildContext context) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: 50000),
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemCount: docData['students'].length,
                  itemBuilder: (context, index){
                    // return Padding(padding: EdgeInsets.all(20), child: Text("Cool"));
                    return Padding(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            ((index + 1 < 10) ? "0" : "" )+ (index + 1).toString(),
                            style:
                                kHeadingextStyle.copyWith(color: kTextColor.withOpacity(.15)),
                          ),
                          SizedBox(width: 30),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: docData['students'][index],
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
                  },
                ),
              ),
            ],
          );
  }
}

class Students extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            numBer,
            style:
                kHeadingextStyle.copyWith(color: kTextColor.withOpacity(.15)),
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

class _AllClassState extends State<AllClass> {
  double helper(var index) {
    return index % 4 == 0 || index % 3 == 0 ? 240 : 200;
  }


  @override
  void initState() {
    print(widget.email);
    super.initState();
  }

  // DocumentReference ins = FirebaseFirestore.instance
  //     .collection('Staff')
  //     .doc(getData())
  //     .collection('Classrooms')
  //     .get();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 20, top: 20, right: 20),
        child: Column(
          children: <Widget>[
            SizedBox(height: 30),
            Text("Welcome", style: kTitleTextStyle),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text("Classes", style: kHeadingextStyle),
              ],
            ),

            // SizedBox(height: 10),

            StreamBuilder(
              stream: FirebaseFirestore.instance
                  .collection('Staff')
                  .doc(widget.email)
                  .collection('Classrooms')
                  .snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) return CircularProgressIndicator();
                return Sview(documents: snapshot.data.docs);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Sview extends StatelessWidget {
  final List<DocumentSnapshot> documents;
  Sview({this.documents});
  double helper(var index) {
    return index % 4 == 0 || index % 3 == 0 ? 240 : 200;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StaggeredGridView.countBuilder(
        crossAxisCount: 2,
        itemCount: documents.length,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        itemBuilder: (context, index) {
          String name = documents[index].get('name');
          //String number = documents[index].get('number').toString();
          String image = documents[index].get('image');
          return Material(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ClassScreen(name, 0.toString(), email)),
                );
              },
              child: Container(
                padding: EdgeInsets.all(20),
                height: helper(index),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: AssetImage(/*newList[index].image*/ image),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(/*newList[index].name*/ name, style: kTitleTextStyle),
                  ],
                ),
              ),
            ),
          );
        },
        staggeredTileBuilder: (index) => StaggeredTile.fit(1),
      ),
    );
  }
}