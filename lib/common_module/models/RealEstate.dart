
class RealEstate{
  final int id;
  final String adsName;
  final String realEstatePlace;
  final String realEstateType;
  final String adsType;
  final String latitude;
  final String longtude;
  final String currencyType;
  final String realEstatePrice;
  final int phone;
  final String createdAt;
  final String realEstateImage;
  final int realEstateSpace;
  final String realEstateRecuratementPeriod;
  final int roomsNumber;
  final int holsNumber;
  final int pathRoomsNumber;
  final int storeNumber;
  final int realEstateAge;
  final String otherInfo;
  final int flatsNumber;
  final int userId;
  final int viewsNumber;

  RealEstate({
    this.id, this.adsName, this.realEstatePlace, this.realEstateType, this.adsType, this.latitude, this.longtude,
      this.currencyType, this.realEstatePrice, this.phone, this.createdAt, this.realEstateImage, this.realEstateSpace,
      this.realEstateRecuratementPeriod, this.roomsNumber, this.holsNumber, this.pathRoomsNumber, this.storeNumber,
      this.realEstateAge, this.otherInfo, this.flatsNumber, this.userId, this.viewsNumber});

  static List<RealEstate> getRealEstates(){
    List<RealEstate> items = <RealEstate>[];

    items.add(RealEstate(
      id: 1,
      adsName: 'شقة للبيع',
      realEstatePlace: 'ام درمان-المهندسين',
      realEstateType: 'شقة',
      adsType: 'بيع',
      latitude: '32,42225252552551515',
      longtude: '15,94932955525194911',
      currencyType: 'جنيه',
      realEstatePrice: '2,000,000',
      phone: 2499688800160,
      createdAt: '20/12/2020',
      realEstateImage: 'assets/images/700_431-6-4.png',
      realEstateSpace: 2000,
      roomsNumber: 10,
      holsNumber: 3,
      pathRoomsNumber: 4,
      storeNumber: 2,
      realEstateAge: 2,
      otherInfo: 'شقة بحالة جيدة تحتوي علي عفش جديد',
      flatsNumber: 1,
      viewsNumber: 50
    ));

    items.add(RealEstate(
        id: 1,
        adsName: 'شقة للإيجار',
        realEstatePlace: 'بحري-كافوري',
        realEstateType: 'شقة',
        adsType: 'ايجار',
        latitude: '32,42225252552551515',
        longtude: '15,94932955525194911',
        currencyType: 'جنيه',
        realEstatePrice: '2,000,000',
        phone: 2499688800160,
        createdAt: '20/12/2020',
        realEstateImage: 'assets/images/226586652.jpeg',
        realEstateSpace: 2000,
        roomsNumber: 10,
        holsNumber: 3,
        pathRoomsNumber: 4,
        storeNumber: 2,
        realEstateAge: 2,
        otherInfo: 'شقة بحالة جيدة تحتوي علي عفش جديد',
        flatsNumber: 1,
        viewsNumber: 50
    ));

    items.add(RealEstate(
        id: 1,
        adsName: 'شقة للبيع',
        realEstatePlace: 'الخرطوم-الرياض',
        realEstateType: 'شقة',
        adsType: 'بيع',
        latitude: '32,42225252552551515',
        longtude: '15,94932955525194911',
        currencyType: 'جنيه',
        realEstatePrice: '2,000,000',
        phone: 2499688800160,
        createdAt: '20/12/2020',
        realEstateImage: 'assets/images/2016497762_2_1_200916_080331-w2314-h1300.jpeg',
        realEstateSpace: 2000,
        roomsNumber: 10,
        holsNumber: 3,
        pathRoomsNumber: 4,
        storeNumber: 2,
        realEstateAge: 2,
        otherInfo: 'شقة بحالة جيدة تحتوي علي عفش جديد',
        flatsNumber: 1,
        viewsNumber: 50
    ));

    items.add(RealEstate(
        id: 1,
        adsName: 'شقة للإيجار',
        realEstatePlace: 'امدرمان-العرضة',
        realEstateType: 'شقة',
        adsType: 'ايجار',
        latitude: '32,42225252552551515',
        longtude: '15,94932955525194911',
        currencyType: 'جنيه',
        realEstatePrice: '2,000,000',
        phone: 2499688800160,
        createdAt: '20/12/2020',
        realEstateImage: 'assets/images/ae5768b8dd7560.jpg',
        realEstateSpace: 2000,
        roomsNumber: 10,
        holsNumber: 3,
        pathRoomsNumber: 4,
        storeNumber: 2,
        realEstateAge: 2,
        otherInfo: 'شقة بحالة جيدة تحتوي علي عفش جديد',
        flatsNumber: 1,
        viewsNumber: 50
    ));

    items.add(RealEstate(
        id: 1,
        adsName: 'شقة للبيع',
        realEstatePlace: 'الخرطوم المنشية',
        realEstateType: 'شقة',
        adsType: 'بيع',
        latitude: '32,42225252552551515',
        longtude: '15,94932955525194911',
        currencyType: 'جنيه',
        realEstatePrice: '2,000,000',
        phone: 2499688800160,
        createdAt: '20/12/2020',
        realEstateImage: 'assets/images/House-Under-Blue-Sky-021816.jpg',
        realEstateSpace: 2000,
        roomsNumber: 10,
        holsNumber: 3,
        pathRoomsNumber: 4,
        storeNumber: 2,
        realEstateAge: 2,
        otherInfo: 'شقة بحالة جيدة تحتوي علي عفش جديد',
        flatsNumber: 1,
        viewsNumber: 50
    ));

    return items;
  }
}

class RealEstateType{
  final int id;
  final String type;

  RealEstateType(this.id, this.type);

  static List<RealEstateType> getRealEstatesTypes() {
    List<RealEstateType> items = <RealEstateType>[];
    
    items.add(RealEstateType(1, 'شقة'));
    items.add(RealEstateType(2, 'فيلا'));
    items.add(RealEstateType(3, 'عمارة'));
    items.add(RealEstateType(4, 'بيت'));
    items.add(RealEstateType(5, 'ارض'));
    return items;
  }
}

class AdsType{
  final int id;
  final String type;

  AdsType(this.id, this.type);

  static List<AdsType> getAdsTypes() {
    List<AdsType> items = <AdsType>[];

    items.add(AdsType(1, 'بيع'));
    items.add(AdsType(2, 'إيجار'));
    return items;
  }
}

class CurrencyType{
  final int id;
  final String currency;

  CurrencyType(this.id, this.currency);

  static List<CurrencyType> getCurrencyTypes() {
    List<CurrencyType> items = <CurrencyType>[];

    items.add(CurrencyType(1, 'جنيه'));
    items.add(CurrencyType(2, 'دولار'));
    return items;
  }
}

class Status{
  final int id;
  final String state;

  Status(this.id, this.state);

  static List<Status> getStatus() {
    List<Status> items = <Status>[];

    items.add(Status(1, 'نشط'));
    items.add(Status(2, 'غير نشط'));
    return items;
  }
}
