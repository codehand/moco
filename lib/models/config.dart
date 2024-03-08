import 'dart:convert';

class ConfigModel {
  String? responseCode;
  String? message;
  Content? content;

  ConfigModel({this.responseCode, this.message, this.content});

  ConfigModel.fromJson(Map<String, dynamic> json) {
    responseCode = json['response_code'];
    message = json['message'];
    content =
    json['content'] != null ? Content.fromJson(json['content']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['response_code'] = responseCode;
    data['message'] = message;
    if (content != null) {
      data['content'] = content!.toJson();
    }
    return data;
  }
}

class Content {
  String? businessName;
  String? logo;
  String? providerSelfRegistration;
  String? countryCode;
  String? businessAddress;
  String? businessPhone;
  String? businessEmail;
  String? baseUrl;
  String? currencyDecimalPoint;
  String? currencySymbolPosition;
  String? currencyCode;
  String? privacyPolicy;
  String? termsAndConditions;
  String? cancellationPolicy;
  String? refundPolicy;
  String? aboutUs;
  String? country;
  DefaultLocation? defaultLocation;
  String? appUrlAndroid;
  String? appUrlIos;
  int? smsVerification;
  MapApiKey? mapApiKey;
  String? imageBaseUrl;
  int? paginationLimit;
  List<Languages>? languages;
  List<Currencies>? currencies;
  List<Countries>? countries;
  List<String>? timeZones;
  UserLocationInfo? userLocationInfo;
  List<String>? paymentGateways;
  AdminDetails? adminDetails;
  MinimumVersion? minimumVersion;
  String? footerText;
  int? googleSocialLogin;
  int? facebookSocialLogin;


  Content(
      {this.businessName,
        this.logo,
        this.providerSelfRegistration,
        this.countryCode,
        this.businessAddress,
        this.businessPhone,
        this.businessEmail,
        this.baseUrl,
        this.currencyDecimalPoint,
        this.currencySymbolPosition,
        this.currencyCode,
        this.privacyPolicy,
        this.cancellationPolicy,
        this.refundPolicy,
        this.aboutUs,
        this.country,
        this.defaultLocation,
        this.appUrlAndroid,
        this.appUrlIos,
        this.smsVerification,
        this.mapApiKey,
        this.imageBaseUrl,
        this.paginationLimit,
        this.languages,
        this.currencies,
        this.countries,
        this.timeZones,
        this.userLocationInfo,
        this.paymentGateways,
        this.minimumVersion,
        this.footerText,
        this.googleSocialLogin,
      });

  Content.fromJson(Map<String, dynamic> json) {
    businessName = json['business_name'];
    logo = json['logo'];
    countryCode = json['country_code'];
    providerSelfRegistration = json['provider_self_registration'];
    businessAddress = json['business_address'];
    businessPhone = json['business_phone'];
    businessEmail = json['business_email'];
    baseUrl = json['base_url'];
    currencyDecimalPoint = json['currency_decimal_point'];
    currencySymbolPosition = json['currency_symbol_position'];
    currencyCode = json['currency_code'];
    privacyPolicy = json['privacy_policy'];
    termsAndConditions = json['terms_and_conditions'];
    cancellationPolicy = json['cancellation_policy'];
    refundPolicy = json['refund_policy'];
    aboutUs = json['about_us'];
    country = json['country'];
    defaultLocation = json['default_location'] != null ? DefaultLocation.fromJson(json['default_location']) : null;
    appUrlAndroid = json['app_url_playstore'];
    appUrlIos = json['app_url_appstore'];
    smsVerification = json['sms_verification'];
    mapApiKey = json['map_api_key'] != null
        ? MapApiKey.fromJson(json['map_api_key'])
        : null;
    imageBaseUrl = json['image_base_url'];
    paginationLimit = json['pagination_limit'];
    if (json['languages'] != null) {
      languages = <Languages>[];
      json['languages'].forEach((v) {
        languages!.add(Languages.fromJson(v));
      });
    }
    if (json['currencies'] != null) {
      currencies = <Currencies>[];
      json['currencies'].forEach((v) {
        currencies!.add(Currencies.fromJson(v));
      });
    }
    if (json['countries'] != null) {
      countries = <Countries>[];
      json['countries'].forEach((v) {
        countries!.add(Countries.fromJson(v));
      });
    }
    timeZones = json['time_zones'].cast<String>();
    userLocationInfo = UserLocationInfo.fromJson(json['user_location_info']);

    paymentGateways = json['payment_gateways'].cast<String>();
    adminDetails = json['admin_details'] != null ? AdminDetails.fromJson(json['admin_details']) : null;
    minimumVersion = json['min_versions'] != null ? MinimumVersion.fromJson(json['min_versions']) : null;
    footerText = json['footer_text'];
    googleSocialLogin = json['google_social_login'];
    facebookSocialLogin = json['facebook_social_login'];
  }



  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['business_name'] = businessName;
    data['logo'] = logo;
    data['provider_self_registration'] = providerSelfRegistration;
    data['country_code'] = countryCode;
    data['business_address'] = businessAddress;
    data['business_phone'] = businessPhone;
    data['business_email'] = businessEmail;
    data['base_url'] = baseUrl;
    data['currency_decimal_point'] = currencyDecimalPoint;
    data['currency_symbol_position'] = currencySymbolPosition;
    data['currency_code'] = currencyCode;
    data['terms_and_conditions'] = termsAndConditions;
    data['privacy_policy'] = privacyPolicy;
    data['cancellation_policy'] = cancellationPolicy;
    data['refund_policy'] = refundPolicy;
    data['about_us'] = aboutUs;
    data['country'] = country;
    if (defaultLocation != null) {
      data['default_location'] = defaultLocation!.toJson();
    }
    data['app_url_playstore'] = appUrlAndroid;
    data['app_url_appstore'] = appUrlIos;
    data['sms_verification'] = smsVerification;
    if (mapApiKey != null) {
      data['map_api_key'] = mapApiKey!.toJson();
    }
    data['image_base_url'] = imageBaseUrl;
    data['pagination_limit'] = paginationLimit;
    if (languages != null) {
      data['languages'] = languages!.map((v) => v.toJson()).toList();
    }
    if (currencies != null) {
      data['currencies'] = currencies!.map((v) => v.toJson()).toList();
    }
    if (countries != null) {
      data['countries'] = countries!.map((v) => v.toJson()).toList();
    }
    data['time_zones'] = timeZones;

