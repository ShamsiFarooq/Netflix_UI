import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colors/colors.dart';

class VideoWidget extends StatelessWidget {
  const VideoWidget({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 200,
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
            loadingBuilder: (BuildContext _, Widget child, ImageChunkEvent? progress){
              if(progress == null){
                return child;
              }else{
                return const Center(child: CircularProgressIndicator(strokeWidth: 2,),);
              }
            },
            errorBuilder:(BuildContext _, Object a, StackTrace? trace){
              return const Icon(Icons.wifi);
            } ,
          ),
        ),
        Positioned(
          right: 10,
          bottom: 10,
          child: CircleAvatar(
            radius: 20,
            backgroundColor: Colors.transparent.withOpacity(0.3),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.volume_off,
                  size: 20,
                  color: kWhiteColor,
                )),
          ),
        ),
      ],
    );
  }
}
