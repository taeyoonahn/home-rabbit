import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:home_rabbit/domain/model/house.dart';
import 'package:home_rabbit/presentation/view_model/house_view_model.dart';
import 'package:home_rabbit/presentation/widget/button/main_button.dart';
import 'package:provider/provider.dart';

class ItemBottomSheet extends StatelessWidget {
  final House house;
  const ItemBottomSheet({super.key, required this.house});

  @override
  Widget build(BuildContext context) {
    final houseViewModel = context.read<HouseViewModel>();
    final controller = TextEditingController();
    String newHouseName;
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.edit, size: screenWidth * 0.045),
            title: Text(
              '매물명 수정',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: screenWidth * 0.038,
              ),
            ),
            visualDensity: VisualDensity(
              horizontal: 0,
              vertical: (screenHeight * -0.004).clamp(-4.0, 4.0), // 범위 제한
            ),
            onTap: () {
              showModalBottomSheet(
                context: context,
                useRootNavigator: true,
                isScrollControlled: true,
                builder: (context) => Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
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
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                '점검 대상 매물의\n이름을 다시 설정해주세요',
                                style: TextStyle(
                                  fontFamily: 'SCDream',
                                  fontSize: screenWidth * 0.05,
                                  color: Colors.black87,
                                  fontWeight: FontWeight.w800,
                                ),
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
                                  contentPadding: const EdgeInsets.all(10),
                                  enabledBorder: const OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                                    borderSide: BorderSide(color: Colors.black87, width: 1.5),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: HexColor('#1E319D'), width: screenWidth * 0.004),
                                  ),
                                  fillColor: Colors.white70,
                                  filled: true,
                                  hintText: '입력해주세요',
                                  hintStyle: TextStyle(
                                      fontFamily: 'SCDream',
                                      color: Colors.grey[800]
                                  ),
                                ),
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
                              buttonText: '변경',
                              buttonWidth: screenWidth * 0.25,
                              buttonHeight: screenHeight * 0.06,
                              myFontSize: screenWidth * 0.05,
                              myCallback: () async {
                                newHouseName = controller.text;
                                controller.text = "";
                                var isExist = await houseViewModel.getHouse(newHouseName);
                                if (isExist == null) {
                                  House updatedHouse = house;
                                  updatedHouse.houseName = newHouseName;
                                  houseViewModel.updateHouse(updatedHouse);
                                  context.pop();
                                } else if (house.houseName == newHouseName) {
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
                                                  "현재 매물의 이름과 같습니다",
                                                  style: TextStyle(
                                                      fontFamily: 'SCDream',
                                                      fontSize: screenWidth * 0.035),
                                                ),
                                              ],
                                            ),
                                            actions: [
                                              Center(
                                                child: MainButton(
                                                  buttonText: '확인',
                                                  buttonHeight: screenHeight * 0.06,
                                                  buttonWidth: screenWidth * 0.18,
                                                  myFontSize: screenWidth * 0.03,
                                                  myCallback: () {
                                                    context.pop();
                                                  },
                                                ),
                                              )
                                            ]);
                                      });
                                } else {
                                  showDialog(
                                      context: context,
                                      barrierDismissible: false,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                            content: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Text(
                                                  "이미 동일한 이름의 매물이 존재합니다.",
                                                  style: TextStyle(
                                                      fontFamily: 'SCDream',
                                                      fontSize: screenWidth * 0.035),
                                                ),
                                              ],
                                            ),
                                            actions: [
                                              Center(
                                                child: MainButton(
                                                  buttonText: '확인',
                                                  buttonHeight: screenHeight * 0.06,
                                                  buttonWidth: screenWidth * 0.18,
                                                  myFontSize: screenWidth * 0.03,
                                                  myCallback: () {
                                                    context.pop();
                                                  },
                                                ),
                                              )
                                            ]);
                                      });
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
            },
          ),
          const Divider(color: Colors.grey, thickness: 0.5),
          ListTile(
            leading: Icon(Icons.delete, size: screenWidth * 0.045),
            title: Text(
              '삭제',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: screenWidth * 0.038,
              ),
            ),
            visualDensity: VisualDensity(
              horizontal: 0,
              vertical: (screenHeight * -0.004).clamp(-4.0, 4.0), // 범위 제한
            ),
            onTap: () {
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
                              "해당 매물을 삭제하시겠습니까?\n삭제한 매물은 되돌릴 수 없습니다.",
                              style: TextStyle(
                                fontFamily: 'SCDream',
                                fontSize: screenWidth * 0.035,
                              ),
                            ),
                          ],
                        ),
                        actions: [
                          Center(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                MainButton(
                                  buttonText: '삭제',
                                  buttonHeight: screenHeight * 0.06,
                                  buttonWidth: screenWidth * 0.18,
                                  myFontSize: screenWidth * 0.03,
                                  myCallback: () async {
                                    houseViewModel.deleteHouse(house.id);
                                    context.pop();
                                    context.pop();
                                  },
                                ),
                                SizedBox(width: screenWidth * 0.08),
                                MainButton(
                                  buttonText: '취소',
                                  buttonHeight: screenHeight * 0.06,
                                  buttonWidth: screenWidth * 0.18,
                                  myFontSize: screenWidth * 0.03,
                                  myCallback: () {
                                    context.pop();
                                    context.pop();
                                  },
                                ),
                              ],
                            ),
                          )
                        ]);
                  });
            },
          ),
          const Divider(color: Colors.grey, thickness: 0.5),
          ListTile(
            leading: Icon(Icons.close, size: screenWidth * 0.045),
            title: Text(
              '취소',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: screenWidth * 0.038,
              ),
            ),
            visualDensity: VisualDensity(
              horizontal: 0,
              vertical: (screenHeight * -0.004).clamp(-4.0, 4.0), // 범위 제한
            ),
            onTap: () {
              context.pop();
            },
          ),
        ],
      ),
    );
  }
}
