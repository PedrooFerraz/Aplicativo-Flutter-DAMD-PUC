import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:aplicativo_flutter_damd_puc/core/app_icon.dart';
import 'package:aplicativo_flutter_damd_puc/core/app_color.dart';
import 'package:aplicativo_flutter_damd_puc/src/model/food.dart';
import 'package:aplicativo_flutter_damd_puc/core/app_extension.dart';
import 'package:aplicativo_flutter_damd_puc/src/view/widget/counter_button.dart';
import 'package:aplicativo_flutter_damd_puc/src/controller/food_controller.dart';
import 'package:aplicativo_flutter_damd_puc/src/view/widget/scale_animation.dart';

final FoodController controller = Get.put(FoodController());

class FoodDetailScreen extends StatelessWidget {
  const FoodDetailScreen({
    super.key,
    required this.food,
  });

  final Food food;

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      title: Text(
        "DETALHES DO PRODUTO",
        style: TextStyle(
          color: controller.isLightTheme ? Colors.black : Colors.white,
        ),
      ),
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_vert),
        )
      ],
    );
  }

  Widget fab(VoidCallback onPressed) {
    return FloatingActionButton(
      elevation: 0.0,
      backgroundColor: const Color.fromARGB(255, 253, 41, 41),
      onPressed: onPressed,
      child: food.isFavorite ? const Icon(AppIcon.heart) : const Icon(AppIcon.outlinedHeart),
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = context.height;
    double width = context.width;

    return Scaffold(
      appBar: _appBar(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: GetBuilder(builder: (FoodController foodController) {
        return fab(() => foodController.isFavoriteFood(food));
      }),
      bottomNavigationBar: BottomAppBar(
        height: height * 0.6,
        color: Colors.transparent,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              decoration: BoxDecoration(
                color: controller.isLightTheme ? Colors.white : DarkThemeColor.primaryLight,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          RatingBar.builder(
                            itemPadding: EdgeInsets.zero,
                            itemSize: 20,
                            initialRating: food.score,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            glow: false,
                            ignoreGestures: true,
                            itemBuilder: (_, __) => const FaIcon(
                              FontAwesomeIcons.solidStar,
                              color: Color.fromARGB(255, 255, 73, 73),
                            ),
                            onRatingUpdate: (rating) {},
                          ),
                          const SizedBox(width: 15),
                          Text(
                            food.score.toString(),
                            style: context.titleMedium,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            "(${food.voter})",
                            style: context.titleMedium,
                          )
                        ],
                      ).fadeAnimation(0.4),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "R\$${food.price}",
                            style: context.displayLarge.copyWith(
                              color: const Color.fromARGB(255, 253, 41, 41),
                            ),
                          ),
                          GetBuilder(
                            builder: (FoodController foodController) {
                              return CounterButton(
                                onIncrementSelected: () => foodController.increaseItem(food),
                                onDecrementSelected: () => foodController.decreaseItem(food),
                                label: Text(
                                  food.quantity.toString(),
                                  style: context.displayLarge,
                                ),
                              );
                            },
                          )
                        ],
                      ).fadeAnimation(0.6),
                      const SizedBox(height: 15),
                      Text(
                        "DESCRIÇÃO",
                        style: context.displayMedium,
                      ).fadeAnimation(0.8),
                      const SizedBox(height: 15),
                      Text(
                        food.description,
                        style: context.titleMedium,
                      ).fadeAnimation(0.8),
                      const SizedBox(height: 70),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
                bottom: 10,
                left: width * 0.1,
                right: width * 0.1,
                child: SizedBox(
                  width: width,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () => controller.addToCart(food),
                    child: Text(
                      "Adicionar ao Carrinho",
                      style: TextStyle(
                        color: controller.isLightTheme ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),
      body: ScaleAnimation(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Image.asset(food.image, scale: 0.6),
          ),
        ),
      ),
    );
  }
}
