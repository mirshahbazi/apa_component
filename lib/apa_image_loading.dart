import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:async';
import 'package:flutter/foundation.dart' show kIsWeb;

class ApaLoadImage extends StatefulWidget {
  final String? assetName;
  final Widget widgetDuringLoading;
  final double? width;
  final double? height;
  final Color? color;
  final BoxFit fit;
  final Alignment alignment;

  ApaLoadImage({
    required this.assetName,
    this.widgetDuringLoading = const Center(child: CircularProgressIndicator()),
    this.width,
    this.height,
    this.color,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
  });

  bool isSVG() {
    return this.assetName!.contains(".svg");
  }

  @override
  _ApaLoadImageState createState() => _ApaLoadImageState();
}

class _ApaLoadImageState extends State<ApaLoadImage> {
  bool loading = true;
  String SVG_BASE_PATH = '/apa/assets/';
  @override
  void initState() {
    loadPictures();
    super.initState();
  }

  Future<void> loadPictures() async {
    if (this.widget.isSVG()) {
      await precachePicture(
        ExactAssetPicture((SvgPicture.svgStringDecoder), this.widget.assetName!),
        null,
      );
    } else {
      await precacheImage(AssetImage(this.widget.assetName!),context);
    }
    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return this.widget.widgetDuringLoading;
    }

    return this.widget.isSVG()
        ?   SvgPicture.asset(
      this.widget.assetName!,
      width: this.widget.width,
      height: this.widget.height,
      color: this.widget.color,
      fit: this.widget.fit,
      alignment: this.widget.alignment,)

    // (kIsWeb)
    //         ? SvgPicture.asset(
    //            SVG_BASE_PATH+this.widget.assetName,
    //             width: this.widget.width,
    //             height: this.widget.height,
    //             color: this.widget.color,
    //             fit: this.widget.fit,
    //             alignment: this.widget.alignment,
    //           )
    //         : SvgPicture.asset(
    //             this.widget.assetName,
    //             width: this.widget.width,
    //             height: this.widget.height,
    //             color: this.widget.color,
    //             fit: this.widget.fit,
    //             alignment: this.widget.alignment,
    //           )
        :
    Image.asset(
      this.widget.assetName!,
      width: this.widget.width,
      height: this.widget.height,
      color: this.widget.color,
      fit: this.widget.fit,
      alignment: this.widget.alignment,
    );
  }
}
