import 'package:fatima_admin/Views/AcceptedOrdersPage.dart';
import 'package:fatima_admin/Views/AddressesPage.dart';
import 'package:fatima_admin/Views/AppAlertsPage.dart';
import 'package:fatima_admin/Views/AppConfigurationPage.dart';
import 'package:fatima_admin/Views/AppDataPage.dart';
import 'package:fatima_admin/Views/BannersPage.dart';
import 'package:fatima_admin/Views/CancelledOrderPage.dart';
import 'package:fatima_admin/Views/CategoriesPage.dart';
import 'package:fatima_admin/Views/ChangePasswordPage.dart';
import 'package:fatima_admin/Views/ContactsPage.dart';
import 'package:fatima_admin/Views/CouponTransactionsPage.dart';
import 'package:fatima_admin/Views/CouponsPage.dart';
import 'package:fatima_admin/Views/CustomerSizesPage.dart';
import 'package:fatima_admin/Views/CustomersPage.dart';
import 'package:fatima_admin/Views/DeliverySettingsPage.dart';
import 'package:fatima_admin/Views/FAQsPage.dart';
import 'package:fatima_admin/Views/FeaturesPage.dart';
import 'package:fatima_admin/Views/LocationsPage.dart';
import 'package:fatima_admin/Views/MeasurementsPage.dart';
import 'package:fatima_admin/Views/MyHomePage.dart';
import 'package:fatima_admin/Views/NewOrdersPage.dart';
import 'package:fatima_admin/Views/NotificationsPage.dart';
import 'package:fatima_admin/Views/OnlineTransactionsPage.dart';
import 'package:fatima_admin/Views/OutForDeliveryPage.dart';
import 'package:fatima_admin/Views/OutOfStockPage.dart';
import 'package:fatima_admin/Views/PaymentMethodsPage.dart';
import 'package:fatima_admin/Views/PermissionsPage.dart';
import 'package:fatima_admin/Views/ProductsPage.dart';
import 'package:fatima_admin/Views/ReadyForDeliveryPage.dart';
import 'package:fatima_admin/Views/RefundsPage.dart';
import 'package:fatima_admin/Views/ReviewsPage.dart';
import 'package:fatima_admin/Views/SalesReportPage.dart';
import 'package:fatima_admin/Views/SettlementPage.dart';
import 'package:fatima_admin/Views/SettlementReportPage.dart';
import 'package:fatima_admin/Views/ShopsPage.dart';
import 'package:fatima_admin/Views/SizeChartPage.dart';
import 'package:fatima_admin/Views/SizesPage.dart';
import 'package:fatima_admin/Views/SlidersPage.dart';
import 'package:fatima_admin/Views/UsersPage.dart';
import 'package:flutter/material.dart';

class WAExpandableListView extends StatefulWidget {
  const WAExpandableListView(
      {Key? key, required this.leftMenuModel, required this.index})
      : super(key: key);
  final LeftMenuModel leftMenuModel;
  final int index;
  @override
  State<WAExpandableListView> createState() => _WAExpandableListViewState();
}

