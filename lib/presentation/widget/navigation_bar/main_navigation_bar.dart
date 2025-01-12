import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:home_rabbit/presentation/view_model/loading_view_model.dart';
import 'package:provider/provider.dart';

class MainNavigationBar extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const MainNavigationBar({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        Scaffold(
          resizeToAvoidBottomInset: false,
          body: navigationShell,
          bottomNavigationBar: Container(
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: Colors.grey, width: 0.5),
              ),
            ),
            child: BottomNavigationBar(
              backgroundColor: Colors.white,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home, size: screenWidth * 0.07),
                  label: '매물 점검',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_sharp, size: screenWidth * 0.07),
                  label: '내 정보',
                ),
              ],
              selectedLabelStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: screenWidth * 0.035,
              ),
              unselectedLabelStyle: TextStyle(fontSize: screenWidth * 0.033),
              selectedItemColor: Colors.black87,
              unselectedItemColor: Colors.black45,
              currentIndex: navigationShell.currentIndex,
              onTap: (int index) {
                navigationShell.goBranch(index);
              },
            ),
          ),
        ),
        Consumer<LoadingViewModel>(
          builder: (context, loadingViewModel, child) {
            return Offstage(
              offstage: !loadingViewModel.isLoading,
              child: Stack(
                children: [
                  const Opacity(
                    opacity: 0.5,
                    child: ModalBarrier(dismissible: false, color: Colors.black),
                  ),
                  Center(
                    child: SpinKitCircle(
                      color: HexColor('#1E319D'),
                      size: screenWidth * 0.1,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
