import 'package:e_shop_minimal/provider/shop_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  get actions => null;

  @override
  Widget build(BuildContext context) {
    final item = Provider.of<Shop>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("CART"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: item.cart.isEmpty
            ? const Center(
                child: Text("Cart Is Empty"),
              )
            : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: item.cart.length,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            SizedBox(
                                height: 100,
                                width: 100,
                                child: Image.network(item.cart[index].image)),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.cart[index].name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  "Rs. ${item.cart[index].price}",
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            InkWell(
                              onTap: () {
                                item.removeFromCart(item.cart[index]);
                              },
                              child: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.grey,
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        duration: Duration(seconds: 1),
                        content: Text(
                          "Payment Not Available",
                        ),
                        backgroundColor: Colors.red,
                        behavior: SnackBarBehavior.floating,
                      ));
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 60,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(12)),
                      child: const Text(
                        "Order Now",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
