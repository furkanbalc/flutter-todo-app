import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';
import 'package:my_application/view_model/item_provider.dart';
import 'package:my_application/product/constants/app_color_constants.dart';
import 'package:my_application/product/constants/app_languages_constants.dart';
import 'package:my_application/product/constants/app_padding_constants.dart';
import 'package:my_application/widgets/card_item.dart';
import 'package:my_application/widgets/custom_appbar.dart';
import 'package:my_application/widgets/custom_fab.dart';
import 'package:my_application/widgets/custom_titles_column.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final _addTfController = TextEditingController();
  final String zImagePath = "assets/images/zzz.png";

  get addTfController => _addTfController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      // klavye açılınca ekran yukarı kaymasın
      resizeToAvoidBottomInset: false,
      appBar: customAppBar(context),
      body: Padding(
        padding: AppPaddingConstants.allPadding2x,
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: customTitleColumn(),
            ),
            Expanded(
              flex: 8,
              child: Consumer<ItemProvider>(
                builder: (context, itemData, child) {
                  if (itemData.items.isEmpty) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(zImagePath, color: AppColorConstants.greyColor),
                        const Text(
                          AppLanguagesConstants.appEmptyList,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 25,
                            color: AppColorConstants.greyColor,
                          ),
                        ),
                        const Icon(
                          FluentSystemIcons.ic_fluent_arrow_forward_filled,
                          color: AppColorConstants.greyColor,
                          size: 64,
                        ),
                      ],
                    );
                  } else {
                    return Column(
                      children: [
                        Expanded(
                          child: ListView.builder(
                            padding: AppPaddingConstants.symmetricPadding,
                            itemCount: itemData.items.length,
                            itemBuilder: (context, index) {
                              return CardItem(
                                index: index,
                                title: itemData.items[index].title,
                                isDone: itemData.items[index].isDone,
                                toggleStatus: (_) {
                                  itemData.toggleStatus(index);
                                },
                                deleteItem: (_) {
                                  itemData.deleteItem(index, itemData.items[index].title, context);
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: customFab(context, addTfController),
    );
  }
}
