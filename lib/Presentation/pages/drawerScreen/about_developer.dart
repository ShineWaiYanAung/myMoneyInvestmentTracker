import "package:flutter/material.dart";
import "package:lottie/lottie.dart";
class AboutDeveloper extends StatelessWidget {
  const AboutDeveloper({super.key});

  @override
  Widget build(BuildContext context) {
    final widht = MediaQuery.of(context).size.width;
    final height= MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor:Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 30,
            color: Colors.white,
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: const Text(
          "About App Creator",
          style: TextStyle(
            fontFamily: 'Jersey',
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.w400,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,

          children: <Widget>[
            SizedBox(
              width: widht *0.6,
              height: height *0.4,
              child: Lottie.asset('asset/jsonAnimation/developer.json'),),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  buildDeveloperInfro('App Creator','Shine Wai Yan Aung'),
                  const SizedBox(height: 40,),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 50,
                    horizontal: 50),
                width: widht,
                alignment: Alignment.topCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                        onTap: (){
                          showQRDialog(context, "Developer's Telegram Account", "asset/SocialIcon/telegramQr.jpg");
                        },
                        child: SizedBox(

                          width :100,
                          child: Image.asset(
                              "asset/SocialIcon/telegramIcon.png"),
                        )),
                    InkWell(
                      onTap: (){
                        showQRDialog(context, "Developer's Viber Account", "asset/SocialIcon/viberQr.png");

                      },
                      child: Image.asset(
                          width :100,
                          "asset/SocialIcon/viberIcon.png"),
                    )
                  ],
                ),
              ),
            )


          ],
        ),
      ),

    );
  }

  Row buildDeveloperInfro(String title,String subtitle) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width :120,
          child: Text(title,
            style: const TextStyle(
                  fontFamily: "Jersey",
                  fontSize: 22,
                color: Colors.black45,
                fontWeight: FontWeight.bold
            ),),
        ),
        Text(subtitle, style: const TextStyle(
            fontSize: 20,
            fontFamily: "Jersey",
            fontWeight: FontWeight.w500,
            color: Colors.black45

        ),)

      ],
    );
  }

  void showQRDialog(BuildContext context, String title, String path) {
    showDialog(
      context: context,
      barrierDismissible: true, // Allows the dialog to be dismissed by tapping outside
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          titleTextStyle: TextStyle(color: Theme.of(context).scaffoldBackgroundColor,fontFamily: "Jersey",fontSize: 25),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                path, // Replace with your QR code image URL or asset

              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
              },
              child: Text('Close',style: TextStyle(color: Theme.of(context).scaffoldBackgroundColor,fontSize: 20,fontFamily: "Jersey"),),
            ),
          ],
        );
      },
    );
  }
}
