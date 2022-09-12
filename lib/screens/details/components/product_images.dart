import 'package:flutter/material.dart';
import '../../../models/home.dart';
import '../../../shared/size_config.dart';

class ProductImages extends StatelessWidget {
  const ProductImages({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductModel product;
  @override


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: getProportionateScreenWidth(238),
          child: AspectRatio(
            aspectRatio: 1,
            child: Hero(
              tag: product.id.toString(),
              child: Image(
                image: NetworkImage(
                    product.image!,
                ),
              ),
            ),
          ),
        ),
        // SizedBox(height: getProportionateScreenWidth(20)),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     ...List.generate(product.images!.length,
        //             (index) => buildSmallProductPreview(index)),
        //   ],
        // )
      ],
    );
  }

  // GestureDetector buildSmallProductPreview(int index) {
  //   return GestureDetector(
  //     onTap: () {
  //       setState(() {
  //         selectedImage = index;
  //       });
  //     },
  //     child: AnimatedContainer(
  //       duration: defaultDuration,
  //       margin: const EdgeInsets.only(right: 15),
  //       padding: const EdgeInsets.all(8),
  //       height: getProportionateScreenWidth(48),
  //       width: getProportionateScreenWidth(48),
  //       decoration: BoxDecoration(
  //         color: Colors.white,
  //         borderRadius: BorderRadius.circular(10),
  //         border: Border.all(
  //             color: kPrimaryColor.withOpacity(selectedImage == index ? 1 : 0)),
  //       ),
  //       child: Image.asset(widget.product.images![index]),
  //     ),
  //   );
  // }

}