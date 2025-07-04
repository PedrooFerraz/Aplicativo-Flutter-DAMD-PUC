import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:aplicativo_flutter_damd_puc/core/app_style.dart';
import 'package:aplicativo_flutter_damd_puc/core/app_color.dart';
import 'package:aplicativo_flutter_damd_puc/core/app_extension.dart';
import 'package:aplicativo_flutter_damd_puc/src/view/widget/empty_widget.dart';
import 'package:aplicativo_flutter_damd_puc/src/view/widget/counter_button.dart';
import 'package:aplicativo_flutter_damd_puc/src/controller/food_controller.dart';

final FoodController controller = Get.put(FoodController());

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const FaIcon(FontAwesomeIcons.dice),
        onPressed: controller.changeTheme,
      ),
      title: Text(
        "Carrinho",
        style: context.displayMedium,
      ),
    );
  }

  Widget _bottomAppBar(double height, double width, BuildContext context) {
    return BottomAppBar(
      child: SizedBox(
        height: height * 0.32,
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Subtotal",
                          style: context.headlineSmall,
                        ),
                        Obx(() {
                          return Text(
                            "R\$ ${controller.subtotalPrice.value}",
                            style: context.displayMedium,
                          );
                        }),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Taxas",
                          style: context.headlineSmall,
                        ),
                        Text(
                          "R\$ ${5.00}",
                          style: context.displayMedium,
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Divider(thickness: 4.0, height: 30.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total",
                          style: context.displayMedium,
                        ),
                        Obx(() {
                          return Text(
                            controller.totalPrice.value == 5.0 ? "\$0.0" : "R\$${controller.totalPrice}",
                            style: h2Style.copyWith(
                              color: Colors.red,
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text("Checkout"),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget cartListView(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(30),
      shrinkWrap: true,
      itemCount: controller.cartFood.length,
      itemBuilder: (_, index) {
        return Dismissible(
          onDismissed: (direction) {
            if (direction == DismissDirection.startToEnd) {
              controller.removeCartItemAtSpecificIndex(index);
            }
          },
          key: Key(controller.cartFood[index].name),
          background: Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                  vertical: 25,
                ),
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const FaIcon(FontAwesomeIcons.trash),
              ),
            ],
          ),
          child: Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: controller.isLightTheme ? Colors.white : DarkThemeColor.primaryLight,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(width: 20),
                Image.asset(controller.cartFood[index].image, scale: 1),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      controller.cartFood[index].name,
                      style: context.displayMedium,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      "R\$ ${controller.cartFood[index].price}",
                      style: context.headlineSmall,
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
                    CounterButton(
                      onIncrementSelected: () => controller.increaseItem(controller.cartFood[index]),
                      onDecrementSelected: () => controller.decreaseItem(controller.cartFood[index]),
                      size: const Size(24, 24),
                      padding: 0,
                      label: Text(
                        controller.cartFood[index].quantity.toString(),
                        style: context.displayMedium,
                      ),
                    ),
                    Text(
                      "R\$ ${controller.calculatePricePerEachItem(controller.cartFood[index])}",
                      style: h2Style.copyWith(color: Colors.red),
                    )
                  ],
                )
              ],
            ),
          ).fadeAnimation(index * 0.6),
        );
      },
      separatorBuilder: (_, __) => const Padding(padding: EdgeInsets.all(10)),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = context.height;
    double width = context.width;
    return Scaffold(
      bottomNavigationBar: controller.cartFood.isNotEmpty ? _bottomAppBar(height, width, context) : const SizedBox(),
      appBar: _appBar(context),
      body: EmptyWidget(
        title: "Carrinho Vazio",
        condition: controller.cartFood.isNotEmpty,
        child: SingleChildScrollView(
          child: SizedBox(
            height: height * 0.5,
            child: GetBuilder(
              builder: (FoodController controller) => cartListView(context),
            ),
          ),
        ),
      ),
    );
  }
}
