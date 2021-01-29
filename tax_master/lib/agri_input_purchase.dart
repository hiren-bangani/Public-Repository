import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'string_collection.dart';
import 'side_navbar.dart';
import 'app_bar.dart';
import 'tab_pending.dart';
import 'tab_executing.dart';
import 'tab_executed.dart';
import 'tab_completed.dart';

class AgriInputPurchaseRequests extends StatefulWidget {
  AgriInputPurchaseRequestsState createState() =>
      new AgriInputPurchaseRequestsState();
}

class AgriInputPurchaseRequestsState extends State {
  Size size;

  PageController pageController = PageController(
    initialPage: 1,
    keepPage: true,
  );

  List<bool> bActivePages = [false, true, false, false];

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: CustomAppBar(),
      drawer: SideNavBar(4),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 90,
              color: Colors.white,
              child: Row(
                children: [
                  topNavBarItem(size, bActivePages[0], 0,
                      StringCollection.pending, Colors.red),
                  topNavBarItem(size, bActivePages[1], 1,
                      StringCollection.executing, Colors.yellow),
                  topNavBarItem(size, bActivePages[2], 2,
                      StringCollection.executed, Colors.orange),
                  topNavBarItem(size, bActivePages[3], 3,
                      StringCollection.completed, Colors.lightGreen),
                ],
              ),
            ),
            Expanded(
              child: PageView(
                controller: pageController,
                onPageChanged: (index) {
                  onPagesChanged(index);
                },
                children: [
                  Pending(),
                  Executing(),
                  Executed(),
                  Completed(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  //When Page swipe occurs
  void onPagesChanged(int index) {
    setState(() {
      for (int i = 0; i < 4; i++) {
        bActivePages[i] = false;
      }
      bActivePages[index] = true;
    });
  }

  //Switch to selected page
  void changePage(double index) {
    onPagesChanged(index.toInt());

    setState(() {
      pageController.jumpToPage(index.toInt());
    });
  }

  //Top Navigation Bar Items
  Widget topNavBarItem(
      Size size, bool bActive, double index, String title, Color color) {
    double height = 90.00;
    double width = size.width * 0.25;

    double pageIndex = index;

    Color numColor = Colors.white;
    Color tabColor = Colors.grey;

    if (bActive) {
      tabColor = Colors.black87;
      numColor = Colors.black87;
    }
    return Container(
      color: Colors.white,
      width: width,
      height: height,
      padding: EdgeInsets.all(2),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              changePage(pageIndex);
            },
            child: Container(
              color: tabColor,
              height: 70,
              padding: EdgeInsets.all(2),
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: 30,
                      height: 30,
                      child: Center(
                        child: Text(
                          ((pageIndex + 1).toInt()).toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: numColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.circular(15.0)),
                    ),
                    SizedBox(height: 5),
                    Container(
                      height: 18,
                      child: Center(
                        child: Text(
                          title,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: 15,
            color: Colors.white,
            child: Visibility(
              visible: bActive,
              child: Stack(children: [
                CustomPaint(
                  size: Size.infinite, //2
                  painter: CurvePainter(), //
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}

//Paint reverse traingle for selected Tab
class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.black87;
    paint.style = PaintingStyle.fill;
    paint.strokeWidth = 2.0;

    var path = Path();
    path.moveTo((size.width - 25) / 2, 0);
    path.lineTo((size.width + 25) / 2, 0);
    path.lineTo(size.width / 2, 15);
    path.lineTo((size.width - 25) / 2, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
