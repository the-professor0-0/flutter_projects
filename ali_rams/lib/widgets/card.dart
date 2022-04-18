import 'package:ali_rams/screens/send_money.dart';
import 'package:ali_rams/screens/transactions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'constants.dart';

Widget sellerLocation(index, title, context) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 5),
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
    width: MediaQuery.of(context).size.width - 50,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: index % 2 == 1
              ? Constant.blueColor.withOpacity(0.5)
              : Constant.orangeColor.withOpacity(0.5),
          spreadRadius: 3,
          blurRadius: 5,
          offset: const Offset(0, 3), // changes position of shadow
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18),
        ),
        const SizedBox(
          height: 10,
        ),
        Center(
          child: Container(
            color: Colors.black,
            height: 1,
            width: MediaQuery.of(context).size.width - 70,
          ),
        ),
      ],
    ),
  );
}

Widget userCard(title, context, ind) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 5),
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
    width: MediaQuery.of(context).size.width - 50,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width - 110,
                  child: Text(
                    title,
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
                ind == 1 ? const Icon(Icons.edit_outlined) : Container(),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Center(
              child: Container(
                color: Colors.black,
                height: 1,
                width: MediaQuery.of(context).size.width - 80,
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget homeCard(title, context) {
  var img = '';
  if (title == 'Send Money') {
    img = 'assets/send.png';
  }
  if (title == 'Bank Transfer') {
    img = 'assets/withdraw.png';
  }
  if (title == 'History') {
    img = 'assets/transaction.png';
  }

  return GestureDetector(
    onTap: () {
      if (title == 'Send Money') {
        Get.to(const SendMoney());
      }
      if (title == 'Bank Transfer') {
        Get.to(const SendMoney());
      }
      if (title == 'History') {
        Get.to(const Transactions());
      }
    },
    child: Container(
      width: (MediaQuery.of(context).size.width / 3) - 20,
      height: 180,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Constant.blueColor.withOpacity(0.5),
            spreadRadius: 4,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title.toString(),
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            textAlign: TextAlign.center,
          ),
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(200),
              image: DecorationImage(
                image: AssetImage(img),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget transactionCard(inp, context) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 5),
    child: Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: 30,
              child: inp.toString() == '1'
                  ? const Icon(
                      Icons.subdirectory_arrow_left_sharp,
                      color: Colors.green,
                    )
                  : const Icon(
                      Icons.subdirectory_arrow_right_sharp,
                      color: Colors.red,
                    ),
            ),
            const SizedBox(
              width: 20,
            ),
            SizedBox(
              width: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "MarkHamil",
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    "356600202036",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            const SizedBox(
              width: 50,
              child: Text(
                "Rs. 2000",
                style: TextStyle(fontSize: 14),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Center(
          child: Container(
            color: Colors.black,
            height: 0.5,
            width: MediaQuery.of(context).size.width - 80,
          ),
        ),
      ],
    ),
  );
}
