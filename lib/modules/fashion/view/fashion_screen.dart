import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iroid/constants/app_colors.dart';
import 'package:iroid/constants/app_strings.dart';
import 'package:iroid/modules/fashion/controller/fashion_controller.dart';

class FashionScreen extends StatelessWidget {
  FashionScreen({super.key});
  final fashionController = Get.find<FashionController>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 54, 26, 59),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
          ),
        ),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),

            // color: AppColors.appBarBackgroundLight,
          ),
        ),
        centerTitle: false,
        actionsPadding: EdgeInsets.only(right: 16),
        leading: Icon(Icons.arrow_back_ios, color: AppColors.secondary),

        bottom: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight * 3),
          child: Container(
            color: const Color.fromARGB(255, 54, 26, 59),
            // height: size.width,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                        radius: size.width * 0.1,
                        backgroundImage: NetworkImage(
                          fashionController
                              .fashionData
                              .value
                              .tailorNearYou!
                              .profile!
                              .image!,
                        ),
                      ),
                      Visibility(
                        visible: fashionController
                            .fashionData
                            .value
                            .tailorNearYou!
                            .profile!
                            .hasFollowButton!,
                        child: Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: WidgetStatePropertyAll(
                                  AppColors.secondary,
                                ),
                              ),
                              onPressed: () {},
                              child: Text(AppStrings.follow),
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: fashionController
                            .fashionData
                            .value
                            .tailorNearYou!
                            .profile!
                            .hasLikeButton!,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: CircleAvatar(
                            backgroundColor: AppColors.secondary,
                            radius: size.width * 0.05,

                            child: Icon(Icons.favorite_border),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: fashionController
                            .fashionData
                            .value
                            .tailorNearYou!
                            .profile!
                            .hasShareButton!,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: CircleAvatar(
                            backgroundColor: AppColors.secondary,
                            radius: size.width * 0.05,

                            child: Icon(Icons.share_outlined),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // SizedBox(height: 8,),
                Container(
                  color: Colors.black,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              fashionController
                                  .fashionData
                                  .value
                                  .tailorNearYou!
                                  .profile!
                                  .name!,
                              style: TextStyle(
                                fontSize: 20,

                                color: AppColors.secondary,
                              ),
                            ),
                            Text(
                              fashionController
                                  .fashionData
                                  .value
                                  .tailorNearYou!
                                  .profile!
                                  .designation!,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: AppColors.secondary,
                              ),
                            ),
                          ],
                        ),
                        Visibility(
                          visible: fashionController
                              .fashionData
                              .value
                              .tailorNearYou!
                              .profile!
                              .viewMore!,
                          child: Text(
                            AppStrings.viewMore,
                            style: TextStyle(color: AppColors.secondary),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        elevation: 5,
        shadowColor: AppColors.secondary,
        // backgroundColor: AppColors.scaffoldBackgroundLight,
        // backgroundColor: AppColors.appBarBackgroundLight,
      ),
    );
  }
}
