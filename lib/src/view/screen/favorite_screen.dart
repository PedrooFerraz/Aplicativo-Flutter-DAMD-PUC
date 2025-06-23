import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:aplicativo_flutter_damd_puc/core/app_icon.dart';
import 'package:aplicativo_flutter_damd_puc/core/app_color.dart';
import 'package:aplicativo_flutter_damd_puc/src/model/food.dart';
import 'package:aplicativo_flutter_damd_puc/core/app_extension.dart';
import 'package:aplicativo_flutter_damd_puc/src/view/widget/empty_widget.dart';
import 'package:aplicativo_flutter_damd_puc/src/controller/food_controller.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FoodController controller = Get.find<FoodController>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "FAVORITOS",
          style: context.displayMedium,
        ),
      ),
      body: GetBuilder<FoodController>(
        builder: (controller) {
          return EmptyWidget(
            type: EmptyWidgetType.favorite,
            title: "Nenhum favorito encontrado",
            condition: controller.favoriteFood.isNotEmpty,
            child: _buildFavoriteList(context, controller),
          );
        },
      ),
    );
  }

  Widget _buildFavoriteList(BuildContext context, FoodController controller) {
    return ListView.separated(
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
            contentPadding: const EdgeInsets.all(10),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                food.image,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              food.name,
              style: context.headlineMedium,
            ),
            subtitle: Text(
              food.description,
              overflow: TextOverflow.ellipsis,
              style: context.bodyLarge,
            ),
            //Aqui aonde ocorre a remoção dos favoritos
            trailing: IconButton(
  icon: const Icon(AppIcon.heart, color: Colors.redAccent),
  onPressed: () {
    controller.isFavoriteFood(food);
  },
),
          ),
        ).fadeAnimation(index * 0.4);
      },
      separatorBuilder: (context, index) => const SizedBox(height: 15),
    );
  }
}
