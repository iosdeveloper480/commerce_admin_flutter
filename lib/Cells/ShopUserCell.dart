import 'package:fatima_admin/domain/models/ShopUserModel.dart';
import 'package:fatima_admin/presentation/widgets/WAButton.dart';
import 'package:fatima_admin/presentation/widgets/WACardView.dart';
import 'package:fatima_admin/presentation/widgets/WANetworkImageView.dart';
import 'package:fatima_admin/presentation/widgets/WATitleSubtitleRow.dart';
import 'package:fatima_admin/utils/Callback.dart';
import 'package:flutter/material.dart';

class ShopUserCell extends StatefulWidget {
  const ShopUserCell({
    Key? key,
    required this.dataModel,
    this.onValueChange,
    this.onPressedSizesButton,
    required this.onTapEdit,
    required this.onTapChangePassword,
  }) : super(key: key);

  final ShopUserModel dataModel;
  final FallbackFunction<ShopUserModel>? onValueChange;
  final FallbackFunction<ShopUserModel>? onPressedSizesButton;
  final FallbackFunction<ShopUserModel> onTapEdit;
  final FallbackFunction<ShopUserModel> onTapChangePassword;

  @override
  State<ShopUserCell> createState() => _ShopUserCellState();
}

class _ShopUserCellState extends State<ShopUserCell> {
  bool status = false;
  @override
  void initState() {
    super.initState();
    setState(() {
      if (widget.dataModel.status == '1') {
        status = true;
      } else {
        status = false;
      }
    });
  }

  onValueChange(BuildContext context, bool isSelected) {
    setState(() {
      status = isSelected;
      if (widget.onValueChange != null) {
        widget.onValueChange!(widget.dataModel);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WACardView(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 10,
              right: 10,
              left: 10,
              bottom: widget.dataModel.main != '0' ? 15 : 0,
            ),
            child: Column(
              children: [
                WATitleSubtitleRow(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  subtitleMaxLines: 1,
                  title: 'Name',
                  subtitle: widget.dataModel.name,
                ),
                WATitleSubtitleRow(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  subtitleMaxLines: 1,
                  title: 'User Name',
                  subtitle: widget.dataModel.userName,
                ),
                WATitleSubtitleRow(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  subtitleMaxLines: 1,
                  title: 'Role',
                  subtitle: widget.dataModel.role,
                ),
                const Divider(
                  height: 18,
                ),
                SizedBox(
                  height: 18,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Status',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      // const Divider(),
                      SizedBox(
                        width: 35,
                        child: Switch(
                          value: status,
                          onChanged: (bool status) {
                            onValueChange(context, status);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: widget.dataModel.main == '0',
                  child: Container(
                    width: double.infinity,
                    height: 28,
                    margin: const EdgeInsets.only(bottom: 10, top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Visibility(
                          visible: widget.dataModel.main == '0',
                          child: Expanded(
                            child: WAButton(
                              title: 'Change Password',
                              onPressed: () {
                                widget.onTapChangePassword(widget.dataModel);
                              },
                            ),
                          ),
                        ),
                        const VerticalDivider(
                          thickness: 1,
                          width: 1,
                          color: Colors.white,
                        ),
                        Visibility(
                          visible: widget.dataModel.main == '0',
                          child: Expanded(
                            child: WAButton(
                              title: 'Edit',
                              onPressed: () {
                                widget.onTapEdit(widget.dataModel);
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
