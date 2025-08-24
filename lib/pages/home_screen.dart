import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:runway_app/models/category_model.dart';
import 'package:runway_app/pages/categories_screen.dart';
import 'package:runway_app/widgets/CustomBottomNavBar.dart';
import 'package:runway_app/widgets/category.dart';
import 'package:runway_app/widgets/custom_app_bar.dart';
import 'package:video_player/video_player.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
  
}

class _HomeScreenState extends State<HomeScreen> {
  late VideoPlayerController _controller;
  @override
  void initState() {
    _controller = VideoPlayerController.asset(
      'assets/video/video.mp4',
    )..initialize().then((_){
      setState(() {
        _controller.play();
      });
    })..setLooping(true);
    super.initState();
  }
  List <CategoryModel> category =[
    CategoryModel(
      title: 'Men',
      image: 'assets/categories/Men.png'),
    CategoryModel(
      title: 'Women',
      image: 'assets/categories/Women.png'),
    CategoryModel(
      title: 'Kids',
      image: 'assets/categories/Kids.png'),
    CategoryModel(
      title: 'Deals',
      image: 'assets/categories/Deals.png'),
    CategoryModel(
      title: 'Home',
      image: 'assets/categories/Home.png'),
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    appBar:const  CustomAppBar(
      prefix:'assets/svgs/menu.svg' ,
      title: 'Runway' ,
      suffix: 'assets/svgs/notification.svg',
    ),
    body: SingleChildScrollView(
      child: Stack(
        children: [
          VideoPlayer(_controller),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              width: double.infinity,
              height: 220,
              decoration: BoxDecoration(
                color: Colors.white
              ),
              child:  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(10),
                  Padding(
                    padding: const EdgeInsets.only(left:8.0),
                    child: Text('Category', style: GoogleFonts.inter(
                      textStyle: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600
                      )
                    )),
                  ),
                  Gap(15),
                   SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                     child: Row(
                      children: List.generate(
                        category.length , (index){
                          final item = category[index];
                          return Padding(
                            padding: const EdgeInsets.only(left: 16),
                            child: Category(
                              onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return CategoriesScreen();
                                  }));
                                },
                              title: item.title,
                              image: item.image,
                              ),
                          );
                        }
                      ),
                                     ),
                   ),
                   Gap(5),
                   CustomBottomNavBar(),
                ],
              ),
            ),
          )
        ],
      ),
    )
    );
  }
}