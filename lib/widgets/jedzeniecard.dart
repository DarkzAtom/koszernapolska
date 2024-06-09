import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';

class JedzenieCard extends StatefulWidget {
  const JedzenieCard({
    super.key,
    this.backgroundColor,
    required this.label,
    this.fontSize,
    required this.imageLink,
    this.isAssetImage = false,
  });

  final Color? backgroundColor;
  final String label;
  final double? fontSize;
  final String imageLink;
  final bool isAssetImage;

  @override
  State<JedzenieCard> createState() => _JedzenieCardState();
}

class _JedzenieCardState extends State<JedzenieCard> {
  @override
  Widget build(BuildContext context) {
    Widget imageWidget;

    // Determine the type of image to display
    if (widget.isAssetImage) {
      imageWidget = Image.asset(widget.imageLink);
    } else {
      imageWidget = CachedNetworkImage(
        imageUrl: widget.imageLink,
        placeholder: (context, url) => Transform.scale(scale: 0.3, child: CircularProgressIndicator()),
        errorWidget: (context, url, error) => Transform.scale(scale: 0.5, child: Image.asset('assets/defaultPictureNetworkError.png')),
      );
    }

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 1,
            child: AspectRatio(
              aspectRatio: 1 / 1,
              child: Container(
                padding: const EdgeInsets.all(8),
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(32),
                    color: const Color.fromARGB(255, 31, 31, 31),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(6, 53, 53, 53),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      color: const Color.fromARGB(255, 31, 31, 31),
                    ),
                    child: AspectRatio(
                      aspectRatio: 1 / 1,
                      child: imageWidget,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Center(
              child: SizedBox(
                height: 25,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    widget.label,
                    style: GoogleFonts.spaceGrotesk(
                      textStyle: TextStyle(
                        color: const Color.fromARGB(255, 238, 237, 237),
                        fontSize: widget.fontSize ?? 18,
                      ),
                    ),
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
