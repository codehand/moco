import 'package:moco/models/voucher.dart';

Map<int, VoucherModel> mockOffers = {
  0: VoucherModel(
    id: "1", 
    code: "V0001",
    name: "Ưu Đãi Đặc Biệt cho Nước Suối Tinh Khiết",
    description:"Thưởng thức nước suối tinh khiết với ưu đãi đặc biệt từ chúng tôi! Khám phá một loạt các ưu đãi trên nước suối tinh khiết, giúp bạn giữ gìn sức khỏe và cân bằng cơ thể mỗi ngày.",
    discountType: "fix",
    discountValue: "-5000"
  ),
  1: VoucherModel(
    id: "2", 
    code: "V0002",
    name: "Ưu Đãi Mua 1 Tặng 1 cho Nước Suối",
    description:"Mua 1, tặng 1 - Đừng bỏ lỡ cơ hội này! Mua một chai nước suối và nhận ngay một chai miễn phí. Sự tươi mới và sức khỏe đang chờ đợi bạn",
    discountType: "percent",
    discountValue: "-50%"
  ),
  2: VoucherModel(
    id: "3", 
    code: "V0003",
    name: "Giảm Giá Đặc Biệt cho Bình Ga",
    description:"Giảm giá đặc biệt trên bình ga! Mua bình ga từ các thương hiệu hàng đầu và tiết kiệm ngay hôm nay. Bình ga chất lượng cao, giá cả phải chăng",
    discountType: "percent",
    discountValue: "-50%"
  ),
};