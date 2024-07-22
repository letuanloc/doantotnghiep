import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:htthuycanh/representation/widgets/app_bar_container2.dart';
import 'package:htthuycanh/core/const/font_const.dart';

class HydroInfoScreen extends StatefulWidget{
  const HydroInfoScreen({Key? key}) : super(key: key);
  static String routeName = 'hydro_info';
  @override
  _HydroInfoState createState() => _HydroInfoState();
}

class _HydroInfoState extends State<HydroInfoScreen> {
  @override
  Widget build(BuildContext context) {
    final String longText = '''
1. GIỚI THIỆU VỀ KỸ THUẬT THỦY CANH:
    
    
Thủy canh là kỹ thuật trồng cây trong dung dịch dinh dưỡng, thường được định nghĩa như là “trồng cây trong nước” hoặc “trồng cây không cần đất”. Bí quyết của kỹ thuật này là cung cấp đầy đủ và đúng lúc các nguyên tố khoáng cần thiết cho cây trồng để cây trồng có thể phát triển xanh tốt.
    
Bằng phương pháp thủy canh, rau quả được cung cấp đủ dinh dưỡng cần thiết, cách ly với nguồn sâu bệnh, phân thuốc, nước ô nhiễm, tránh được các vi sinh vật gây bệnh và các độc tố có trong đất. Các loại rau/quả thích hợp với môi trường thủy canh như xà lách, cải xanh, cải ngọt, rau quế, rau muống, cà chua, ớt,...
    
Hệ thống trồng rau thủy canh là một giải pháp sản xuất rau sạch “thông minh”. Rau trồng bằng nước được bổ sung đầy đủ dinh dưỡng theo tiêu chuẩn quốc tế, không ảnh hưởng đến sức khỏe của người tiêu dùng. Ngoài ra, sản phẩm được thiết kế linh động với nhiều ưu điểm, có thể tháo lắp và dễ dàng di chuyển với nhiều mô hình từ quy mô hộ gia đình đến quy mô sản xuất lớn.
    ''';

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