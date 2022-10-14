import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class ImageSlide extends StatelessWidget {
  const ImageSlide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ImageSlideshow(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 3,
      initialPage: 0,
      indicatorColor: const Color(0xff670374),
      indicatorBackgroundColor: Colors.white,
      autoPlayInterval: 3000,
      isLoop: true,
      children: [
        Image.network(
          'https://media.cntraveler.com/photos/5fc6818f3cfe1de2cab79372/master/w_2580%2Cc_limit/Amsterdam-GettyImages-840603854.jpg',
          fit: BoxFit.fill,
        ),
        Image.network(
          'https://www.intelligentcitieschallenge.eu/sites/default/files/styles/teaser_lg_2x/public/2022-09/photo-1451976426598-a7593bd6d0b2%20%281%29.jpg?itok=p2rAlJmL',
          fit: BoxFit.fill,
        ),
        Image.network(
          'https://media.cntraveler.com/photos/5fc6818f3cfe1de2cab79372/master/w_2580%2Cc_limit/Amsterdam-GettyImages-840603854.jpg',
          fit: BoxFit.fill,
        ),
        Image.network(
          'https://www.intelligentcitieschallenge.eu/sites/default/files/styles/teaser_lg_2x/public/2022-09/photo-1451976426598-a7593bd6d0b2%20%281%29.jpg?itok=p2rAlJmL',
          fit: BoxFit.fill,
        ),
        Image.network(
          'https://media.cntraveler.com/photos/5fc6818f3cfe1de2cab79372/master/w_2580%2Cc_limit/Amsterdam-GettyImages-840603854.jpg',
          fit: BoxFit.fill,
        ),
        Image.network(
          'https://www.intelligentcitieschallenge.eu/sites/default/files/styles/teaser_lg_2x/public/2022-09/photo-1451976426598-a7593bd6d0b2%20%281%29.jpg?itok=p2rAlJmL',
          fit: BoxFit.fill,
        ),
        Image.network(
          'https://media.cntraveler.com/photos/5fc6818f3cfe1de2cab79372/master/w_2580%2Cc_limit/Amsterdam-GettyImages-840603854.jpg',
          fit: BoxFit.fill,
        ),
        Image.network(
          'https://www.intelligentcitieschallenge.eu/sites/default/files/styles/teaser_lg_2x/public/2022-09/photo-1451976426598-a7593bd6d0b2%20%281%29.jpg?itok=p2rAlJmL',
          fit: BoxFit.fill,
        ),
      ],
    );
  }
}
