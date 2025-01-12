import 'package:flutter/material.dart';
import 'package:home_rabbit/presentation/widget/bottom_sheet/item_bottom_sheet.dart';
import 'package:home_rabbit/presentation/widget/item/house_rank_item.dart';
import 'package:provider/provider.dart';
import 'package:home_rabbit/domain/model/house.dart';
import 'package:home_rabbit/presentation/view_model/house_view_model.dart';

class HouseItem extends StatelessWidget {
  final House house;
  const HouseItem({super.key, required this.house});

  @override
  Widget build(BuildContext context) {
    final houseViewModel = context.read<HouseViewModel>();
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight * 0.09,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.withOpacity(0.5),
            width: screenWidth * 0.0025,
          ),
        ),
      ),
      child: Center(
        child: ListTile(
          onTap: () async {
            await houseViewModel.setCurrentHouse(house);
            houseViewModel.discriminatingNavigate(context);
          },
          leading: HouseRankItem(houseRank: house.rank),
          title: Text(
            house.houseName,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: screenWidth * 0.04,
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    useRootNavigator: true,
                    backgroundColor: Colors.white,
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
                    ),
                    builder: (BuildContext context) {
                      return ItemBottomSheet(house: house);
                    },
                  );
                },
                child: Icon(
                  Icons.more_vert_outlined,
                  color: Colors.black54,
                  size: screenWidth * 0.06,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
