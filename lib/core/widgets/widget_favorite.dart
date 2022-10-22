import 'package:flutter/material.dart';

import '../core.dart';

class WidgetFavorite extends StatefulWidget {
  final bool isFavorite;
  final Function(bool value)? onFavoriteChanged;

  const WidgetFavorite({Key? key, required this.isFavorite, this.onFavoriteChanged}) : super(key: key);

  @override
  _WidgetFavoriteState createState() => _WidgetFavoriteState();
}

class _WidgetFavoriteState extends State<WidgetFavorite> {
  late bool isFavorite;

  @override
  void initState() {
    isFavorite = widget.isFavorite;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 24,
      width: 24,
      child: IconButton(
        padding: EdgeInsets.zero,
        splashRadius: 24,
        icon: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border,
          color: widget.isFavorite ? kRedColor : kPrimaryColor,
          size: 24,
        ),
        onPressed: _onClickFavoriteButton,
      ),
    );
  }

  void _onClickFavoriteButton() {
    setState(() {
      isFavorite = !isFavorite;
      widget.onFavoriteChanged?.call(isFavorite);
    });
  }
}
