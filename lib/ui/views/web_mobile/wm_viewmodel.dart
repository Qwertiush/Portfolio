import 'dart:convert';

import 'package:cv/app/app.bottomsheets.dart';
import 'package:cv/app/app.dialogs.dart';
import 'package:cv/app/app.locator.dart';
import 'package:cv/ui/common/app_strings.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../common/app_colors.dart';
import '../../widgets/custom_project_button_widget.dart';

class WMViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();

  String _title = "Title";
  String get title  => _title;

  List<CustomProjectButtonWidgetLarge> _tiles = new List.empty();
  List<CustomProjectButtonWidgetLarge>  get tiles => _tiles;

  List<CustomProjectButtonWidgetLarge> _projectTiles = new List.empty();
  List<CustomProjectButtonWidgetLarge>  get projectTiles => _projectTiles;

  bool _isPoppedOut = false;
  bool get isPoppedOut => _isPoppedOut;

  String get counterLabel => 'Counter is: $_counter';

  int _counter = 0;

  void incrementCounter() {
    _counter++;
    rebuildUi();
  }

  void showDialog() {
    _dialogService.showCustomDialog(
      variant: DialogType.infoAlert,
      title: 'Stacked Rocks!',
      description: 'Give stacked $_counter stars on Github',
    );
  }

  void showBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: ksHomeBottomSheetTitle,
      description: ksHomeBottomSheetDescription,
    );
  }

    void setTitlePopOutWidget(String titlePopUp){
    _title = titlePopUp;
    notifyListeners();
  }

  void setTilesPopOutWidget( List<CustomProjectButtonWidgetLarge> tilesPopUp)
  {
    _tiles = tilesPopUp;
    notifyListeners();
  }

  void showPoppedOutWidget() {
    _isPoppedOut = true;
    notifyListeners();
  }

  void hidePoppedOutWidget() {
    _isPoppedOut = false;
    notifyListeners();
  }

  Future<void> InitializeProjectTiles(bool isMobile) async{
    String jsonData = await rootBundle.loadString('assets/jsondata/wm.json');
    List<dynamic> jsonList = json.decode(jsonData);

    _projectTiles = jsonList.map((jsonItem) {

      List<dynamic> content = List<dynamic>.from(jsonItem['content']);

      List<CustomProjectButtonWidgetLarge> paraButtons = [];
      
      for(int i=0;i<content.length;i++)
      {
        List<dynamic> paraContent = List<dynamic>.from(content[i]);
        paraButtons.add(CustomProjectButtonWidgetLarge(mobile: isMobile, color1: kcWMViewColor, color2: kcBackgroundColor, text: paraContent[0], description: paraContent[1],imagePath: paraContent[2], scalingFactorWidth: 0.9, scalingFactorHeight: 0.6, roundedTopLeft: true, roundedTopRight: true, roundedBottomLeft: true, roundedBottomRight: true));
      }

      return CustomProjectButtonWidgetLarge(
        mobile: isMobile, 
        color1: kcWMViewColor,
        color2: kcBackgroundColor,
        text: jsonItem['text'],
        description: jsonItem['description'],
        imagePath: jsonItem['imagePath'],
        scalingFactorWidth: 0.98,
        scalingFactorHeight: 0.49,
        roundedTopLeft: true,
        roundedTopRight: true,
        roundedBottomLeft: true,
        roundedBottomRight: true,
        onTap: () {
          setTitlePopOutWidget(jsonItem['text']);
          setTilesPopOutWidget(paraButtons);
          showPoppedOutWidget();
        },
      );
    }).toList();
  }
}
