import 'package:bikeapp/controller/bikeorder_controller.dart';
import 'package:bikeapp/controller/login_controller.dart';
import 'package:bikeapp/widgets/mediaquery.dart';
import 'package:bikeapp/widgets/texts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen(
      {super.key,
      required this.name,
      required this.email,
      required this.phone});

  final String name;
  final String email;
  final String phone;
  @override
  Widget build(BuildContext context) {
    final logout = Provider.of<LoginController>(context, listen: false);

    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: customHeight(context, 0.16),
              decoration: BoxDecoration(
                  color: const  Color.fromARGB(255, 25, 30, 54),
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const CircleAvatar(
                        radius: 35,
                        child: Icon(
                          Icons.person,
                          color:  Color.fromARGB(255, 25, 30, 54),
                          size: 45,
                        ),
                      ),
                      Text(name,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold))
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text("Email : ",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 196, 196, 196),
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold)),
                          Text(email,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold))
                        ],
                      ),
                      Row(
                        children: [
                          const Text("Phone num : ",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 196, 196, 196),
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold)),
                          Text(phone,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold))
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: boldtext("Your cart", 20),
            ),
            Expanded(
              child: Consumer<BikeOrderController>(
                builder: (context, value, child) {
                  if (value.orders.isNotEmpty) {
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 2,
                          child: SizedBox(
                            width: double.infinity,
                            height: customHeight(context, 0.15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        width: customWidth(context, 0.3),
                                        child: Image(
                                            image: AssetImage(
                                                value.orders[index].bikeimage),
                                            fit: BoxFit.fill),
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          value.orders[index].bikename,
                                          style: const TextStyle(
                                              color: Color.fromRGBO(
                                                  113, 117, 136, 0.612),
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        boldtext(
                                            value.orders[index].bikemodel, 17),
                                        Text(
                                          "Rs.${value.orders[index].bikeprice}",
                                          style: const TextStyle(
                                              color: Color.fromARGB(
                                                  255, 20, 129, 76),
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                IconButton(
                                  onPressed: () {
                                    value.removefromcart(index, context);
                                  },
                                  icon: const Icon(Icons.remove_circle),
                                  color: const  Color.fromARGB(255, 25, 30, 54),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      itemCount: value.orders.length,
                    );
                  } else {
                    return Center(
                      child: boldtext("No items", 16),
                    );
                  }
                },
              ),
            ),
            Consumer<BikeOrderController>(
              builder: (context, value, child) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Visibility(
                      visible: value.orders.isNotEmpty,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Check out",
                          style: TextStyle(
                              color:  Color.fromARGB(255, 25, 30, 54),
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        logout.logoutfunction(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const  Color.fromARGB(255, 25, 30, 54),
                      ),
                      child: const Text(
                        "Log out",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                      ),
                    ),
                  ],
                );
              },
            )
          ],
        ),
      )),
    );
  }
}