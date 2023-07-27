import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:stacked/stacked.dart';

import '../../common/app_colors.dart';
import '../../widgets/custom_project_button_widget.dart';

class OtherViewModel extends BaseViewModel {
  String _title = "Title";
  String get title => _title;

  List<CustomProjectButtonWidgetLarge> _tiles = [];
  List<CustomProjectButtonWidgetLarge> get tiles => _tiles;

  List<CustomProjectButtonWidgetLarge> _projectTiles = [];
  List<CustomProjectButtonWidgetLarge> get projectTiles => _projectTiles;

  bool _isPoppedOut = false;
  bool get isPoppedOut => _isPoppedOut;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _errorMessage = "none";
  String get errorMessage => _errorMessage;

  Future<void> InitializeProjectTiles(bool isMobile) async {
    try {
      _isLoading = true;
      notifyListeners();

      final response = await http.get(Uri.parse(
          'https://gist.githubusercontent.com/Qwertiush/6c64594cf347fa0680007e4bb6181f59/raw/other.json'));

      if (response.statusCode == 200) {
        List<dynamic> jsonList = json.decode(response.body);

        _projectTiles = jsonList.map((jsonItem) {
          List<dynamic> content = List<dynamic>.from(jsonItem['content']);

          List<CustomProjectButtonWidgetLarge> paraButtons = [];

          for (int i = 0; i < content.length; i++) {
            List<dynamic> paraContent = List<dynamic>.from(content[i]);
            paraButtons.add(CustomProjectButtonWidgetLarge(
              mobile: isMobile,
              color1: kcOtherViewColor,
              color2: kcBackgroundColor,
              text: paraContent[0],
              description: paraContent[1],
              imagePath: paraContent[2],
              scalingFactorWidth: 0.9,
              scalingFactorHeight: 0.6,
              roundedTopLeft: true,
              roundedTopRight: true,
              roundedBottomLeft: true,
              roundedBottomRight: true,
            ));
          }

          return CustomProjectButtonWidgetLarge(
            mobile: isMobile,
            color1: kcOtherViewColor,
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
              _title = jsonItem['text'];
              _tiles = paraButtons;
              _isPoppedOut = true;
              notifyListeners();
            },
          );
        }).toList();
      } else {
        throw Exception('Failed to load JSON data');
      }
    } catch (error) {
      _errorMessage = error.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void hidePoppedOutWidget() {
    _isPoppedOut = false;
    notifyListeners();
  }
}
