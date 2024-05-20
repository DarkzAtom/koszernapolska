import 'dart:ffi';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';

// BE SURE THAT THE LINK AND NAME ARE BOTH PROVIDED FOR EACH RESP. PICTURE! otherwise the program will throw an error



CachedNetworkImage ImageLoader(String Url) {
  return CachedNetworkImage(
    imageUrl: Url,
    placeholder: (context, url) => Transform.scale(scale: 0.3, child: CircularProgressIndicator()),
    errorWidget: (context, url, error) => Transform.scale(scale: 0.5, child: Image.asset('assets/defaultPictureNetworkError.png')),
  );
}
  

