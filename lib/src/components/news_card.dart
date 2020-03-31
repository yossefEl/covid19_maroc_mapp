import 'package:corona_fighter/src/utils/colors.dart';
import 'package:corona_fighter/src/utils/config_size.dart';
import 'package:corona_fighter/src/utils/radii.dart';
import 'package:corona_fighter/src/utils/shadows.dart';
import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final String title;
  final String postDate;
  final String image;
  final String description;
  final Function onPressed;

  const PostCard(
      {Key key,
      this.title,
      this.postDate,
      this.image,
      this.description,
      this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    // print(image);

    return InkWell(
        onTap: onPressed,
        radius: 10,
        child: Container(
            height: 220,
            width: ConfigSize.screenWidth - 32,
            decoration: BoxDecoration(
                borderRadius: Radii.k10pxRadius,
                color: Colors.white,
                boxShadow: [Shadows.cardShadow]),
            margin: EdgeInsets.only(right: 8, left: 8, bottom: 8, top: 8),
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.center,
                  child: ClipRRect(
                    borderRadius: Radii.k10pxRadius,
                    child: Image.network(image,
                        width: ConfigSize.screenWidth - 16,
                        height: 220,
                        fit: BoxFit.cover,
                        frameBuilder: (context, child, frame, loaded) {
                      if (!loaded)
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      return AnimatedOpacity(
                        child: child,
                        opacity: frame == null ? 0 : 1,
                        duration: const Duration(seconds: 1),
                        curve: Curves.easeOut,
                      );
                    }),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    
                    padding: EdgeInsets.all(8),
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      boxShadow: [Shadows.appBarShadow],
                        borderRadius: Radii.k10pxRadius, color: Colors.white),
                    child: Text(postDate.substring(0, 6) ?? "20 Oct"),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white, borderRadius: Radii.k10pxRadius),
                    padding: EdgeInsets.all(5),
                    height: 70,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Container(
                            color: Colors.white,
                            height: 20,
                            child: Text(
                              title ?? "title",
                              overflow: TextOverflow.fade,
                              style: TextStyle(color: AppColors.darkPurple),
                            )),
                        Container(
                            color: Colors.white,
                            height: 40,
                            child: Text(
                              description ?? "description",
                              overflow: TextOverflow.fade,
                            )),
                      ],
                    ),
                  ),
                )
              ],
            )));
  }
}