    data['payment_gateways'] = paymentGateways;
    if (adminDetails != null) {
      data['admin_details'] = adminDetails!.toJson();
    }
    if (minimumVersion != null) {
      data['min_versions'] = minimumVersion!.toJson();
    }
    data['footer_text'] = footerText;
    data['google_social_login'] = googleSocialLogin;
    data['facebook_social_login'] = facebookSocialLogin;

    return data;
  }
}

class DefaultLocation {
  Location? location;

  DefaultLocation({this.location});

  DefaultLocation.fromJson(Map<String, dynamic> json) {
    location = json['default'] != null ?
        Location.fromJson(json['default'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (location != null){
      data['default'] = location!.toJson();
    }
    return data;
  }
}

class Location {
  double? lat;
  double? lon;

  Location({this.lat, this.lon});

  Location.fromJson(Map<String, dynamic> json) {
    lat = double.tryParse(json['lat']);
    lon = double.tryParse(json['lon']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lat'] = lat;
    data['lon'] = lon;
    return data;
  }
}

class MinimumVersion {
  String? minVersionForAndroid;
  String? minVersionForIos;

  MinimumVersion({this.minVersionForAndroid, this.minVersionForIos});


  MinimumVersion.fromJson(Map<String, dynamic> json) {
    minVersionForAndroid = json['min_version_for_android'];
    minVersionForIos = json['min_version_for_ios'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['min_version_for_android'] = minVersionForAndroid;
    data['min_version_for_ios'] = minVersionForIos;
    return data;
  }
}

class MapApiKey {
  String? id;
  String? keyName;
  LiveValues? liveValues;
  LiveValues? testValues;
  String? settingsType;
  String? mode;
  int? isActive;
  String? createdAt;
  String? updatedAt;

  MapApiKey(
      {this.id,
        this.keyName,
        this.liveValues,
        this.testValues,
        this.settingsType,
        this.mode,
        this.isActive,
        this.createdAt,
        this.updatedAt});

  MapApiKey.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    keyName = json['key_name'];
    liveValues = json['live_values'] != null
        ? LiveValues.fromJson(json['live_values'])
        : null;
    testValues = json['test_values'] != null
        ? LiveValues.fromJson(json['test_values'])
        : null;
    settingsType = json['settings_type'];
    mode = json['mode'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['key_name'] = keyName;
    if (liveValues != null) {
      data['live_values'] = liveValues!.toJson();
    }
    if (testValues != null) {
      data['test_values'] = testValues!.toJson();
    }
    data['settings_type'] = settingsType;
    data['mode'] = mode;
    data['is_active'] = isActive;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class LiveValues {
  String? partyName;
  String? mapApiKeyClient;
  String? mapApiKeyServer;

  LiveValues({this.partyName, this.mapApiKeyClient, this.mapApiKeyServer});

  LiveValues.fromJson(Map<String, dynamic> json) {
    partyName = json['party_name'];
    mapApiKeyClient = json['map_api_key_client'];
    mapApiKeyServer = json['map_api_key_server'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['party_name'] = partyName;
    data['map_api_key_client'] = mapApiKeyClient;
    data['map_api_key_server'] = mapApiKeyServer;
    return data;
  }
}

class Languages {
  String? code;
  String? name;
  String? nativeName;

  Languages({this.code, this.name, this.nativeName});

  Languages.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
    nativeName = json['nativeName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['name'] = name;
    data['nativeName'] = nativeName;
    return data;
  }
}

class Currencies {
  String? code;
  String? symbol;
  String? name;

  Currencies({this.code, this.symbol, this.name});

  Currencies.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    symbol = json['symbol'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['symbol'] = symbol;
    data['name'] = name;
    return data;
  }
}

class Countries {
  String? name;
  String? code;

  Countries({this.name, this.code});

  Countries.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['code'] = code;
    return data;
  }
}


class Zones {
  String? id;
  String? name;
  List<Coordinates>? coordinates;
  int? isActive;
  String? createdAt;
  String? updatedAt;
  Pivot? pivot;

  Zones(
      {this.id,
        this.name,
        this.coordinates,
        this.isActive,
        this.createdAt,
        this.updatedAt,
        this.pivot});

  Zones.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    if (json['coordinates'] != null) {
      coordinates = <Coordinates>[];
      json['coordinates'].forEach((v) {
        coordinates!.add(Coordinates.fromJson(v));
      });
    }
    isActive = json['is_active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    pivot = json['pivot'] != null ? Pivot.fromJson(json['pivot']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    if (coordinates != null) {
      data['coordinates'] = coordinates!.map((v) => v.toJson()).toList();
    }
    data['is_active'] = isActive;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (pivot != null) {
      data['pivot'] = pivot!.toJson();
    }
    return data;
  }
}

class Coordinates {
  double? lat;
  double? lng;

  Coordinates({this.lat, this.lng});

  Coordinates.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lng = json['lng'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lat'] = lat;
    data['lng'] = lng;
    return data;
  }
}

class Pivot {
  String? categoryId;
  String? zoneId;

  Pivot({this.categoryId, this.zoneId});

  Pivot.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    zoneId = json['zone_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category_id'] = categoryId;
    data['zone_id'] = zoneId;
    return data;
  }
}

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['url'] = url;
    data['label'] = label;
    data['active'] = active;
    return data;
  }
}


String userLocationInfoToJson(UserLocationInfo data) => json.encode(data.toJson());

class UserLocationInfo {
  String? ip;
  String? countryName;
  String? countryCode;
  String? regionCode;
  String? regionName;
  String? cityName;
  String? zipCode;
  String? isoCode;
  String? postalCode;
  String? latitude;
  String? longitude;
  String? metroCode;
  String? areaCode;
  String? timezone;
  String? driver;

  UserLocationInfo(
      {this.ip,
        this.countryName,
        this.countryCode,
        this.regionCode,
        this.regionName,
        this.cityName,
        this.zipCode,
        this.isoCode,
        this.postalCode,
        this.latitude,
        this.longitude,
        this.metroCode,
        this.areaCode,
        this.timezone,
        this.driver});

  UserLocationInfo.fromJson(Map<String, dynamic> json) {
    ip = json['ip'];
    countryName = json['countryName'];
    countryCode = json['countryCode'];
    regionCode = json['regionCode'];
    regionName = json['regionName'];
    cityName = json['cityName'];
    zipCode = json['zipCode'];
    isoCode = json['isoCode'];
    postalCode = json['postalCode'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    metroCode = json['metroCode'];
    areaCode = json['areaCode'];
    timezone = json['timezone'];
    driver = json['driver'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ip'] = ip;
    data['countryName'] = countryName;
    data['countryCode'] = countryCode;
    data['regionCode'] = regionCode;
    data['regionName'] = regionName;
    data['cityName'] = cityName;
    data['zipCode'] = zipCode;
    data['isoCode'] = isoCode;
    data['postalCode'] = postalCode;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['metroCode'] = metroCode;
    data['areaCode'] = areaCode;
    data['timezone'] = timezone;
    data['driver'] = driver;
    return data;
  }
}

class AdminDetails {
  String? id;
  String? firstName;
  String? lastName;
  String? profileImage;

  AdminDetails(
      {String? id, String? firstName, String? lastName, String? profileImage}) {
    if (id != null) {
      this.id = id;
    }
    if (firstName != null) {
      this.firstName = firstName;
    }
    if (lastName != null) {
      this.lastName = lastName;
    }
    if (profileImage != null) {
      this.profileImage = profileImage;
    }
  }


  AdminDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    profileImage = json['profile_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['profile_image'] = profileImage;
    return data;
  }
}

