import 'package:doctoworld_seller/Account/account_page.dart';
import 'package:doctoworld_seller/Account/profile_page.dart';
import 'package:doctoworld_seller/Auth/login_navigator.dart';
import 'package:doctoworld_seller/CheckoutOrder/order_details.dart';
import 'package:doctoworld_seller/DrawerItems/change_language_page.dart';
import 'package:doctoworld_seller/DrawerItems/earnings_page.dart';
import 'package:doctoworld_seller/DrawerItems/faq_page.dart';
import 'package:doctoworld_seller/DrawerItems/insight_page.dart';
import 'package:doctoworld_seller/DrawerItems/my_items.dart';
import 'package:doctoworld_seller/DrawerItems/recent_orders.dart';
import 'package:doctoworld_seller/DrawerItems/support_page.dart';
import 'package:doctoworld_seller/DrawerItems/tnc.dart';
import 'package:doctoworld_seller/DrawerItems/wallet_page.dart';
import 'package:doctoworld_seller/Pages/add_address.dart';
import 'package:doctoworld_seller/Pages/chat_screen.dart';
import 'package:doctoworld_seller/Pages/edit_item.dart';
import 'package:doctoworld_seller/Pages/track_order.dart';
import 'package:flutter/material.dart';

class PageRoutes {
  static const String recentOrdersTabs = 'recent_orders_page';
  static const String orderInfoPage = 'order_info_page';
  static const String accountPage = 'account_page';
  static const String trackOrderPage = 'track_order';
  static const String chatScreen = 'chat_screen';
  static const String myItemsPage = 'my_items_page';
  static const String editItemsPage = 'edit_items_page';
  static const String insightPage = 'insight_page';
  static const String reviewsPage = 'reviews_page';
  static const String earningsPage = 'earnings_page';
  static const String profilePage = 'profile_page';
  static const String addAddress = 'add_address';
  static const String walletPage = 'wallet_page';
  static const String sendToBank = 'send_to_bank';
  static const String supportPage = 'support_page';
  static const String faqPage = 'faq_page';
  static const String tncPage = 'tnc_page';
  static const String languagePage = 'language_page';
  static const String loginNavigator = 'loginNavigator';

  Map<String, WidgetBuilder> routes() {
    return {
      recentOrdersTabs: (context) => RecentOrders(),
      orderInfoPage: (context) => OrderInfo(),
      accountPage: (context) => AccountPage(),
      trackOrderPage: (context) => OrderTrackingPage(),
      chatScreen: (context) => ChatScreen(),
      myItemsPage: (context) => MyItemsPage(),
      editItemsPage: (context) => EditItemPage(),
      insightPage: (context) => InsightPage(),
      earningsPage: (context) => EarningsPage(),
      profilePage: (context) => ProfilePage(),
      addAddress: (context) => AddAddress(),
      walletPage: (context) => WalletPage(),
      supportPage: (context) => SupportPage(),
      faqPage: (context) => FAQPage(),
      tncPage: (context) => TnCPage(),
      languagePage: (context) => ChangeLanguagePage(),
      loginNavigator: (context) => LoginNavigator(),
    };
  }
}
