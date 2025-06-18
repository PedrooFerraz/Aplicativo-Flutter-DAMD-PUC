import 'package:flutter/material.dart';
import 'package:aplicativo_flutter_damd_puc/core/app_asset.dart';
import 'package:aplicativo_flutter_damd_puc/core/app_extension.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(30),
            child: Image.asset(AppAsset.profileImage, width: 300),
          ),
          Text(
            "Hello User!",
            style: context.displayLarge,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppAsset.githubImage, width: 60),
              const SizedBox(width: 10),
              Text(
                style: context.displaySmall,
              )
            ],
          )
        ],
      ),
    );
  }
}
