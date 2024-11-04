import 'package:flutter/material.dart';
import 'package:money_investment_track/Presentation/widgets/back_button.dart';

class CurrencyDetailData extends StatefulWidget {
  final String currencyName;
  final String path;
  const CurrencyDetailData({super.key, required this.currencyName, required this.path});

  @override
  State<CurrencyDetailData> createState() => _CurrencyDetailDataState();
}

class _CurrencyDetailDataState extends State<CurrencyDetailData> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        onPressed: (){},child: Icon(Icons.add,color: Colors.white,size: 30,),),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: BackButtonWidget(isColorChange: true, currencyName: widget.currencyName),
            ),
            SizedBox(
              width: width * 0.5,
              height: height * 0.24,
              child: Image.asset(
                widget.path,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: width * 0.9,
              height: height * 0.07,
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Theme.of(context).focusColor,
                  borderRadius: BorderRadius.circular(30)),
              child: Row(
                children: [
                  IconButton(
                    ///Needed To Implement
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                  Text(
                    "Search....",
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.5),
                        fontFamily: "Jersey",
                        fontWeight: FontWeight.w100,
                        fontSize: 30,
                        letterSpacing: 2),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 40, right: 40, left: 40),
                decoration: BoxDecoration(
                  color: Theme.of(context).focusColor,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(100),
                    topLeft: Radius.circular(100),
                  ),
                ),
                child: ListView.builder(itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: Card(
                      shadowColor: Color(0xff1C2242),
                      elevation: 6,
                      color: Colors.white,
                      child: ListTile(
                        onTap: () {},
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        leading: CircleAvatar(
                          backgroundColor: Theme.of(context).focusColor,
                          child: const Text(
                            "1",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        title: Row(
                          children: [
                            Text(
                              "TON",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context).focusColor),
                            ),
                            SizedBox(
                              width: 50,
                            ),
                            Text(
                              "3",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Theme.of(context).focusColor),
                            )
                          ],
                        ),
                        subtitle: Text("MMK 4500",style: TextStyle(color: Colors.black.withOpacity(0.7),fontWeight: FontWeight.w500),),
                        trailing: IconButton(

                            ///Need To Do
                            onPressed: () {},
                            icon: Icon(
                              Icons.delete,
                              color: Colors.red,
                            )),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
