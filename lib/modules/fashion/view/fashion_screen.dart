import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
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
          child: ProfileSection(
            size: size,
            fashionController: fashionController,
          ),
        ),
        elevation: 5,
        shadowColor: AppColors.secondary,
        // backgroundColor: AppColors.scaffoldBackgroundLight,
        // backgroundColor: AppColors.appBarBackgroundLight,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 12,
                ),
                child: Text(
                  fashionController
                      .fashionData
                      .value
                      .designsByArya!
                      .sectionTitle!,
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color.fromARGB(118, 223, 222, 222),
                      AppColors.secondary,
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        fashionController
                            .fashionData
                            .value
                            .designsByArya!
                            .subtitle!,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(
                          fashionController
                              .fashionData
                              .value
                              .designsByArya!
                              .categories!
                              .length,
                          (index) => categoryWidget(
                            size: size,
                            fashionController: fashionController,
                            index: index,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      fashionController
                          .fashionData
                          .value!
                          .mostPopular!
                          .sectionTitle!,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      width: size.width,
                      height: size.height * 0.3,
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: fashionController
                            .fashionData
                            .value!
                            .mostPopular!
                            .products!
                            .length,
                        itemBuilder: (context, index) => SizedBox(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      height: size.width * 0.4,
                                      width: size.width * 0.4,
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20),
                                        ),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                            fashionController
                                                .fashionData
                                                .value
                                                .mostPopular!
                                                .products![index]
                                                .image!,
                                          ),
                                        ),
                                      ),
                                      // child: Image(image: NetworkImage(
                                      //       fashionController
                                      //           .fashionData
                                      //           .value
                                      //           .mostPopular!
                                      //           .products![0]
                                      //           .image!,
                                      //     ),),
                                    ),
                                    Positioned(
                                      top: 0,
                                      right: 0,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: CircleAvatar(
                                          backgroundColor: AppColors.secondary,
                                          radius: 10,
                                          child: Icon(
                                            Icons.favorite_border,
                                            size: 10,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: size.width * .4,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            StarRating(
                                              rating: fashionController
                                                  .fashionData
                                                  .value
                                                  .mostPopular!
                                                  .products![index]
                                                  .rating!
                                                  .toDouble(),
                                              allowHalfRating: true,
                                              size: 12,
                                              color: Colors.red,
                                            ),
                                            Text(
                                              fashionController
                                                  .fashionData
                                                  .value
                                                  .mostPopular!
                                                  .products![index]
                                                  .rating
                                                  .toString(),
                                            ),
                                            Text(
                                              "(" +
                                                  fashionController
                                                      .fashionData
                                                      .value
                                                      .mostPopular!
                                                      .products![index]
                                                      .reviewsCount
                                                      .toString() +
                                                  ")",
                                            ),
                                          ],
                                        ),
                                        Text(
                                          fashionController
                                              .fashionData
                                              .value!
                                              .mostPopular!
                                              .products![index]
                                              .name!,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        SizedBox(
                                          child: Text(
                                            fashionController
                                                .fashionData
                                                .value!
                                                .mostPopular!
                                                .products![index]
                                                .description!,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              fashionController
                                                      .fashionData
                                                      .value!
                                                      .mostPopular!
                                                      .products![index]
                                                      .currency
                                                      .toString() +
                                                  fashionController
                                                      .fashionData
                                                      .value!
                                                      .mostPopular!
                                                      .products![index]
                                                      .price
                                                      .toString(),
                                            ),
                                            SizedBox(width: 10),
                                            Text(
                                              fashionController
                                                      .fashionData
                                                      .value!
                                                      .mostPopular!
                                                      .products![index]
                                                      .currency
                                                      .toString() +
                                                  fashionController
                                                      .fashionData
                                                      .value!
                                                      .mostPopular!
                                                      .products![index]
                                                      .originalPrice
                                                      .toString(),
                                              style: TextStyle(
                                                color: AppColors.grey,
                                                decoration:
                                                    TextDecoration.lineThrough,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              //all time fav
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                        fashionController
                            .fashionData
                            .value!
                            .allTimeFav!
                            .sectionTitle!,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                ),
            //all time fav
            
              AllTimeFavWidget(
                size: size,
                fashionController: fashionController,
              ),
           //lahenga 
              Container(
                height: size.width*.6,
                decoration: BoxDecoration(
                 
                  image: DecorationImage(
                    alignment: Alignment.topCenter,
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      fashionController
                          .fashionData
                          .value!
                          .lehenga!
                          .banner!
                          .image!,
                    ),
                  ),
                ),
              ),
            
            
             //Top Saled
             
               Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 12),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [const Color.fromARGB(255, 206, 132, 219),AppColors.secondary],begin: AlignmentDirectional.bottomCenter,end: AlignmentDirectional.topCenter),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        fashionController
                            .fashionData
                            .value!
                            .topSaled!
                            .sectionTitle!,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        width: size.width,
                        height: size.height * 0.3,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: fashionController
                              .fashionData
                              .value!
                              .topSaled!
                              .products!
                              .length,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                            decoration: BoxDecoration(
                                color: AppColors.secondary,
                              borderRadius: BorderRadius.all(Radius.circular(20))),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        height: size.width * 0.4,
                                        width: size.width * 0.4,
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20),
                                          ),
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                              fashionController
                                                  .fashionData
                                                  .value
                                                  .topSaled!
                                                  .products![index]
                                                  .image!,
                                            ),
                                          ),
                                        ),
                                        // child: Image(image: NetworkImage(
                                        //       fashionController
                                        //           .fashionData
                                        //           .value
                                        //           .mostPopular!
                                        //           .products![0]
                                        //           .image!,
                                        //     ),),
                                      ),
                                      Positioned(
                                        top: 0,
                                        right: 0,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: CircleAvatar(
                                            backgroundColor: AppColors.secondary,
                                            radius: 10,
                                            child: Icon(
                                              Icons.favorite_border,
                                              size: 10,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: size.width * .4,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              StarRating(
                                                rating: fashionController
                                                    .fashionData
                                                    .value
                                                    .topSaled!
                                                    .products![index]
                                                    .rating!
                                                    .toDouble(),
                                                allowHalfRating: true,
                                                size: 12,
                                                color: Colors.red,
                                              ),
                                              Text(
                                                fashionController
                                                    .fashionData
                                                    .value
                                                    .topSaled!
                                                    .products![index]
                                                    .rating
                                                    .toString(),
                                              ),
                                              Text(
                                                "(" +
                                                    fashionController
                                                        .fashionData
                                                        .value
                                                        .topSaled!
                                                        .products![index]
                                                        .reviewsCount
                                                        .toString() +
                                                    ")",
                                              ),
                                            ],
                                          ),
                                          Text(
                                            fashionController
                                                .fashionData
                                                .value!
                                                .topSaled!
                                                .products![index]
                                                .name!,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(fontSize: 16),
                                          ),
                                          SizedBox(
                                            child: Text(
                                              fashionController
                                                  .fashionData
                                                  .value!
                                                  .topSaled!
                                                  .products![index]
                                                  .description!,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                fashionController
                                                        .fashionData
                                                        .value!
                                                        .topSaled!
                                                        .products![index]
                                                        .currency
                                                        .toString() +
                                                    fashionController
                                                        .fashionData
                                                        .value!
                                                        .topSaled!
                                                        .products![index]
                                                        .price
                                                        .toString(),
                                              ),
                                              SizedBox(width: 10),
                                              Text(
                                                fashionController
                                                        .fashionData
                                                        .value!
                                                        .topSaled!
                                                        .products![index]
                                                        .currency
                                                        .toString() +
                                                    fashionController
                                                        .fashionData
                                                        .value!
                                                        .topSaled!
                                                        .products![index]
                                                        .originalPrice
                                                        .toString(),
                                                style: TextStyle(
                                                  color: AppColors.grey,
                                                  decoration:
                                                      TextDecoration.lineThrough,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          
          //breezy cotton
            Container(
                height: size.width,
                decoration: BoxDecoration(
                 
                  image: DecorationImage(
                    alignment: Alignment.topCenter,
                    fit: BoxFit.fitWidth,
                    image: NetworkImage(
                      fashionController
                          .fashionData
                          .value!
                          .breezyCotton!
                          .banner!
                          .image!,
                    ),
                  ),
                ),
              ),
           //top saled
           //

               Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 12),
                child: Container(
                
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        fashionController
                            .fashionData
                            .value!
                            .topSaled!
                            .sectionTitle!,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(
                        width: size.width,
                        height: size.height * 0.3,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: fashionController
                              .fashionData
                              .value!
                              .topSaled!
                              .products!
                              .length,
                          itemBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                            decoration: BoxDecoration(
                                color: AppColors.secondary,
                              borderRadius: BorderRadius.all(Radius.circular(20))),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        height: size.width * 0.4,
                                        width: size.width * 0.4,
                                        decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(20),
                                          ),
                                          image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                              fashionController
                                                  .fashionData
                                                  .value
                                                  .topSaled!
                                                  .products![index]
                                                  .image!,
                                            ),
                                          ),
                                        ),
                                        // child: Image(image: NetworkImage(
                                        //       fashionController
                                        //           .fashionData
                                        //           .value
                                        //           .mostPopular!
                                        //           .products![0]
                                        //           .image!,
                                        //     ),),
                                      ),
                                      Positioned(
                                        top: 0,
                                        right: 0,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: CircleAvatar(
                                            backgroundColor: AppColors.secondary,
                                            radius: 10,
                                            child: Icon(
                                              Icons.favorite_border,
                                              size: 10,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: size.width * .4,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              StarRating(
                                                rating: fashionController
                                                    .fashionData
                                                    .value
                                                    .topSaled!
                                                    .products![index]
                                                    .rating!
                                                    .toDouble(),
                                                allowHalfRating: true,
                                                size: 12,
                                                color: Colors.red,
                                              ),
                                              Text(
                                                fashionController
                                                    .fashionData
                                                    .value
                                                    .topSaled!
                                                    .products![index]
                                                    .rating
                                                    .toString(),
                                              ),
                                              Text(
                                                "(" +
                                                    fashionController
                                                        .fashionData
                                                        .value
                                                        .topSaled!
                                                        .products![index]
                                                        .reviewsCount
                                                        .toString() +
                                                    ")",
                                              ),
                                            ],
                                          ),
                                          Text(
                                            fashionController
                                                .fashionData
                                                .value!
                                                .topSaled!
                                                .products![index]
                                                .name!,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(fontSize: 16),
                                          ),
                                          SizedBox(
                                            child: Text(
                                              fashionController
                                                  .fashionData
                                                  .value!
                                                  .topSaled!
                                                  .products![index]
                                                  .description!,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          ),
                                          Row(
                                            children: [
                                              Text(
                                                fashionController
                                                        .fashionData
                                                        .value!
                                                        .topSaled!
                                                        .products![index]
                                                        .currency
                                                        .toString() +
                                                    fashionController
                                                        .fashionData
                                                        .value!
                                                        .topSaled!
                                                        .products![index]
                                                        .price
                                                        .toString(),
                                              ),
                                              SizedBox(width: 10),
                                              Text(
                                                fashionController
                                                        .fashionData
                                                        .value!
                                                        .topSaled!
                                                        .products![index]
                                                        .currency
                                                        .toString() +
                                                    fashionController
                                                        .fashionData
                                                        .value!
                                                        .topSaled!
                                                        .products![index]
                                                        .originalPrice
                                                        .toString(),
                                                style: TextStyle(
                                                  color: AppColors.grey,
                                                  decoration:
                                                      TextDecoration.lineThrough,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            //floral
            
              Container(
                height: size.width,
                decoration: BoxDecoration(
                 
                  image: DecorationImage(
                    alignment: Alignment.topCenter,
                    fit: BoxFit.fitWidth,
                    image: NetworkImage(
                      fashionController
                          .fashionData
                          .value!
                          .friendlyFloral!
                          .banner!
                          .image!,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AllTimeFavWidget extends StatelessWidget {
  const AllTimeFavWidget({
    super.key,
    required this.size,
    required this.fashionController,
  });

  final Size size;
  final FashionController fashionController;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height * 0.33,
      child: Stack(
        children: [
          Column(
            children: [
              Container(height: size.height * .08, color: AppColors.secondary),
              Container(height: size.height * .23, color: Colors.purple),
            ],
          ),

          SizedBox(
            height: size.height * .3,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: fashionController
                  .fashionData
                  .value!
                  .allTimeFav!
                  .banners!
                  .length,
              itemBuilder: (context, index) => SizedBox(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Container(
                    height: size.width * 0.6,
                    width: size.width * 0.5,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                          fashionController
                              .fashionData
                              .value
                              .allTimeFav!
                              .banners![index]
                              .image!,
                        ),
                      ),
                    ),
                    // child: Image(image: NetworkImage(
                    //       fashionController
                    //           .fashionData
                    //           .value
                    //           .mostPopular!
                    //           .products![0]
                    //           .image!,
                    //     ),),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class categoryWidget extends StatelessWidget {
  const categoryWidget({
    super.key,
    required this.size,
    required this.fashionController,
    required this.index,
  });

  final Size size;
  final FashionController fashionController;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: size.width * .08,
          backgroundImage: NetworkImage(
            fashionController
                .fashionData!
                .value
                .designsByArya!
                .categories![index]
                .image!,
          ),
        ),
        SizedBox(
          width: size.width * .2,
          child: Text(
            fashionController
                .fashionData
                .value!
                .designsByArya!
                .categories![index]
                .name!,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 12,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

class ProfileSection extends StatelessWidget {
  const ProfileSection({
    super.key,
    required this.size,
    required this.fashionController,
  });

  final Size size;
  final FashionController fashionController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 54, 26, 59),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
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
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 8,
                bottom: 16,
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
    );
  }
}
