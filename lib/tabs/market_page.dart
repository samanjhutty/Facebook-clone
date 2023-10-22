import 'package:facebook/assets/assets.dart';
import 'package:facebook/assets/dimens.dart';
import 'package:facebook/assets/strings.dart';
import 'package:facebook/model/market_model.dart';
import 'package:flutter/material.dart';

class MarketTab extends StatefulWidget {
  const MarketTab({super.key});
  @override
  State<MarketTab> createState() => _MarketTabState();
}

class _MarketTabState extends State<MarketTab> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimens.xMargin),
      child: Column(
        children: [
          pageHeader(
              title: Strings.market,
              icon: Icons.shopping_bag,
              searchOnTap: () {}),
          const Divider(thickness: 1),
          Expanded(
            child: GridView.count(
                crossAxisCount:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? 2
                        : 4,
                mainAxisSpacing: Dimens.margin,
                crossAxisSpacing: Dimens.xMargin,
                children: [
                  for (int i = 0; i < marketData.length; i++) ...[
                    InkWell(
                      borderRadius:
                          BorderRadius.circular(Dimens.miniBorderRadius),
                      onTap: marketData[i].onTap,
                      child: Card(
                        child: SingleChildScrollView(
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(4),
                                        topRight: Radius.circular(4)),
                                    child: Image.asset(marketData[i].data,
                                        fit: BoxFit.fitWidth)),
                                Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: Dimens.minMargin),
                                    child: Text(marketData[i].caption as String,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold))),
                                Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: Dimens.minMargin),
                                    child: Text(
                                      marketData[i].text as String,
                                      softWrap: true,
                                    ))
                              ]),
                        ),
                      ),
                    )
                  ]
                ]),
          ),
        ],
      ),
    );
  }
}
