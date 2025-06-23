import 'package:flutter/material.dart';
import 'package:aplicativo_flutter_damd_puc/core/app_icon.dart';
import 'package:aplicativo_flutter_damd_puc/core/app_asset.dart';
import 'package:aplicativo_flutter_damd_puc/src/model/food.dart';
import 'package:aplicativo_flutter_damd_puc/src/model/food_category.dart';
import 'package:aplicativo_flutter_damd_puc/src/model/bottom_navigation_item.dart';

class AppData {
  const AppData._();

static List<Food> foodItems = [
  // Categoria: Lanches
  Food(
    AppAsset.batataFrita,
    "Batata Frita",
    12.0,
    1,
    false,
    "Batatas fritas super crocantes e douradas, servidas com nosso molho especial para tornar cada mordida única.",
    4.7,
    FoodType.lanches,
    250,
  ),
  Food(
    AppAsset.cachorroQuente,
    "Cachorro-Quente",
    15.0,
    1,
    false,
    "Pão super macio recheado com salsicha suculenta, crocante batata palha, molho de tomate fresquinho e um toque especial de mostarda. Sabor que conquista de primeira mordida!",
    4.3,
    FoodType.lanches,
    190,
  ),
  Food(
    AppAsset.hamburguer,
    "Hambúrguer Artesanal",
    22.0,
    1,
    false,
    "Carne suculenta e grelhada na medida, queijo derretido que abraça cada mordida, alface fresquinha, tomate maduro e o molho exclusivo da casa que dá aquele toque especial. Uma experiência de sabor única!",
    4.8,
    FoodType.lanches,
    300,
  ),
    // Categoria: Frutas

  Food(
    AppAsset.abacaxi,
    "Abacaxi Fresco",
    8.0,
    1,
    false,
    "Fatias suculentas de abacaxi maduro, com doçura natural e textura crocante, perfeitas para uma sobremesa leve e refrescante.",
    4.6,
    FoodType.frutas,
    120,
  ),

  // Categoria: Pratos
  Food(
    AppAsset.lasanha,
    "Lasanha à Bolonhesa",
    28.0,
    1,
    false,
    "Camadas generosas de massa fresca, carne moída suculenta, molho de tomate caseiro e queijo gratinado, derretendo e dourado na medida certa. Uma explosão de sabor em cada garfada!",
    4.9,
    FoodType.pratos,
    275,
  ),
  Food(
    AppAsset.omelete,
    "Omelete de Queijo",
    18.0,
    1,
    false,
    "Omelete fofinha com queijo derretido e temperos frescos.",
    4.4,
    FoodType.pratos,
    150,
  ),
  Food(
    AppAsset.pizza,
    "Pizza de Calabresa",
    32.0,
    1,
    false,
    "Massa crocante, molho de tomate, calabresa fatiada e cebola roxa.",
    4.7,
    FoodType.pratos,
    310,
  ),
  Food(
    AppAsset.salada,
    "Salada Verde",
    14.0,
    1,
    false,
    "Mix de folhas verdes, tomate cereja, pepino e molho vinagrete.",
    4.5,
    FoodType.pratos,
    130,
  ),

  // Categoria: Sobremesas
  Food(
    AppAsset.chesscakeMorango,
    "Cheesecake de Morango",
    20.0,
    1,
    false,
    "Base crocante de biscoito, creme leve de queijo e calda de morangos frescos.",
    4.9,
    FoodType.sobremesas,
    220,
  ),
  Food(
    AppAsset.sorvete,
    "Taça de Sorvete",
    16.0,
    1,
    false,
    "Duas bolas de sorvete com cobertura de chocolate e granulado colorido.",
    4.6,
    FoodType.sobremesas,
    180,
  ),
  Food(
    AppAsset.donut,
    "Donut de Chocolate",
    10.0,
    1,
    false,
    "Rosquinha fofa coberta com calda de chocolate e granulados crocantes.",
    4.4,
    FoodType.sobremesas,
    160,
  ),

  // Categoria: Pastelaria
  Food(
    AppAsset.croissant,
    "Croissant Manteiga",
    12.0,
    1,
    false,
    "Massa folhada leve e crocante, com sabor amanteigado irresistível.",
    4.7,
    FoodType.pastelaria,
    140,
  ),
];

  static List<BottomNavigationItem> bottomNavigationItems = [
    BottomNavigationItem(
      const Icon(Icons.home_outlined),
      const Icon(Icons.home),
      'Home',
      isSelected: true,
    ),
    BottomNavigationItem(
      const Icon(Icons.shopping_cart_outlined),
      const Icon(Icons.shopping_cart),
      'Carrinho de Compras',
    ),
    BottomNavigationItem(
      const Icon(AppIcon.outlinedHeart),
      const Icon(AppIcon.heart),
      'Favoritos',
    ),
    BottomNavigationItem(
      const Icon(Icons.person_outline),
      const Icon(Icons.person),
      'Perfil',
    )
  ];

  static List<FoodCategory> categories = [
    FoodCategory(FoodType.todos, true),
    FoodCategory(FoodType.lanches, false),
    FoodCategory(FoodType.pratos, false),
    FoodCategory(FoodType.sobremesas, false),
    FoodCategory(FoodType.pastelaria, false),
    FoodCategory(FoodType.frutas, false),
  ];
}
