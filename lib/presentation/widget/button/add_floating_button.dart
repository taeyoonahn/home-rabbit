import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:home_rabbit/presentation/view_model/house_view_model.dart';
import 'package:home_rabbit/presentation/view_model/subcription_view_model.dart';
import 'package:home_rabbit/presentation/widget/button/main_button.dart';
import 'package:provider/provider.dart';

class AddFloatingButton extends StatelessWidget {
  const AddFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    final houseViewModel = context.read<HouseViewModel>();
    final subscriptionViewModel = context.read<SubscriptionViewModel>();
    final controller = TextEditingController();
    String houseName;

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return FloatingActionButton(
      heroTag: 'add',
      onPressed: () async {
        if (!subscriptionViewModel.isSubscribed &&
            await houseViewModel.getTotalHouses() != 0) {
          if (context.mounted) {
            context.go("/home/subscriptionPromotion");
          } else {
            throw Error();
          }
        } else {
          showModalBottomSheet(
            context: context,
            useRootNavigator: true,
            isScrollControlled: true,
            builder: (context) => Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Container(
                padding: EdgeInsets.all(screenWidth * 0.025),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(screenWidth * 0.04),
                ),
                width: double.infinity,
                height: screenHeight * 0.45,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: screenHeight * 0.05),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: screenWidth * 0.025),
                          child: const Text(
                            '점검 대상 매물의\n이름을 설정해주세요',
                            style: TextStyle(
                                fontFamily: 'SCDream',
                                fontSize: 20,
                                color: Colors.black87,
                                fontWeight: FontWeight.w800),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.05),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(width: screenWidth * 0.1),
                        Expanded(
                          child: TextField(
                            controller: controller,
                            textAlign: TextAlign.left,
                            decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.all(screenWidth * 0.025),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(screenWidth * 0.01)),
                                  borderSide: BorderSide(
                                      color: Colors.black87,
                                      width: screenWidth * 0.004),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: HexColor('#1E319D'),
                                      width: screenWidth * 0.004),
                                ),
                                fillColor: Colors.white70,
                                filled: true,
                                hintText: '입력해주세요',
                                hintStyle: TextStyle(
                                    fontFamily: 'SCDream',
                                    color: Colors.grey[800])),
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.1),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.07),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MainButton(
                          buttonText: '등록',
                          buttonWidth: screenWidth * 0.25,
                          buttonHeight: screenHeight * 0.06,
                          myFontSize: screenWidth * 0.05,
                          myCallback: () async {
                            if (subscriptionViewModel.isSubscribed) {
                              houseName = controller.text;
                              controller.text = "";
                              var isExist =
                                  await houseViewModel.getHouse(houseName);
                              if (isExist == null) {
                                houseViewModel.addHouse(houseName);
                                Navigator.pop(context);
                              } else {
                                showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                          backgroundColor: Colors.white,
                                          content: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                "이미 동일한 이름의 매물이 존재합니다.",
                                                style: TextStyle(
                                                    fontSize:
                                                        screenWidth * 0.035),
                                              ),
                                            ],
                                          ),
                                          actions: [
                                            Center(
                                              child: MainButton(
                                                buttonText: '확인',
                                                buttonHeight:
                                                    screenHeight * 0.06,
                                                buttonWidth: screenWidth * 0.18,
                                                myFontSize: screenWidth * 0.03,
                                                myCallback: () {
                                                  Navigator.pop(context);
                                                },
                                              ),
                                            )
                                          ]);
                                    });
                              }
                            } else {
                              if (await houseViewModel.getTotalHouses() == 0) {
                                houseName = controller.text;
                                controller.text = "";
                                var isExist =
                                    await houseViewModel.getHouse(houseName);
                                if (isExist == null) {
                                  houseViewModel.addHouse(houseName);
                                  Navigator.pop(context);
                                } else {
                                  showDialog(
                                      context: context,
                                      barrierDismissible: false,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                            backgroundColor: Colors.white,
                                            content: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  "이미 동일한 이름의 매물이 존재합니다.",
                                                  style: TextStyle(
                                                      fontSize:
                                                          screenWidth * 0.035),
                                                ),
                                              ],
                                            ),
                                            actions: [
                                              Center(
                                                child: MainButton(
                                                  buttonText: '확인',
                                                  buttonHeight:
                                                      screenHeight * 0.06,
                                                  buttonWidth:
                                                      screenWidth * 0.18,
                                                  myFontSize:
                                                      screenWidth * 0.03,
                                                  myCallback: () {
                                                    Navigator.pop(context);
                                                  },
                                                ),
                                              )
                                            ]);
                                      });
                                }
                              }
                            }
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
      shape: const CircleBorder(),
      backgroundColor: HexColor('#1E319D'),
      child: const Icon(Icons.add_home, color: Colors.white),
    );
  }
}
