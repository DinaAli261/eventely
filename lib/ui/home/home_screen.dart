import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/ui/home/tabs/favorite/favorite_tab.dart';
import 'package:evently/ui/home/tabs/home/home_tab.dart';
import 'package:evently/ui/home/tabs/map/map_tab.dart';
import 'package:evently/ui/home/tabs/profile/profile_tab.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:evently/utils/app_images.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> tabsList = [
    HomeTab(),
    MapTab(),
    FavoriteTab(),
    ProfileTab(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabsList[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (index) {
            selectedIndex = index;
            setState(() {

            });
          },
          items: [
            builtBottomNavigationBarItem(index: 0,
                label: AppLocalizations.of(context)!.home,
                selectedIcon: AppImages.selectedHome,
                unselectedIcon: AppImages.unselectedHome),
            builtBottomNavigationBarItem(index: 1,
                label: AppLocalizations.of(context)!.map,
                selectedIcon: AppImages.selectedMap,
                unselectedIcon: AppImages.unselectedMap),
            builtBottomNavigationBarItem(index: 2,
                label: AppLocalizations.of(context)!.love,
                selectedIcon: AppImages.selectedLove,
                unselectedIcon: AppImages.unselectedLove),
            builtBottomNavigationBarItem(index: 3,
                label: AppLocalizations.of(context)!.profile,
                selectedIcon: AppImages.selectedProfile,
                unselectedIcon: AppImages.unselectedProfile),
          ]
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {},
        child: Icon(Icons.add, color: AppColors.white, size: 40,),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  BottomNavigationBarItem builtBottomNavigationBarItem(
      {required String selectedIcon,
        required String unselectedIcon, required String label, required int index}) {
    return BottomNavigationBarItem(icon: ImageIcon(
        AssetImage((index == selectedIndex) ? selectedIcon : unselectedIcon)),
        label: label);
  }
}