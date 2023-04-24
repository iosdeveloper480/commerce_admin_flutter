import 'package:fatima_admin/domain/models/OrderModel.dart';
import 'package:fatima_admin/presentation/widgets/WAButton.dart';
import 'package:fatima_admin/presentation/widgets/WACardView.dart';
import 'package:fatima_admin/presentation/widgets/WATitleSubtitleRow.dart';
import 'package:flutter/material.dart';

class OrderCell extends StatefulWidget {
  const OrderCell({
    Key? key,
    required this.orderModel,
  }) : super(key: key);

  final OrderModel orderModel;

  @override
  State<OrderCell> createState() => _OrderCellState();
}

class _OrderCellState extends State<OrderCell> {
  onPressBillButton() {}
  @override
  Widget build(BuildContext context) {
    return WACardView(
      innerMargin: const EdgeInsets.only(top: 8, right: 8, left: 8, bottom: 4),
      body: Column(
        children: [
          WATitleSubtitleRow(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            title: '#${widget.orderModel.ticketId}',
            subtitle: widget.orderModel.date,
          ),
          WATitleSubtitleRow(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            subtitleMaxLines: 1,
            title: 'Name',
            subtitle: widget.orderModel.name,
          ),
          WATitleSubtitleRow(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            subtitleMaxLines: 1,
            title: 'Phone',
            subtitle: widget.orderModel.phone,
          ),
          WATitleSubtitleRow(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            subtitleMaxLines: 1,
            title: 'Address',
            subtitle: widget.orderModel.address,
          ),
          const Divider(),
          WATitleSubtitleRow(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            subtitleMaxLines: 1,
            title: 'Name',
            subtitle: widget.orderModel.productName,
          ),
          WATitleSubtitleRow(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            subtitleMaxLines: 1,
            title: 'Quantity',
            subtitle: widget.orderModel.quantity,
          ),
          WATitleSubtitleRow(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            subtitleMaxLines: 1,
            title: 'Price',
            subtitle: widget.orderModel.productPrice,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Product Name',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(widget.orderModel.sizeName),
            ],
          ),
          const Divider(),
          WATitleSubtitleRow(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            subtitleMaxLines: 1,
            title: 'Payment',
            subtitle: widget.orderModel.getPaymentMethod(),
          ),
          WATitleSubtitleRow(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            subtitleMaxLines: 1,
            title: 'Sub Total',
            subtitle: widget.orderModel.total,
          ),
          WATitleSubtitleRow(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            subtitleMaxLines: 1,
            title: 'Total Discount',
            subtitle: widget.orderModel.discount,
          ),
          WATitleSubtitleRow(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            subtitleMaxLines: 1,
            title: 'Delivery',
            subtitle: widget.orderModel.delivery,
          ),
          const Divider(),
          WATitleSubtitleRow(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            subtitleMaxLines: 1,
            title: 'Total',
            subtitle: '${widget.orderModel.getTotal()}',
          ),
          SizedBox(
            width: double.infinity,
            child: WAButton(
              title: 'BILL',
              onPressed: onPressBillButton,
            ),
          ),
        ],
      ),
    );
  }
}
