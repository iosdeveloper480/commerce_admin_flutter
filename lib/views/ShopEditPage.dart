import 'package:fatima_admin/config/CustomColors.dart';
import 'package:fatima_admin/domain/models/ShopModel.dart';
import 'package:fatima_admin/domain/models/SliderModel.dart';
import 'package:fatima_admin/presentation/widgets/WANetworkImageView.dart';
import 'package:fatima_admin/utils/WAConstants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShopEditPage extends StatefulWidget {
  const ShopEditPage({
    Key? key,
    this.onChanged,
    required this.shop,
    this.onPressedEdit,
    this.onPressedUpdate,
    this.onPressedLocation,
    this.onPressedLogin,
    this.sliders = const ['', '', ''],
  }) : super(key: key);

  final FallbackFunction<bool>? onChanged;
  final FallbackFunction<ShopModel>? onPressedEdit;
  final FallbackFunction<ShopModel>? onPressedUpdate;
  final FallbackFunction<ShopModel>? onPressedLocation;
  final FallbackFunction<ShopModel>? onPressedLogin;
  final List<String> sliders;
  final ShopModel shop;

  @override
  State<ShopEditPage> createState() => _ShopEditPageState();
}

class _ShopEditPageState extends State<ShopEditPage> {
  bool valueChanged = false;
  @override
  void initState() {
    super.initState();
    setState(() {
      valueChanged = widget.shop.close == '0' ? true : false;
    });
  }

  List<Widget> makeSliders(BuildContext context) {
    double fullWidth = MediaQuery.of(context).size.width - 36;

    Widget emptyWidget = Container(
      width: fullWidth / 3,
      margin: const EdgeInsets.symmetric(horizontal: 1),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Colors.grey,
      ),
      child: const WANetworkImageView(
        fit: BoxFit.fill,
        imageUrl: '',
      ),
    );
    List<Widget> sliders = [emptyWidget, emptyWidget, emptyWidget];
    for (String img in widget.sliders) {
      int index = widget.sliders.indexOf(img);
      if (img.isNotEmpty) {
        sliders[index] = Container(
          width: fullWidth / 3,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.grey,
          ),
          margin: const EdgeInsets.symmetric(horizontal: 1),
          child: WANetworkImageView(
            fit: BoxFit.fill,
            imageUrl: img,
          ),
        );
      } else {
        sliders.add(emptyWidget);
      }
    }
    return sliders;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Wrap(
        children: [
          Column(
            children: [
              Container(
                height: 45,
                margin: const EdgeInsets.only(
                    top: 10, left: 15, right: 15, bottom: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Status',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        CupertinoSwitch(
                          value: valueChanged,
                          onChanged: (value) {
                            setState(() {
                              valueChanged = value;
                              widget.onChanged;
                            });
                          },
                        ),
                      ],
                    ),
                    Container(
                      width: double.infinity,
                      height: 1,
                      color: CustomColors.shadow,
                    ),
                  ],
                ),
              ),
              Container(
                height: 115,
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      child: const Text(
                        'Sliders',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        scrollDirection: Axis.horizontal,
                        children: makeSliders(context),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 15),
                      width: double.infinity,
                      height: 1,
                      color: CustomColors.shadow,
                    ),
                  ],
                ),
              ),
              WAListTile(
                leading: const Icon(Icons.edit),
                title: const Text('Edit'),
                onTap: () {
                  if (widget.onPressedEdit != null) {
                    widget.onPressedEdit!(widget.shop);
                  }
                },
              ),
              WAListTile(
                leading: const Icon(Icons.update),
                title: const Text('Update'),
                onTap: () {
                  if (widget.onPressedUpdate != null) {
                    widget.onPressedUpdate!(widget.shop);
                  }
                },
              ),
              WAListTile(
                leading: const Icon(Icons.pin_drop_outlined),
                title: const Text('Location'),
                onTap: () {
                  if (widget.onPressedLocation != null) {
                    widget.onPressedLocation!(widget.shop);
                  }
                },
              ),
              WAListTile(
                leading: const Icon(Icons.login_outlined),
                title: const Text('Login'),
                onTap: () {
                  if (widget.onPressedLogin != null) {
                    widget.onPressedLogin!(widget.shop);
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class WAListTile extends StatelessWidget {
  const WAListTile({
    Key? key,
    this.leading,
    this.trailing,
    required this.title,
    this.onTap,
  }) : super(key: key);

  final Widget? leading;
  final Widget? trailing;
  final Widget title;
  final Fallback0Param? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: CustomColors.black.withOpacity(0.5),
      child: SizedBox(
        height: 45,
        child: Row(
          children: [
            Container(
              width: 25,
              height: 25,
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: leading,
            ),
            title,
            Container(
              width: 25,
              height: 25,
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: trailing,
            ),
          ],
        ),
      ),
    );
  }
}
