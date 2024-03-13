import 'package:e_shop_minimal/provider/shop_provider.dart';
import 'package:e_shop_minimal/views/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final item = Provider.of<Shop>(context, listen: false);
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 237, 228, 252),
        appBar: AppBar(
          title: const Text("eShop Minimal"),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          actions: [
            InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CartScreen(),
                    )),
                child: const Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: Icon(
                    Icons.shopping_bag,
                    size: 30,
                  ),
                )),
          ],
        ),
        body: Center(
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: item.products.length,
            itemBuilder: (context, index) {
              final isInCart =
                  context.watch<Shop>().isProductInCart(item.products[index]);
              return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                margin:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
                width: MediaQuery.of(context).size.width / 1.3,
                height: MediaQuery.of(context).size.height / 2,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(item.products[index].image),
                        Text(
                          item.products[index].name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: 190,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Text(
                              item.products[index].desc,
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Rs. ${item.products[index].price}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            isInCart
                                ? item.removeFromCart(item.products[index])
                                : item.addToCart(item.products[index]);
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                duration: const Duration(seconds: 1),
                                content: isInCart
                                    ? Text("$item is removed to cart!")
                                    : Text("$item is added to cart!")));
                          },
                          child: isInCart
                              ? Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: const Icon(
                                    Icons.check,
                                    color: Colors.white,
                                  ),
                                )
                              : Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.white,
                                  ),
                                ),
                        )
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ));
  }
}
