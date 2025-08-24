import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  const CustomAppBar({super.key, required this.prefix, required this.title, required this.suffix , this.onTap});
  final String prefix;
  final String title;
  final String suffix;
  final void Function()? onTap;
  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      toolbarHeight: preferredSize.height,
      leading: const SizedBox.shrink(),
      leadingWidth: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: onTap,
            child: SvgPicture.asset(prefix , width: 24,)),
          Text(title,
           style: const TextStyle(
            fontWeight: FontWeight.bold
           ),),
          SvgPicture.asset(suffix, width: 25,),
        ],
      )
    );
  }
  
}