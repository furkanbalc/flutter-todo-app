import 'package:flutter/material.dart';
import 'package:my_application/view_model/item_provider.dart';
import 'package:my_application/product/constants/app_icon_constants.dart';
import 'package:my_application/product/constants/app_languages_constants.dart';
import 'package:my_application/product/constants/app_padding_constants.dart';
import 'package:my_application/product/constants/app_styles_constants.dart';
import 'package:my_application/product/constants/app_value_constants.dart';
import 'package:my_application/widgets/custom_show_dialog.dart';
import 'package:my_application/widgets/dismissbg_container.dart';
import 'package:provider/provider.dart';

class CardItem extends StatefulWidget {
  CardItem({
    super.key,
    required this.index,
    required this.title,
    required this.isDone,
    required this.toggleStatus,
    required this.deleteItem,
  });

  final updateController = TextEditingController();
  final int index;
  final String title;
  final bool isDone;
  final Function(bool?) toggleStatus;
  final Function(DismissDirection) deleteItem;

  @override
  State<CardItem> createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: widget.deleteItem,
      background: dismissBgContainer(),
      key: UniqueKey(),
      child: Padding(
        padding: AppPaddingConstants.bottom10Padding,
        child: Card(
          shape: widget.isDone ? buildOutBorderSide(Colors.green) : buildOutBorderSide(Colors.white),
          elevation: widget.isDone ? AppValueConstants.minElevation : AppValueConstants.maxElevation,
          child: ListTile(
            contentPadding: AppPaddingConstants.symmetricPadding2,
            tileColor:
                widget.isDone ? Theme.of(context).listTileTheme.selectedTileColor : Theme.of(context).listTileTheme.tileColor,
            leading: listTileLeading(),
            title: listTileTitle(context),
            trailing: listTileTrailing(context),
          ),
        ),
      ),
    );
  }

  // kart check edildiyse renk ve çerçeve ekliyor
  RoundedRectangleBorder buildOutBorderSide(Color color) =>
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(20), side: BorderSide(width: 3, color: color));

  Checkbox listTileLeading() {
    return Checkbox(
      activeColor: Theme.of(context).primaryColor,
      value: widget.isDone,
      onChanged: widget.toggleStatus,
    );
  }

  Text listTileTitle(BuildContext context) {
    return Text(
      widget.title,
      style: AppStylesConstants.textStyle.copyWith(
        color: Theme.of(context).listTileTheme.textColor,
        decoration: widget.isDone ? TextDecoration.lineThrough : TextDecoration.none,
      ),
    );
  }

  Container listTileTrailing(BuildContext context) {
    return Container(
      padding: AppPaddingConstants.zeroPadding,
      width: 35,
      height: 35,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: IconButton(
        onPressed: () {
          setState(
            () {
              widget.updateController.text = widget.title;
              customShowDialog(
                context: context,
                tfController: widget.updateController,
                buttonText: AppLanguagesConstants.saveItem,
                onPressed: () {
                  Provider.of<ItemProvider>(context, listen: false).updateItem(widget.index, widget.updateController.text);
                  Navigator.pop(context);
                },
              );
            },
          );
        },
        icon: AppIconConstants.editIcon,
        iconSize: 20,
      ),
    );
  }
}
