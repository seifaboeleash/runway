import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:runway_app/models/product_model.dart';
import 'package:runway_app/pages/product_details.dart';
import 'package:runway_app/widgets/category_filter.dart';
import 'package:runway_app/widgets/custom_app_bar.dart';
import 'package:runway_app/widgets/product_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});
  @override
  Widget build(BuildContext context) {
  List<ProductModel> products = [
      ProductModel(
          name: "Top Man Black",
          price: "20",
          image: "assets/images/image1.png",
      ),
      ProductModel(
          name: "Top man black with Trous..",
          price: "50",
          image: "assets/images/image2.png",
      ),
      ProductModel(
        name: "Deep gray essential regul..",
        price: "26",
        image: "assets/images/image3.png",
      ),
      ProductModel(
        name: "Gray coat and white T-sh..",
        price: "100",
        image: "assets/images/image4.png",
      ),
      ProductModel(
        name: "Deep gray essential regul..",
        price: "80",
        image: "assets/images/image5.png",
      ),
      ProductModel(
        name: "Top man black with Trous..",
        price: "40",
        image: "assets/images/image6.png",
      ),
    ];
    return  Scaffold(
      appBar:  CustomAppBar(
            prefix: 'assets/svgs/arrow-left.svg' ,
            onTap: () => Navigator.pop(context),
            title: 'Men',
            suffix: 'assets/svgs/bi_bag.svg'),
      body: Column(
        children: [
          
            const Gap(10),
            CategoryFilter(),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 3,
                childAspectRatio: 1/1.8,
                ),
                itemCount: products.length,
                 itemBuilder: (context , index){
                  final item = products[index];
                  return ProductItem(
                    image:item.image ,
                    name: item.name,
                    price: item.price,
                    onTap: () => Navigator.push(context , MaterialPageRoute(builder: (c)=> ProductDetails(item: item))),
                  );
                 }),
            )
        ],
      )
    );
  }
}