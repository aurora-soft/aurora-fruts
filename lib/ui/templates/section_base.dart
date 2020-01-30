import 'package:flutter/material.dart';
import 'package:aurora_fruts/ui/common_widgets/titlesBar.dart' as commonBar;

class SectionBase extends StatelessWidget {
  final Widget body;
  final String title;
  final String subtitle;
  final bool defaultPadding;
  final bool backButton;

  SectionBase(
      {@required this.body,
      @required this.subtitle,
      @required this.title,
      this.defaultPadding = true,
      this.backButton = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(
          right: defaultPadding ? 16.0 : 0.0,
          left: defaultPadding ? 16.0 : 0.0,
          top: MediaQuery.of(context).padding.top + 24.0),
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(
              right: !defaultPadding ? 16.0 : 0.0,
              left: !defaultPadding ? 16.0 : 0.0,
            ),
            child: Row(
              children: <Widget>[
                backButton
                    ? Padding(
                        padding: EdgeInsets.only(right: 8.0),
                        child: IconButton(
                          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                          onPressed: () => Navigator.pop(context),
                        ),
                      )
                    : SizedBox(),
                commonBar.TitlesBar(h1: title ?? '', h2: subtitle),
              ],
            ),
          ),
          SizedBox(height: 32.0),
          Expanded(child: body),
        ],
      ),
    );
  }
}
