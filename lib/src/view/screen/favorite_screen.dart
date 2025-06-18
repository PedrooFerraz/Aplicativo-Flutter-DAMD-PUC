import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:aplicativo_flutter_damd_puc/core/app_icon.dart';
import 'package:aplicativo_flutter_damd_puc/core/app_color.dart';
import 'package:aplicativo_flutter_damd_puc/src/model/food.dart';
import 'package:aplicativo_flutter_damd_puc/core/app_extension.dart';
import 'package:aplicativo_flutter_damd_puc/src/view/widget/empty_widget.dart';
import 'package:aplicativo_flutter_damd_puc/src/controller/food_controller.dart';

final FoodController controller = Get.put(FoodController());

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Favorite screen",
          style: context.displayMedium,
        ),
      ),
      body: EmptyWidget(
        type: EmptyWidgetType.favorite,
        title: "Empty favorite",
        condition: controller.favoriteFood.isNotEmpty,
        child: ListView.separated(
          padding: const EdgeInsets.all(15),
          itemCount: controller.favoriteFood.length,
          itemBuilder: (_, index) {
            Food food = controller.favoriteFood[index];
            return Card(
              color: controller.isLightTheme
                  ? Colors.white
                  : DarkThemeColor.primaryLight,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: ListTile(
                title: Text(
                  food.name,
                  style: context.headlineMedium,
                ),
                leading: Image.asset(food.image),
                subtitle: Text(
                  food.description,
                  overflow: TextOverflow.ellipsis,
                  style: context.bodyLarge,
                ),
                trailing: const Icon(AppIcon.heart, color: Colors.redAccent),
              ),
            ).fadeAnimation(index * 0.6);
          },
          separatorBuilder: (_, __) {
            return const Padding(padding: EdgeInsets.only(bottom: 15));
          },
        ),
      ),
    );
  }
}
