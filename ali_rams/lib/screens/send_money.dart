import 'package:ali_rams/widgets/app_bar.dart';
import 'package:ali_rams/widgets/bottom_nav.dart';
import 'package:ali_rams/widgets/buttons.dart';
import 'package:ali_rams/widgets/constants.dart';
import 'package:ali_rams/widgets/textfields.dart';
import 'package:flutter/material.dart';

class SendMoney extends StatefulWidget {
  const SendMoney({Key? key}) : super(key: key);

  @override
  _SendMoneyState createState() => _SendMoneyState();
}

class _SendMoneyState extends State<SendMoney> {

  TextEditingController acno=TextEditingController();
  TextEditingController amount=TextEditingController();
  TextEditingController msg=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar2(),
      body: Container(
        color: Constant.blueColor,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width - 40,
                padding:
                const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Constant.blueColor.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 5,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage('assets/avatar.jpg'),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "JohnDoe",
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          "40128881881",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Container(
                      height: 30,
                      width: 1,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Current Balance",
                          style: TextStyle(fontSize: 12),
                        ),
                        Text(
                          "Rs. 1000000",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(height: 20,),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width-10,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Constant.blueColor.withOpacity(0.5),
                        spreadRadius: 4,
                        blurRadius: 5,
                        offset:
                        const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  padding:const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(200),
                              image: const DecorationImage(
                                  image: AssetImage('assets/circleAvatar.png'))),
                        ),
                        const SizedBox(height: 20,),
                        loginTextfield("Account Number", acno, Icons.person, context, false),
                        loginTextfield("Amount", amount, Icons.money, context, false),
                        loginTextfield("Message", msg, Icons.description, context, false),
                        submitButton("Send Money", context)
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: navigationBar(context, 0),
    );
  }
}