class _WAExpandableListViewState extends State<WAExpandableListView> {
  DrawerHeader drawerHeader = DrawerHeader(
    decoration: BoxDecoration(
      color: Colors.blue,
    ),
    child: Text('Drawer Header'),
  );
  onTap(SectionModel sectionModel) {}
  onTap2(LeftMenuItemModel leftMenuItemModel) {
    switch (leftMenuItemModel.name) {
      case "Dashboard":
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const MyHomePage(title: 'Home')),
        );
        break;
      case 'Locations':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LocationsPage()));
        break;
      case 'Categories':
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => CategoriesPage()));
        break;
      case 'Features':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const FeaturesPage()));
        break;
      case 'Sizes':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const SizesPage()));
        break;
      case 'Size Chart':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const SizeChartPage()));
        break;
      case 'Measurements':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const MeasurementsPage()));
        break;
      case 'Shops':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ShopsPage()));
        break;
      case 'New Orders':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const NewOrdersPage()));
        break;
      case 'Accepted Orders':
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const AcceptedOrdersPage()));
        break;
      case 'Ready For Delivery':
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const ReadyForDeliveryPage()));
        break;
      case 'Out for Delivery':
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const OutForDeliveryPage()));
        break;
      case 'Sliders':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const SlidersPage()));
        break;
      case 'Banners':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const BannersPage()));
        break;
      case 'App Alerts':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const AppAlertsPage()));
        break;
      case 'Coupons':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const CouponsPage()));
        break;
      case 'App Data':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const AppDataPage()));
        break;
      case 'FAQs':
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const FAQsPage()));
        break;
      case 'Reviews':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ReviewsPage()));
        break;
      case 'Notifications':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const NotificationsPage()));
        break;
      case 'Customers':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const CustomersPage()));
        break;
      case 'Addresses':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const AddressesPage()));
        break;
      case 'Refunds':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const RefundsPage()));
        break;
      case 'Settlement':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const SettlementPage()));
        break;
      case 'Users':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const UsersPage()));
        break;
      case 'Change Password':
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const ChangePasswordPage()));
        break;
      case 'Permissions':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const PermissionsPage()));
        break;
      case 'Contacts':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ContactsPage()));
        break;
      case 'Payment Methods':
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const PaymentMethodsPage()));
        break;
      case 'Delivery Settings':
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const DeliverySettingsPage()));
        break;
      case 'App Configuration':
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const AppConfigurationPage()));
        break;
      case 'Customer Sizes':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const CustomerSizesPage()));
        break;
      case 'Products':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ProductsPage()));
        break;
      case 'Out of Stock':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const OutOfStockPage()));
        break;
      case 'Cancelled Order':
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const CancelledOrderPage()));
        break;
      case 'Online Transactions':
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const OnlineTransactionsPage()));
        break;
      case 'Coupon Transactions':
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const CouponTransactionsPage()));
        break;
      case 'Sales Report':
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const SalesReportPage()));
        break;
      case 'Settlement Report':
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const SettlementReportPage()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.leftMenuModel.title.isEmpty) {
      return Column(
          children:
              _buildExpandableContent(widget.leftMenuModel, widget.index));
    } else {
      return ExpansionTile(
        expandedCrossAxisAlignment: CrossAxisAlignment.stretch,
        childrenPadding: const EdgeInsets.symmetric(horizontal: 20),
        collapsedIconColor: Colors.white,
        title: SizedBox(
          height: 24.0,
          child: Row(
            children: [
              Icon(
                widget.leftMenuModel.icon,
                color: Colors.white,
              ),
              const SizedBox(width: 10.0),
              Text(
                widget.leftMenuModel.title,
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
        children: <Widget>[
          Column(
            children:
                _buildExpandableContent(widget.leftMenuModel, widget.index),
          ),
        ],
      );
    }
  }

  _buildExpandableContent(LeftMenuModel letMenuModel, int sectionIndex) {
    List<Widget> columnContent = [];

    for (LeftMenuItemModel content in letMenuModel.contents) {
      int index = letMenuModel.contents.indexOf(content);
      columnContent.add(
        Center(
          // heightFactor: 55,
          // height: 35,
          child: ListTile(
            onTap: () {
              onTap2(content);
            },
            title: SizedBox(
              height: 24.0,
              child: Row(
                children: [
                  Icon(
                    content.icon,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 10.0),
                  Text(
                    content.name,
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
    return columnContent;
  }
}

class SectionModel {
  final int item;
  final int section;
  SectionModel(this.item, this.section);
}

class LeftMenuModel {
  final String title;
  List<LeftMenuItemModel> contents = [];
  final IconData icon;

  LeftMenuModel(this.title, this.contents, this.icon);
}

class LeftMenuItemModel {
  final String name;
  final IconData icon;
  LeftMenuItemModel(this.name, this.icon);
}

List<LeftMenuModel> leftMenuModelList = [
  LeftMenuModel(
    '',
    [
      LeftMenuItemModel('Dashboard', Icons.dashboard),
      LeftMenuItemModel('Locations', Icons.map_outlined),
      LeftMenuItemModel('Categories', Icons.list_outlined),
      LeftMenuItemModel('Features', Icons.featured_play_list),
    ],
    Icons.motorcycle,
  ),
  LeftMenuModel(
    '',
    [
      LeftMenuItemModel('Sizes', Icons.format_size),
      // LeftMenuItemModel('Size Chart', Icons.bar_chart),
      // LeftMenuItemModel('Measurements', Icons.scale),
    ],
    Icons.directions_car,
  ),
  LeftMenuModel(
    '',
    [LeftMenuItemModel('Shops', Icons.shop)],
    Icons.directions_car,
  ),
  LeftMenuModel(
    'Orders',
    [
      LeftMenuItemModel('New Orders', Icons.new_label),
      LeftMenuItemModel('Accepted Orders', Icons.new_label),
      LeftMenuItemModel('Ready For Delivery', Icons.new_label),
      LeftMenuItemModel('Out for Delivery', Icons.new_label),
    ],
    Icons.directions_car,
  ),
  LeftMenuModel(
    '',
    [
      LeftMenuItemModel('Sliders', Icons.payment),
      LeftMenuItemModel('Banners', Icons.payment),
      LeftMenuItemModel('App Alerts', Icons.ballot),
      LeftMenuItemModel('Coupons', Icons.payment),
      LeftMenuItemModel('App Data', Icons.payment),
      LeftMenuItemModel('FAQs', Icons.payment),
      LeftMenuItemModel('Reviews', Icons.payment),
      LeftMenuItemModel('Notifications', Icons.payment),
      LeftMenuItemModel('Customers', Icons.payment),
      LeftMenuItemModel('Addresses', Icons.payment),
      LeftMenuItemModel('Refunds', Icons.payment),
      LeftMenuItemModel('Settlement', Icons.payment),
    ],
    Icons.directions_car,
  ),
  LeftMenuModel(
    'Settings',
    [
      LeftMenuItemModel('Users', Icons.abc),
      LeftMenuItemModel('Change Password', Icons.abc),
      LeftMenuItemModel('Permissions', Icons.abc),
      LeftMenuItemModel('Contacts', Icons.abc),
      LeftMenuItemModel('Payment Methods', Icons.abc),
      LeftMenuItemModel('Delivery Settings', Icons.abc),
      LeftMenuItemModel('App Configuration', Icons.abc),
    ],
    Icons.directions_car,
  ),
  LeftMenuModel(
    'Reports',
    [
      LeftMenuItemModel('Customer Sizes', Icons.abc),
      LeftMenuItemModel('Products', Icons.abc),
      LeftMenuItemModel('Out of Stock', Icons.abc),
    ],
    Icons.directions_car,
  ),
  LeftMenuModel(
    'Financial Reports',
    [
      LeftMenuItemModel('Cancelled Order', Icons.abc),
      LeftMenuItemModel('Online Transactions', Icons.abc),
      LeftMenuItemModel('Coupon Transactions', Icons.abc),
      LeftMenuItemModel('Sales Report', Icons.abc),
      LeftMenuItemModel('Settlement Report', Icons.abc),
    ],
    Icons.directions_car,
  ),
];
