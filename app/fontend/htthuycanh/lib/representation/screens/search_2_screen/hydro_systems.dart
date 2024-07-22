import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:htthuycanh/representation/widgets/app_bar_container2.dart';
import 'package:htthuycanh/core/const/font_const.dart';

class HydroSystemsScreen extends StatefulWidget{
  const HydroSystemsScreen({Key? key}) : super(key: key);
  static String routeName = 'hydro_systems';

  @override
  _HydroSystemsState createState() => _HydroSystemsState();
}

class _HydroSystemsState extends State<HydroSystemsScreen>{


  @override
  Widget build(BuildContext context) {
    final String longText = '''
2. PHÂN LOẠI CÁC HỆ THỐNG THỦY CANH:
    
    
Gồm 2 loại chính:
        
- Hệ thống thủy canh tĩnh: đây là hệ thống mà trong quá trình trồng cây, dung dịch dinh dưỡng không chuyển động. Hệ thống này có ưu điểm là giá thành thấp nhưng hạn chế là thường thiếu oxy và dễ sinh ra chua dung dịch, gây ngộ độc cho cây.    
    
- Hệ thống thủy canh động: đây là loại hệ thống mà trong quá trình trồng cây, dung dịch dinh dưỡng có sự chuyển động; chi phí cao hơn nhưng cây trồng không bị thiếu ôxy.     ''';

    return Scaffold(
      body: AppBarContainer2Widget(
        titleString: 'SỔ TAY THỦY CANH',
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Text(
            longText,
            style: Constants.thirdTextStyle,
          ),
        ),
      ),
    );
  }
}