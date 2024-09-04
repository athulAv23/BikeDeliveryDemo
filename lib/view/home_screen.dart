import 'package:bikeapp/controller/bikeorder_controller.dart';
import 'package:bikeapp/controller/login_controller.dart';
import 'package:bikeapp/view/cart_screen.dart';
import 'package:bikeapp/widgets/mediaquery.dart';
import 'package:bikeapp/widgets/texts.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userdetails = Provider.of<LoginController>(context);
    Provider.of<LoginController>(context).userdetails();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 60,
        leading: const Padding(
          padding: EdgeInsets.only(top: 5, left: 15),
          child: CircleAvatar(
              backgroundColor: Color.fromARGB(255, 25, 30, 54),
              child: Icon(
                Icons.person,
                color: Colors.white,
              )),
        ),
        title: boldtext(userdetails.username!, 16),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => CartScreen(
                        email: userdetails.useremail!,
                        name: userdetails.username!,
                        phone: userdetails.usernumber!,
                      )));
            },
            icon: const Icon(
              Icons.shopping_cart,
              size: 29,
            ),
            color: const Color.fromARGB(255, 25, 30, 54),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8, left: 2),
              child: boldtext("Most popular", 20),
            ),
            Consumer<BikeOrderController>(
              builder: (context, value, child) {
                return ListView.builder(
                  shrinkWrap: true,
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
                                            value.newmodel[index].bikeimage),
                                        fit: BoxFit.fill),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      value.newmodel[index].bikename,
                                      style: const TextStyle(
                                          color: Color.fromRGBO(
                                              113, 117, 136, 0.612),
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    boldtext(
                                        value.newmodel[index].bikemodel, 17),
                                    Text(
                                      "Rs.${value.newmodel[index].bikeprice}",
                                      style: const TextStyle(
                                          color:
                                              Color.fromARGB(255, 20, 129, 76),
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            IconButton(
                              onPressed: () {
                                value.orderbike(value.newmodel[index], context);
                              },
                              icon: const Icon(Icons.shopping_cart),
                              color: const Color.fromARGB(255, 25, 30, 54),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: value.newmodel.length,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
