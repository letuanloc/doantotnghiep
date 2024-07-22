import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:htthuycanh/representation/widgets/app_bar_container2.dart';
import 'package:htthuycanh/core/const/font_const.dart';

class HydroProcessScreen extends StatefulWidget{
  const HydroProcessScreen({Key? key}) : super(key: key);
  static String routeName = 'hydro_process';

  @override
  _HydroProcessState createState() => _HydroProcessState();
}

class _HydroProcessState extends State<HydroProcessScreen>{


  @override
  Widget build(BuildContext context) {
    final String longText = '''
3. HƯỚNG DẪN KỸ THUẬT TRỒNG RAU THỦY CANH:
    
    
3.1. Một số yêu cầu khi thực hiện trồng thủy canh

Hệ thống thủy canh bao gồm các bộ phận chính như sau:
- Các ống nhựa/chậu trồng chuyên dụng dùng cho thủy canh (hoặc có thể sử dụng ống nước PVC), trên thân ống có đục các lỗ để đặt các rọ nhựa trồng cây.
- Rọ nhựa.
- Giá đỡ/kệ đỡ bằng sắt để đặt các ống trồng thủy canh.
- Một bồn/thùng chứa dung dịch dinh dưỡng (dung tích tùy theo kích thước của giàn thủy canh được thiết kế).
- Máy bơm.
- Timer hẹn giờ
- Dung dịch thủy canh.
- Hạt giống.
- Giá thể ươm hạt.
- Nước: sử dụng nước có pH trong khoảng 6-7.
    
Nguyên tắc: các ống/chậu trồng cây chuyên dụng được kết tnối trong hệ thống đảm bảo điều kiện sao cho dung dịch dinh dưỡng từ thùng chứa sẽ chảy dọc theo suốt chiều dài của các ống trồng đến từng rọ cây trong hệ thống trước khi hồi lưu trở lại thùng chứa. Hệ thống đóng mở tự động qua timer được nối giữa máy bơm và hệ thống dẫn nước, có tác dụng điều chỉnh thời gian và số lần bơm nước trong ngày.

 
3.2. Quy trình trồng rau thủy canh

Bước 1: Ươm hạt giống, chuẩn bị cây con
Một số lưu ý:
- Chọn các hạt giống của các công ty có uy tín trên thị trường để đảm bảo tỷ lệ hạt nảy mầm cao.
- Sử dụng giá thể hữu cơ để gieo hạt các loại rau nhằm hạn chế một số mầm bệnh.
    
Phương pháp thực hiện:
- Cho giá thể vào các rọ nhựa hoặc khay xốp.
- Gieo hạt giống trực tiếp vào các rọ nhựa hoặc gieo vào các khay xốp đã chứa giá thể (khoảng 4-5 hạt giống/rọ nhựa).
- Để các rọ/khay xốp đã gieo hạt vào chỗ mát và tưới phun sương hàng ngày đến khi hạt giống nảy mầm, bén rễ, lên lá non. Sau khi hạt nảy mầm, đem cây con ra nắng nhẹ cho quen với điều kiện bên ngoài. 
    
Bước 2: Đặt rọ cây con lên ống trồng thủy canh, vận hành hệ thống thủy canh, trồng và chăm sóc
- Đặt rọ cây con lên ống trồng thủy canh:
   Các giống rau ăn lá: sau khi gieo 7-10 ngày thì có thể đem ra trồng.
   Các giống rau ăn quả: sau khi gieo khoảng 20 ngày thì có thể đem trồng.
- Cho rọ cây con vào hết các lỗ trên ống trồng
- Vận hành hệ thống thủy canh, trồng và chăm sóc:
   Bơm nước vào đầy thùng chứa và cho dung dịch dinh dưỡng
   Cài đặt timer 
   Mỗi ngày kiểm tra nước trong thùng chứa, cây con và sâu bệnh.
   Bổ sung dinh dưỡng giúp cho cây phát triển, với tần suất 1-2 lần/tuần; trước khi thu hoạch 1 tuần không bổ sung dinh dưỡng.
   Vệ sinh cỏ dại xung quanh khu vực trồng.
   Phòng trừ sâu bệnh:

Chú ý: Cần tuân thủ nguyên tắc “4 đúng” và đảm bảo thời gian cách ly.
    
Bước 3: Thu hoạch
- Đối với trồng rau thủy canh, thời gian thu hoạch rau ăn lá từ 3-5 tuần sau trồng; và rau ăn quả từ 2,5-3 tháng sau trồng - tùy thuộc vào từng đối tượng.
- Thời điểm thu hoạch: vào lúc sáng sớm hoặc chiều mát để tránh rau bị héo do mất nước.
- Năng suất trung bình (tính cho 1m ống trồng thủy canh (chứa khoảng 5-10 rọ trồng) cho thu hoạch 300-500g rau/vụ (tùy vào loại rau được trồng), trung bình 1 chậu trồng thủy canh cho thu hoạch 1-2kg quả/vụ (tùy vào loại quả được trồng).
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