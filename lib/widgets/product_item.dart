import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key, required this.name, required this.image, required this.price, required this.onTap,});
  final String name;
  final String image;
  final String price;
  final void Function() onTap;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: onTap,
                    child: Container(
                      height: 255,
                      width: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Color(0xffECECEC)
                      ),
                      child: Image.asset(image),
                    ),
                  ),
                  Gap(10),
                   Text(name ,maxLines: 1, style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400
                  ),),
                  Gap(10),
                   Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
                    children: [
                       Text('€$price' , style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold
                      ),),
                      Icon(Icons.favorite_border)
                    ],
                  ),
                ],
              ),
    );
  }
}