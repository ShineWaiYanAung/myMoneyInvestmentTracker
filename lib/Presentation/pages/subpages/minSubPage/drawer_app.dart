import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Alignment> _tlAlignAnim;
  late Animation<Alignment> _brAlignAnim;

  @override
  void initState() {
    super.initState();
    // Increase duration to 16 seconds for a slower animation
    _controller =
        AnimationController(duration: Duration(microseconds: 1000), vsync: this);

    _tlAlignAnim = TweenSequence<Alignment>([
      TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.topLeft, end: Alignment.topRight),
          weight: 4), // Adjusted weight
      TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.topRight, end: Alignment.bottomLeft),
          weight: 4), // Adjusted weight
      TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.bottomLeft, end: Alignment.bottomRight),
          weight: 4), // Adjusted weight
      TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.bottomRight, end: Alignment.topLeft),
          weight: 4), // Adjusted weight
    ]).animate(_controller);

    _brAlignAnim = TweenSequence<Alignment>([
      TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.bottomRight, end: Alignment.bottomLeft),
          weight: 4), // Adjusted weight
      TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.bottomLeft, end: Alignment.topLeft),
          weight: 4), // Adjusted weight
      TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.topLeft, end: Alignment.topRight),
          weight: 4), // Adjusted weight
      TweenSequenceItem<Alignment>(
          tween: Tween<Alignment>(
              begin: Alignment.topRight, end: Alignment.bottomRight),
          weight: 4), // Adjusted weight
    ]).animate(_controller);

    _controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    final height = MediaQuery.of(context).size.height;
    return Drawer(
      child: Column(
        children: [
          // Header Container
          Container(
            height: height * 0.3,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Theme.of(context).focusColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                CircleAvatar(
                  radius: height * 0.07,
                  backgroundColor: Colors.white,
                  child: Image.asset("asset/person/maleStudent.png"),
                ),
                SizedBox(height: 20),
                Text(
                  "Shine Wai Yan Aung",
                  style: TextStyle(
                    fontFamily: "Jersey",
                    color: Colors.white,
                    fontSize: 30,
                    letterSpacing: 1,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 40),

          // Card for Profile
          Card(
            color: Theme.of(context).focusColor,
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            child: ListTile(
              leading: Icon(Icons.person, color: Colors.white),
              title: Text('Profile', style: TextStyle(color: Colors.white)),
              onTap: () {
                // Navigate to profile screen
              },
            ),
          ),
          SizedBox(height: 20),
          // Card for About App
          Card(
            color: Theme.of(context).focusColor,
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            child: ListTile(
              leading: Icon(Icons.info, color: Colors.white),
              title: Text('About App', style: TextStyle(color: Colors.white)),
              onTap: () {},
            ),
          ),
          SizedBox(height: 20),

          // Card for Grading
          Card(
            color: Theme.of(context).focusColor,
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            child: ListTile(
              leading: Icon(Icons.grade, color: Colors.white),
              title: Text('Grading', style: TextStyle(color: Colors.white)),
              onTap: () {},
            ),
          ),
          Spacer(),
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) => Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: _tlAlignAnim.value,
                    end: _brAlignAnim.value,
                    colors: [
                      Colors.red,
                      Colors.blueAccent,
                    ],
                  ),
                  shape: BoxShape.circle),
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: _tlAlignAnim.value,
                      end: _brAlignAnim.value,
                      colors: [
                        Colors.blueAccent,
                        Colors.red,
                      ],
                    ),
                    color: Theme.of(context).focusColor,
                    shape: BoxShape.circle),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    size: height * 0.06,
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
