class Images {
  static String get logo => 'logo'.png;
  static String get us => 'us'.png;
  static String get cart => 'cart'.png;
  static String get credit => 'credit'.png;
  static String get home => 'home'.png;
  static String get menu => 'menu'.png;
  static String get history => 'order-history-48'.png;
  static String get guest => 'guest'.png;
  static String get offerMenu => 'offers_menu'.png;
  static String get webAppBarLogoDart => 'webAppBarLogoDart'.png;
  static String get webAppBarLogo => 'webAppBarLogo'.png;
  static const String placeholder = 'assets/images/placeholder.jpg';
  static String get discountIcon => 'discount'.png;

  // mock product 
  static const String vihawa = 'assets/images/vihawa.png';
  static const String gas = 'assets/images/gas.jpeg';
  static const String gasGrey = 'assets/images/gas_grey.png';
}

extension on String {
  String get png => 'assets/images/$this.png';
}