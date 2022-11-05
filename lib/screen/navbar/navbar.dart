import 'package:cryptopedia/provider/auth_provider.dart';
import 'package:cryptopedia/provider/bottom_navbar_provider.dart';
import 'package:cryptopedia/provider/coin_provider.dart';
import 'package:cryptopedia/provider/theme_provider.dart';
import 'package:cryptopedia/provider/user_provider.dart';
import 'package:cryptopedia/utils/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final data = Provider.of<AuthProvider>(context, listen: false);
      Provider.of<UserProvider>(context, listen: false)
          .getUserData(data.getUser()!.email!);
      Provider.of<CoinProvider>(context, listen: false).getAllCoin();
      Provider.of<CoinProvider>(context, listen: false).coinSortPriceChange();
      Provider.of<CoinProvider>(context, listen: false).coinSortMarketCap();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Consumer<BottomNavbarProvider>(
      builder: (context, value, _) => Consumer<ThemeProvider>(
        builder: (context, theme, _) => Scaffold(
          body: value.currentScreen,
          bottomNavigationBar: Container(
            decoration: const BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20))),
            height: 70.h,
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(FeatherIcons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(FeatherIcons.bookOpen),
                  label: 'Sharing',
                ),
                BottomNavigationBarItem(
                  icon: Icon(FeatherIcons.plus),
                  label: 'Add Forum',
                ),
                BottomNavigationBarItem(
                  icon: Icon(FeatherIcons.book),
                  label: 'Crypto 101',
                ),
                BottomNavigationBarItem(
                  icon: Icon(FeatherIcons.user),
                  label: 'Profile',
                ),
              ],
              backgroundColor: theme.themeValue == false
                  ? AppColors.lightColor
                  : AppColors.darkModeFrame,
              currentIndex: value.currentTab,
              unselectedItemColor: theme.themeValue == false
                  ? AppColors.darkColor
                  : AppColors.lightColor,
              iconSize: 24.w,
              selectedItemColor: AppColors.primaryBrand,
              onTap: (index) {
                value.currentTab = index;
              },
            ),
          ),
        ),
      ),
    ));
  }
}
