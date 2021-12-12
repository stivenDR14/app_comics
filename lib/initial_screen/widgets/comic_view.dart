import 'package:app_comics/models/general_comics_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ComicView extends StatelessWidget {
  const ComicView({Key? key, required this.mediaQuery, required this.itemComic, required this.isGrid }) : super(key: key);

  final Size mediaQuery;
  final GeneralComicsList itemComic;
  final bool isGrid;

  void goDetail(BuildContext context){
    Navigator.pushNamed(context, '/Detail', arguments: itemComic.apiDetailUrl);
  }

  @override
  Widget build(BuildContext context) {
    return Container(

      padding: const EdgeInsets.all(15.0),
      child: isGrid? InkWell(
        onTap: () => goDetail(context),
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                ),
                child: Image.network(
                    itemComic.image!["icon_url"],
                    fit:BoxFit.fill

                ),
              ),
            ),
            Expanded(
                flex: 1,
                child: Text(" ${itemComic.apiDetailUrl!="" ?itemComic.volume!["name"]: "---"}",style: Theme.of(context).textTheme.bodyText1)),
          ],
        ),
      ):Card(
        color:Theme.of(context).splashColor,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8.0))),
        child: InkWell(
          onTap: () => goDetail(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,  // add this
            children: <Widget>[
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  topRight: Radius.circular(8.0),
                ),
                child: Image.network(
                    itemComic.image!["icon_url"],
                    // width: 300,
                    height: 150,
                    fit:BoxFit.fill

                ),
              ),
              ListTile(
                subtitle: Text(" ${itemComic.apiDetailUrl!="" ?itemComic.volume!["name"]: "---"}",style: Theme.of(context).textTheme.headline2),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
