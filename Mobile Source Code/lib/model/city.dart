class City {
  final String name;
  final double latitude;
  final double longitude;
  final String arAsset; // 3D AR model dosya yolu (placeholder)
  final List<String> keywords; // Oyun mantığında kullanılacak anahtar kelime listesi
  final List<String> keywordHints; // Anahtar kelimenin kendisini vermeyen ipucu metinleri

  const City({
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.arAsset,
    required this.keywords,
    required this.keywordHints,
  });
}

const City adana = City(
  name: "Adana",
  latitude: 37.0000,
  longitude: 35.3213,
  arAsset: "",
  keywords: [
    "Kebap", "Şalgam", "Sıcak", // kolay
    "Taşköprü", "Büyük Saat", "Sabancı Camii" // orta
  ],
  keywordHints: [
    "Şiş üzerinde mangalda pişirilen lezzetli et yemeği.",
    "Mor havuç ve baharatla yapılan ekşi içecek.",
    "Güneşin çok ısıttığı, terleten hava durumu.",
    "Şehrin ortasından geçen nehir üzerindeki çok eski taş köprü.",
    "Çarşıdaki kocaman tarihi saat kulesi.",
    "Nehir kenarında yükselen, çok büyük beyaz cami."
  ],
);

const City adiyaman = City(
  name: "Adıyaman",
  latitude: 37.7648,
  longitude: 38.2786,
  arAsset: "",
  keywords: [
    "Çiğköfte", "Üzüm", "Halay", // kolay
    "Nemrut Dağı", "Cendere Köprüsü", "Atatürk Barajı" // orta
  ],
  keywordHints: [
    "Eti çiğden yoğurarak yapılan acılı köfte.",
    "Taneleri salkım olan tatlı meyve.",
    "El ele tutuşup müzikle döndükleri halk oyunu.",
    "Dünyaca ünlü dev taş heykellerin olduğu yüksek dağ.",
    "Roma döneminden kalma kemerli eski taş köprü.",
    "Türkiye’nin en büyük barajlarından, Fırat Nehri üzerindeki baraj."
  ],
);

const City afyonkarahisar = City(
  name: "Afyonkarahisar",
  latitude: 38.7507,
  longitude: 30.5567,
  arAsset: "",
  keywords: [
    "Kaymak", "Sucuk", "Lokum", // kolay
    "Afyon Kalesi", "Frig Vadisi", "Kaplıca" // orta
  ],
  keywordHints: [
    "Süt kaynatılarak yapılan kalın, yumuşak süt kreması.",
    "Baharatlı etten yapılan, dilimlenip kızartılan yiyecek.",
    "Şekerli, yumuşak küp şeklinde tatlı şekerleme.",
    "Şehre tepeden bakan büyük kaya üzerindeki kale.",
    "Tarih öncesinden kalma, kayalara oyulmuş yapıları olan vadi.",
    "Şifalı sıcak sularında banyo yapılan yer."
  ],
);

const City agri = City(
  name: "Ağrı",
  latitude: 39.7191,
  longitude: 43.0503,
  arAsset: "",
  keywords: [
    "Kar", "Soğuk", "Dağ", // kolay
    "Ağrı Dağı", "İshak Paşa Sarayı", "Nuh'un Gemisi" // orta
  ],
  keywordHints: [
    "Soğuk havada gökten yağan beyaz taneler.",
    "Üşüten, düşük sıcaklıklı hava.",
    "Yeryüzünde çok yüksek, tepe biçimli coğrafi şekil.",
    "Türkiye’nin en yüksek dağıdır.",
    "Dağın eteğindeki tarihi saray yapısı.",
    "Efsaneye göre bu dağın zirvesine oturduğu söylenen büyük gemi."
  ],
);

const City aksaray = City(
  name: "Aksaray",
  latitude: 38.3687,
  longitude: 34.0370,
  arAsset: "",
  keywords: [
    "Tuz Gölü", "Testi Kebabı", "Soğan", // kolay
    "Ihlara Vadisi", "Hasan Dağı", "Selime Katedrali" // orta
  ],
  keywordHints: [
    "Çok tuzlu suyuyla beyaz kalmış sığ göl.",
    "Toprak testi içinde pişen ünlü et yemeği.",
    "Yemeklere tat veren kat kat beyaz sebze.",
    "İçinde tarihi kiliseler olan derin kanyon vadi.",
    "Sönmüş volkanik dağ, şehrin yakınında yükselir.",
    "Vadinin sonunda kayaya oyma eski manastır."
  ],
);

const City amasya = City(
  name: "Amasya",
  latitude: 40.6499,
  longitude: 35.8353,
  arAsset: "",
  keywords: [
    "Elma", "Kale", "Nehir", // kolay
    "Ferhat ile Şirin", "Kral Kaya Mezarları", "Şehzadeler Şehri" // orta
  ],
  keywordHints: [
    "Yuvarlak, tatlı ve sulu bir meyve.",
    "Şehri tepeden gören, surları olan eski yapı.",
    "Şehrin içinden geçen su yolu.",
    "Aşklarıyla ünlü efsanevi çift, Ferhat’ın dağları delmesiyle tanınır.",
    "Dağ yamacına oyulmuş antik kral mezarları.",
    "Osmanlı’da genç hükümdar adaylarının yetiştiği şehir unvanı."
  ],
);

const City ankara = City(
  name: "Ankara",
  latitude: 39.9208,
  longitude: 32.8541,
  arAsset: "",
  keywords: [
    "Kedi", "Mavi Göl", "Müze", // kolay
    "Anıtkabir", "Kocatepe", "Atakule" // orta
  ],
  keywordHints: [
    "Sokaklarda gezen yumuşak ve sevimli hayvan.",
    "Ankara’da piknik yapılan büyük bir göl.",
    "İçinde eski eşyalar olan, gezip öğrenilen yer.",
    "Türkiye Cumhuriyeti’nin kurucusunun anıt mezarıdır.",
    "Şehrin büyük camilerinden biridir.",
    "Ankara’nın yüksekten göründüğü kule yapısı."
  ],
);

const City antalya = City(
  name: "Antalya",
  latitude: 36.8841,
  longitude: 30.7056,
  arAsset: "",
  keywords: [
    "Deniz", "Plaj", "Portakal", // kolay
    "Düden Şelalesi", "Aspendos", "Yivli Minare" // orta
  ],
  keywordHints: [
    "Yüzüp serinlediğimiz tuzlu su kütlesi.",
    "Deniz kenarında kumlu sahil.",
    "Turuncu kabuklu, sulu ve tatlı bir meyve.",
    "Şehrin içindeki yüksekten dökülen ünlü su şelalesi.",
    "Çok eski zamanlardan kalma, hala konserler yapılan tiyatro.",
    "Selçuklu döneminden kalma, şehrin simgesi tarihi minare."
  ],
);

const City ardahan = City(
  name: "Ardahan",
  latitude: 41.1105,
  longitude: 42.7022,
  arAsset: "",
  keywords: [
    "Peynir", "Bal", "Kış", // kolay
    "Çıldır Gölü", "Atatürk Silueti", "Şeytan Kalesi" // orta
  ],
  keywordHints: [
    "Sütü mayalayarak yapılan kahvaltılık yiyecek.",
    "Arıların çiçeklerden yaptığı tatlı yiyecek.",
    "Kar yağdığı soğuk mevsim.",
    "Kışın buzla kaplanan yüksek rakımlı göl.",
    "Dağ yamacında güneşle beliren ünlü bir yüz silueti.",
    "Sarp kayalık üzerinde bulunan ürkütücü isimli eski kale."
  ],
);

const City artvin = City(
  name: "Artvin",
  latitude: 41.1828,
  longitude: 41.8183,
  arAsset: "",
  keywords: [
    "Orman", "Yeşil", "Boğa", // kolay
    "Kafkasör Festivali", "Çoruh Nehri", "Karagöl" // orta
  ],
  keywordHints: [
    "Birçok ağacın bir arada yetiştiği sık ağaçlık alan.",
    "Yapraklar gibi olan renk, doğayı simgeler.",
    "Arenada güreştirilen boynuzlu büyük hayvan.",
    "Her yıl düzenlenen boğa güreşi ve eğlence festivali.",
    "Coşkun akan, rafting yapılan ünlü nehir.",
    "Etrafı ormanlarla kaplı, manzarasıyla ünlü sakin göl."
  ],
);

const City aydin = City(
  name: "Aydın",
  latitude: 37.8560,
  longitude: 27.8416,
  arAsset: "",
  keywords: [
    "İncir", "Zeytin", "Kuşadası", // kolay
    "Zeybek", "Aphrodisias", "Büyük Menderes" // orta
  ],
  keywordHints: [
    "Tatlı ve yumuşak, kurutulup da yenebilen bir meyve.",
    "Ağacından toplanan, yağı da çıkarılan küçük yuvarlak meyve.",
    "Deniz tatiliyle ünlü turistik ilçe.",
    "Ege yöresine özgü yiğitçe oynanan halk oyunu.",
    "Tarihi heykelleriyle ünlü antik kent kalıntıları.",
    "Ünlü ve uzun nehrin geçtiği bereketli ova."
  ],
);

const City balikesir = City(
  name: "Balıkesir",
  latitude: 39.6484,
  longitude: 27.8826,
  arAsset: "",
  keywords: [
    "Höşmerim", "Zeytin", "Ayvalık", // kolay
    "Kaz Dağı", "Manyas Kuş Cenneti", "Cunda Adası" // orta
  ],
  keywordHints: [
    "Peynir ve şekerle yapılan sarı renkli tatlı.",
    "Yağı çıkarılan küçük yeşil veya siyah meyve.",
    "Ege Denizi kıyısında, tostu ile de ünlü turistik ilçe.",
    "Efsanelere konu olmuş, oksijeni bol yüksek dağ.",
    "Binlerce kuşa ev sahipliği yapan milli park gölü.",
    "Tarihi taş evleri ve manzarasıyla ünlü adacık."
  ],
);

const City bartin = City(
  name: "Bartın",
  latitude: 41.5811,
  longitude: 32.4610,
  arAsset: "",
  keywords: [
    "Amasra", "Çilek", "Balık", // kolay
    "Amasra Kalesi", "İnkumu Plajı", "Ahşap El Sanatı" // orta
  ],
  keywordHints: [
    "Sahilde tarihi kalesiyle ünlü tatil ilçesi.",
    "Kırmızı, tatlı ve üstünde noktacıkları olan küçük meyve.",
    "Denizde yaşayan, yenilebilen yüzgeçli canlı.",
    "Deniz kenarındaki surları olan eski kale.",
    "Upuzun kumlu sahiliyle ünlü koy ve plaj.",
    "Yöreye özgü elde yapılan ahşap süs eşyaları."
  ],
);

const City batman = City(
  name: "Batman",
  latitude: 37.8812,
  longitude: 41.1351,
  arAsset: "",
  keywords: [
    "Petrol", "Yarasa", "Köprü", // kolay
    "Hasankeyf", "Malabadi Köprüsü", "Petrol Rafinerisi" // orta
  ],
  keywordHints: [
    "Arabaların yakıtı olan siyah yer altı sıvısı.",
    "Gece uçan, başaşağı asılan kanatlı memeli.",
    "Türkülere de konu olmuş kemerli taş geçit.",
    "Ilısu Barajı suları altında kalan, mağaralarıyla ünlü antik şehir.",
    "Dicle Nehri üzerindeki tarihi taş köprü.",
    "Ham petrolün işlendiği büyük fabrika tesisi."
  ],
);

const City bayburt = City(
  name: "Bayburt",
  latitude: 40.2552,
  longitude: 40.2249,
  arAsset: "",
  keywords: [
    "Kale", "Şelale", "Bal", // kolay
    "Dede Korkut", "Baksı Müzesi", "Sırakayalar Şelalesi" // orta
  ],
  keywordHints: [
    "Şehre tepeden bakan tarihi taş yapı.",
    "Yüksekten dökülen doğal su perdesi.",
    "Arıların yaptığı tatlı, yapışkan yiyecek.",
    "Ünlü Oğuz masallarını anlatan efsanevi bilge, bu yöreyle anılır.",
    "Şehir yakınlarında modern sanat eserlerinin sergilendiği müze.",
    "Doğal güzelliğiyle ünlü bir dizi şelale."
  ],
);

const City bilecik = City(
  name: "Bilecik",
  latitude: 40.0567,
  longitude: 30.0665,
  arAsset: "",
  keywords: [
    "Ertuğrul", "Türbe", "Mermer", // kolay
    "Şeyh Edebali Türbesi", "Söğüt", "Osmanlı Kuruluşu" // orta
  ],
  keywordHints: [
    "Osmanlı’nın kurucusunun babası olan tarihi kişi.",
    "Önemli bir kişinin mezarının bulunduğu küçük yapı.",
    "Parlak ve sert, heykel ve yapı malzemesi olan taş.",
    "Osman Gazi’nin hocasının türbesi, şehirde ziyarete açıktır.",
    "Osmanlı Devleti’nin doğduğu ilçe, Ertuğrul Gazi’nin diyarı.",
    "1299’da burada temelleri atılan imparatorluğun kuruluş olayı."
  ],
);

const City bingol = City(
  name: "Bingöl",
  latitude: 39.0626,
  longitude: 40.7696,
  arAsset: "",
  keywords: [
    "Bal", "Çiçek", "Göl", // kolay
    "Yüzen Adalar", "Hesarek Kayak Merkezi", "Bingöl Dağları" // orta
  ],
  keywordHints: [
    "Arıların çiçeklerden yaptığı tatlı yiyecek.",
    "Rengarenk açan güzel bitki.",
    "Etrafı kara ile çevrili durgun su birikintisi.",
    "Üzerinde bitki olan, su üstünde dolaşan küçük adacıklar.",
    "Dağda kurulu, kışın kayak yapılan yer.",
    "Türkülere konu olmuş yüksek dağlar ve yaylalar."
  ],
);

const City bitlis = City(
  name: "Bitlis",
  latitude: 38.3938,
  longitude: 42.1232,
  arAsset: "",
  keywords: [
    "Minare", "Şarkı", "Göl", // kolay
    "Bitlis'te Beş Minare", "Nemrut Krater Gölü", "Van Gölü" // orta
  ],
  keywordHints: [
    "Camilerin ince uzun kuleleri.",
    "Dillerde dolaşan melodili halk ezgisi.",
    "Etrafı kara ile çevrili büyük su birikintisi.",
    "Bitlis’i anlatan ünlü türkünün adı.",
    "Sönmüş bir volkanın tepesindeki büyük krater gölü.",
    "Türkiye’nin en büyük gölünün bir kısmı bu ildedir."
  ],
);

const City bolu = City(
  name: "Bolu",
  latitude: 40.5760,
  longitude: 31.5788,
  arAsset: "",
  keywords: [
    "Orman", "Göl", "Aşçı", // kolay
    "Abant Gölü", "Kartalkaya", "Bolu Dağı" // orta
  ],
  keywordHints: [
    "Birçok ağacın bir arada yetiştiği sık ağaçlık alan.",
    "Büyük ve doğal su birikintisi, göl.",
    "Yemek pişiren kişi, Bolu bunun ustalarıyla ünlü.",
    "Çevresi ormanla kaplı, doğal güzelliğiyle ünlü göl.",
    "Kışın kayak yapılan, karla kaplı dağ bölgesi.",
    "İstanbul yolu üzerindeki geçişi meşhur dağlık bölge."
  ],
);

const City burdur = City(
  name: "Burdur",
  latitude: 37.4613,
  longitude: 30.0665,
  arAsset: "",
  keywords: [
    "Göl", "Mağara", "Şiş", // kolay
    "Salda Gölü", "İnsuyu Mağarası", "Sagalassos" // orta
  ],
  keywordHints: [
    "Etrafı kara ile çevrili su kütlesi.",
    "Yeraltında bulunan büyük doğal oyuk.",
    "Et parçalarının dizilip pişirildiği uzun metal çubuk.",
    "Beyaz kumsalı ve turkuaz suyuyla ünlü, Mars’ı andıran göl.",
    "İçinde sarkıtlar ve göller olan, Türkiye’nin ilk turistik mağarası.",
    "Dağ yamacındaki, görkemli çeşmesiyle ünlü antik şehir kalıntıları."
  ],
);

const City bursa = City(
  name: "Bursa",
  latitude: 40.2669,
  longitude: 29.0634,
  arAsset: "",
  keywords: [
    "İskender", "Uludağ", "Kestane Şekeri", // kolay
    "Ulu Cami", "Yeşil Türbe", "Cumalıkızık" // orta
  ],
  keywordHints: [
    "Üstüne yoğurt ve sos dökülen, tereyağlı et döner kebabı.",
    "Şehre bakan, kayak merkeziyle ünlü yüksek dağ.",
    "Şekerde kaynatılarak yapılan tatlı kestane şekeri.",
    "Osmanlı’dan kalma, çok kubbeli büyük cami.",
    "Dışı yeşil çinilerle kaplı Osmanlı sultan türbesi.",
    "Osmanlı döneminden kalma, tarihi köy ve rengarenk evleri."
  ],
);

const City canakkale = City(
  name: "Çanakkale",
  latitude: 40.1553,
  longitude: 26.4142,
  arAsset: "",
  keywords: [
    "At", "Asker", "Boğaz", // kolay
    "Gelibolu Şehitliği", "Truva Antik Kenti", "Aynalı Çarşı" // orta
  ],
  keywordHints: [
    "Binilebilen, Truva efsanesiyle de bilinen dört bacaklı hayvan.",
    "Vatanı savunan üniformalı görevli.",
    "İki denizi birbirine bağlayan dar su geçidi.",
    "Bir dünya savaşında hayatını verenlerin anısına yapılmış anıtların bulunduğu yarımada.",
    "Tahta at efsanesiyle ünlü antik şehir kalıntıları.",
    "Türkülere konu olmuş, şehrin ünlü tarihi çarşısı."
  ],
);

const City cankiri = City(
  name: "Çankırı",
  latitude: 40.6013,
  longitude: 33.6134,
  arAsset: "",
  keywords: [
    "Tuz", "Mağara", "Dağ", // kolay
    "Tuz Mağarası", "Ilgaz Dağı", "Yaran Geceleri" // orta
  ],
  keywordHints: [
    "Yemeklere tat vermek için kullanılan beyaz kristal madde.",
    "Yeraltında bulunan geniş oyuk ve tüneller.",
    "Yer yüzünde çok yüksek, tepe biçimli coğrafi şekil.",
    "İçinde heykeller bile olan, sağlık için gezilen dev tuz madeni.",
    "Kışın kayak yapılan, şarkılara girmiş yüksek dağ.",
    "Yöreye özgü, erkeklerin gösteriler yaptığı geleneksel eğlence toplantıları."
  ],
);

const City corum = City(
  name: "Çorum",
  latitude: 40.5506,
  longitude: 34.9556,
  arAsset: "",
  keywords: [
    "Leblebi", "Pirinç", "Saat Kulesi", // kolay
    "Hattuşa", "Yazılıkaya", "Hitit Güneş Kursu" // orta
  ],
  keywordHints: [
    "Nohuttan yapılan, çıtır çıtır sarı atıştırmalık.",
    "Pilav pişirmekte kullanılan küçük beyaz tahıl.",
    "Şehrin merkezinde zamanı gösteren yüksek kule.",
    "Hitit medeniyetinin başkenti olan antik şehir.",
    "Kayalara oyulmuş Hitit tanrı kabartmalarıyla ünlü tapınak.",
    "Şehrin simgesi olan antik güneş şekilli bronz eser."
  ],
);

const City denizli = City(
  name: "Denizli",
  latitude: 37.7765,
  longitude: 29.0864,
  arAsset: "",
  keywords: [
    "Horoz", "Pamukkale", "Havlu", // kolay
    "Hierapolis", "Laodikya", "Tekstil" // orta
  ],
  keywordHints: [
    "Sabahları ötmesiyle tanınan, renkli tüylü tavuk hayvanı.",
    "Bembeyaz pamuk gibi görünen sıcak su travertenleriyle ünlü yer.",
    "Elimizi yüzümüzü kurulamak için kullanılan kumaş.",
    "Pamukkale’deki antik Roma kenti, görkemli tiyatrosuyla bilinir.",
    "Büyük depremle yıkılmış antik kent, İncil’de adı geçen tarihi şehir.",
    "Havlu ve kumaş üretimiyle ünlü sanayi sektörü."
  ],
);

const City diyarbakir = City(
  name: "Diyarbakır",
  latitude: 37.9144,
  longitude: 40.2306,
  arAsset: "",
  keywords: [
    "Karpuz", "Sur", "Kadayıf", // kolay
    "Diyarbakır Surları", "Ulu Cami", "On Gözlü Köprü" // orta
  ],
  keywordHints: [
    "Yazın serin serin yenen, içi kırmızı yeşil kabuklu büyük meyve.",
    "Şehri çevreleyen yüksek kalın eski duvar.",
    "İncecik tel hamurdan yapılan, şerbetli tatlı.",
    "Dünyanın en uzun şehir surlarından biri, Çin Seddi’nden sonra gelir.",
    "Türkiye’nin en eski camilerinden, avlusuyla ünlü ibadethane.",
    "Dicle Nehri üzerindeki tarihi on kemerli taş köprü."
  ],
);

const City duzce = City(
  name: "Düzce",
  latitude: 40.8438,
  longitude: 31.1565,
  arAsset: "",
  keywords: [
    "Şelale", "Fındık", "Deniz", // kolay
    "Aktaş Şelalesi", "Akçakoca", "Efteni Gölü" // orta
  ],
  keywordHints: [
    "Yüksekten akan köpüklü su, çağlayan.",
    "Küçük kahverengi kabuklu, çikolatalarda da kullanılan yemiş.",
    "Karadeniz’e kıyısı olan plajlı sahil.",
    "Yeşillikler içindeki yüksekten akan ünlü Düzce şelalesi.",
    "Karadeniz kıyısında deniziyle bilinen turistik ilçe.",
    "Birçok kuş türünün yaşadığı doğal göl ve sulak alan."
  ],
);

const City edirne = City(
  name: "Edirne",
  latitude: 41.6818,
  longitude: 26.5623,
  arAsset: "",
  keywords: [
    "Ciğer", "Yağlı Güreş", "Meriç", // kolay
    "Selimiye Camii", "Kırkpınar", "Meriç Köprüsü" // orta
  ],
  keywordHints: [
    "İnce dilimler halinde kızartılan sakatat yemeği.",
    "Pehlivanların vücutlarını yağlayıp er meydanında yaptığı güreş.",
    "Şehirden geçen, sınır oluşturan büyük nehir.",
    "Mimar Sinan’ın ustalık eseri, şehrin simgesi görkemli cami.",
    "Her sene düzenlenen ünlü yağlı güreş festivali.",
    "Meriç Nehri üzerindeki tarihi taş köprü."
  ],
);

const City elazig = City(
  name: "Elazig",
  latitude: 38.6810,
  longitude: 39.2264,
  arAsset: "",
  keywords: [
    "Üzüm", "Ceviz", "Hazar Gölü", // kolay
    "Çayda Çıra", "Harput Kalesi", "Hazar Gölü" // orta
  ],
  keywordHints: [
    "Salkım salkım büyüyen tatlı taneli meyve.",
    "Sert yeşil kabuklu, içi yenilen kuru yemiş.",
    "Etrafında dinlenme yerleri olan büyük doğal göl.",
    "Gece ellerde mumlarla oynanan ünlü halk oyunu.",
    "Şehrin yukarısında, türkülerde de geçen tarihi kale.",
    "İçinde batık şehir de bulunan, çevresi tatil için kullanılan göl."
  ],
);

const City erzincan = City(
  name: "Erzincan",
  latitude: 39.7500,
  longitude: 39.5000,
  arAsset: "",
  keywords: [
    "Peynir", "Üzüm", "Bakır", // kolay
    "Girlevik Şelalesi", "Kemaliye Kanyonu", "Erzincan Bakırı" // orta
  ],
  keywordHints: [
    "Kahvaltıda yenilen tuzlu süt ürünü.",
    "Bağlarda yetişen, taze veya kuru tüketilen meyve.",
    "Parlak turuncu metal, kap-kacak yapımında kullanılır.",
    "Kat kat akan, kışın buz tutan güzel bir şelale.",
    "Derin vadisiyle ünlü, ekstrem sporlara sahne olan kanyon.",
    "El işçiliğiyle yapılan geleneksel bakır süs eşyaları."
  ],
);

const City erzurum = City(
  name: "Erzurum",
  latitude: 39.9000,
  longitude: 41.2700,
  arAsset: "",
  keywords: [
    "Cağ Kebabı", "Soğuk", "Palandöken", // kolay
    "Çifte Minareli Medrese", "Oltu Taşı", "Cirit Oyunu" // orta
  ],
  keywordHints: [
    "Yatay şişte dilimler halinde pişen meşhur et kebabı.",
    "Çok düşük sıcaklıklı, dondurucu hava durumu.",
    "Kışın kayak yapılan, karıyla meşhur yüksek dağ.",
    "Ön cephesindeki iki ince kulecikle ünlü tarihi medrese.",
    "Yumuşak siyah taştan yapılan, tespihleriyle ünlü süs eşyası.",
    "At üzerinde mızrakla oynanan geleneksel spor dalı."
  ],
);

const City eskisehir = City(
  name: "Eskişehir",
  latitude: 39.7767,
  longitude: 30.5206,
  arAsset: "",
  keywords: [
    "Çiğ Börek", "Masal Şatosu", "Tren", // kolay
    "Lületaşı", "Odunpazarı Evleri", "Porsuk Çayı" // orta
  ],
  keywordHints: [
    "Kızgın yağda kızartılan, içi kıymalı yarım ay şeklinde hamur işi.",
    "Çocuklar için yapılmış, masal kahramanlarıyla süslü renkli şato yapısı.",
    "Raylar üzerinde giden ulaşım aracı, şehir modern tramvayıyla ünlü.",
    "Beyaz, sünger taşı gibi madde; pipolar bu taştan yapılır.",
    "Tarihi ahşap Osmanlı evleriyle ünlü eski mahalle.",
    "Şehrin içinden geçen, kenarında gondollar gezilen nehir."
  ],
);

const City gaziantep = City(
  name: "Gaziantep",
  latitude: 37.0662,
  longitude: 37.3833,
  arAsset: "",
  keywords: [
    "Baklava", "Fıstık", "Baharat", // kolay
    "Zeugma Mozaik Müzesi", "Çingene Kızı", "Bakırcılar Çarşısı" // orta
  ],
  keywordHints: [
    "Kat kat hamurlu, fıstıklı şerbetli tatlı.",
    "Yeşil içi olan kabuklu yemiş (Antep’le anılır).",
    "Yemeklere tat veren kokulu toz veya taneli malzeme.",
    "Antik kentten çıkarılan mozaik eserlerin sergilendiği ünlü müze.",
    "Kazılarda bulunmuş, kısmen zarar görmüş ünlü mozaik portre.",
    "Çekiç sesleriyle dolu, bakır kap-kacak yapılan tarihi çarşı."
  ],
);

const City giresun = City(
  name: "Giresun",
  latitude: 40.9128,
  longitude: 38.3895,
  arAsset: "",
  keywords: [
    "Fındık", "Kiraz", "Yağmur", // kolay
    "Giresun Adası", "Giresun Kalesi", "Fındık Festivali" // orta
  ],
  keywordHints: [
    "Çikolatanın içinde de kullanılan küçük kahverengi kuruyemiş.",
    "Yuvarlak, kırmızı, tatlı yaz meyvesi.",
    "Gökyüzünden düşen su damlaları; burada çok yağar.",
    "Karadeniz’in nadir adalarından, efsanelere konu olmuş ada.",
    "Şehrin tepesinde, fındık ağaçlarıyla çevrili tarihi kale.",
    "Her yıl düzenlenen, şehrin ana ürününü kutlayan festival."
  ],
);

const City gumushane = City(
  name: "Gümüşhane",
  latitude: 40.4386,
  longitude: 39.5086,
  arAsset: "",
  keywords: [
    "Pestil", "Köme", "Gümüş", // kolay
    "Karaca Mağarası", "Zigana Geçidi", "Cam Teras" // orta
  ],
  keywordHints: [
    "Yemişlerin ezilip kurutulmasıyla yapılan ince tatlı yaprak.",
    "Cevizlerin meyve şurubuna batırılmasıyla yapılan tatlı sucuk.",
    "Parlak gri değerli metal; eskiden bu şehirde çıkarılırdı.",
    "Sarkıt ve dikitleriyle ünlü yeraltı mağarası.",
    "Sisli ve yüksek dağlar arasındaki geçit yoludur.",
    "Yüksek bir uçurum kenarında, altı cam platformlu seyir yeri."
  ],
);

const City hakkari = City(
  name: "Hakkari",
  latitude: 37.5833,
  longitude: 43.7333,
  arAsset: "",
  keywords: [
    "Lale", "Keçi", "Kilim", // kolay
    "Cilo Dağı", "Zap Suyu", "Koç Başlı Mezarlar" // orta
  ],
  keywordHints: [
    "Başı aşağı doğru bakan, bu yöreye özgü bir ters çiçek.",
    "Dağlık arazide yaşayan boynuzlu, tırmanıcı hayvan.",
    "Elde dokunan, desenli, yere serilen ince halı.",
    "Türkiye’nin en yüksek dağlarından; buzullarıyla ünlü zirve.",
    "Derin vadilerden akan, rafting yapılan coşkun nehir.",
    "Yöredeki eski mezarlarda görülen koç şeklindeki taş heykeller."
  ],
);

const City hatay = City(
  name: "Hatay",
  latitude: 36.4018,
  longitude: 36.3498,
  arAsset: "",
  keywords: [
    "Künefe", "Sabun", "Mozaik", // kolay
    "Habib-i Neccar Camii", "Antakya Müzesi", "Saint Pierre Kilisesi" // orta
  ],
  keywordHints: [
    "İçinde peynir olan, şerbetli tel kadayıf tatlısı.",
    "Yıkanırken kullanılan, defne yapraklı güzel kokulu temizlik malzemesi.",
    "Küçük renkli taşlarla yapılmış büyük resim çalışması.",
    "Türkiye’deki en eski camilerden, farklı dinlerin buluştuğu şehirde yer alır.",
    "Dünyanın en büyük mozaik koleksiyonlarından birine sahip müze.",
    "Kayalara oyulmuş, Hristiyanlarca önemli çok eski bir kilise."
  ],
);

const City igdir = City(
  name: "Iğdır",
  latitude: 39.8880,
  longitude: 44.0048,
  arAsset: "",
  keywords: [
    "Kayısı", "Leylek", "Sınır", // kolay
    "Tuzluca Mağaraları", "Meteor Çukuru", "Aras Kuş Cenneti" // orta
  ],
  keywordHints: [
    "Turuncu renkli tatlı yaz meyvesi; kurutulup da yenir.",
    "Uzun bacaklı, göç eden beyaz-siyah büyük kuş.",
    "İki ülkeyi ayıran çizgi; bu il üç ülkeye komşudur.",
    "Duvarları tuzdan bembeyaz büyük gezilebilir mağaralar.",
    "Göktaşının düştüğü yerde oluşmuş büyük çukur.",
    "Göçmen kuşların konakladığı, kuş gözlemcilerinin uğrak yeri sulak alan."
  ],
);

const City isparta = City(
  name: "Isparta",
  latitude: 37.7648,
  longitude: 30.5566,
  arAsset: "",
  keywords: [
    "Gül", "Elma", "Lavanta", // kolay
    "Gül Yağı", "Eğirdir Gölü", "Halı Dokuması" // orta
  ],
  keywordHints: [
    "Hoş kokulu, dikenli saplı güzel çiçek.",
    "Yuvarlak, kırmızı veya yeşil, sulu meyve.",
    "Mis kokulu mor çiçek tarlalarıyla ünlü bitki.",
    "Isparta güllerinden elde edilen, parfümlerde kullanılan yağ.",
    "Etrafında elma bahçeleri olan berrak büyük göl.",
    "Dünyaca ünlü Isparta halılarının el tezgahında yapımı."
  ],
);

const City istanbul = City(
  name: "İstanbul",
  latitude: 41.0053,
  longitude: 28.9770,
  arAsset: "",
  keywords: [
    "Martı", "Vapur", "Köprü", // kolay
    "Ayasofya", "Topkapı Sarayı", "Kız Kulesi" // orta
  ],
  keywordHints: [
    "Deniz kıyısında uçan beyaz gri kuş.",
    "Yolcuları karşı yakaya taşıyan büyük beyaz şehir teknesi.",
    "Karaları birbirine bağlayan Boğaz üzerindeki dev yapı.",
    "Tarihi yarımadada bulunan, önce kilise sonra cami olmuş muhteşem yapı.",
    "Osmanlı sultanlarının yaşadığı, içinde kutsal emanetler bulunan saray.",
    "Denizin ortasında küçük ada üzerindeki romantik tarihi kule."
  ],
);

const City izmir = City(
  name: "İzmir",
  latitude: 38.4189,
  longitude: 27.1287,
  arAsset: "",
  keywords: [
    "Saat Kulesi", "Boyoz", "Deniz", // kolay
    "İzmir Marşı", "Efes Antik Kenti", "Kordon Boyu" // orta
  ],
  keywordHints: [
    "Şehrin merkezinde, önünde güvercinler uçuşan tarihi saatli kule.",
    "İzmir’e özgü, sabahları yenen yuvarlak çıtır hamur işi.",
    "Ege’nin tuzlu sularıyla kucaklaşan geniş mavi alan.",
    "İstiklal Savaşı’nı ve şehri anlatan coşkulu marş.",
    "Dünyaca ünlü, Celcus Kütüphanesi ile tanınan antik Roma kenti.",
    "Deniz kenarında palmiyeli meşhur gezinti yolu."
  ],
);

const City kahramanmaras = City(
  name: "Kahramanmaraş",
  latitude: 37.5858,
  longitude: 36.9371,
  arAsset: "",
  keywords: [
    "Dondurma", "Biber", "Tarhana", // kolay
    "Sütçü İmam", "İstiklal Madalyası", "Maraş İşi" // orta
  ],
  keywordHints: [
    "Dünyaca ünlü, uzayan buzlu tatlı dondurulmuş süt.",
    "Acılığıyla ünlü kırmızı toz baharatlık sebze.",
    "Yoğurtlu ve baharatlı karışımın kurutulmasıyla yapılan çorba.",
    "İşgal yıllarında halkı direnişe çağıran Maraş kahramanı.",
    "Kurtuluş Savaşı’ndaki kahramanlığından ötürü şehre verilen madalya.",
    "Simli iplikle kumaşa yapılan Maraş’a özgü nakışlı el işi."
  ],
);

const City karabuk = City(
  name: "Karabük",
  latitude: 41.2061,
  longitude: 32.6204,
  arAsset: "",
  keywords: [
    "Lokum", "Safran", "Demir", // kolay
    "Safranbolu Evleri", "Demir Çelik Fabrikası", "Yenice Ormanları" // orta
  ],
  keywordHints: [
    "Nişasta ve şekerle yapılan yumuşak küp tatlı.",
    "Çok değerli bir baharat, adını ilçeye vermiş sarı bitki.",
    "Sert ve ağır metal, şehir büyük fabrikalarıyla ünlü.",
    "UNESCO korumasındaki tarihi ahşap Osmanlı evleri.",
    "Cumhuriyet döneminde kurulan ilk ağır sanayi tesislerinden biri.",
    "Sık ve yaşlı ağaçlarıyla ünlü, doğa yürüyüşlerine uygun ormanlar."
  ],
);

const City karaman = City(
  name: "Karaman",
  latitude: 37.1759,
  longitude: 33.2287,
  arAsset: "",
  keywords: [
    "Buğday", "Türkçe", "Elma", // kolay
    "Karamanoğlu Mehmet Bey", "Yunus Emre", "Manazan Mağaraları" // orta
  ],
  keywordHints: [
    "Una dönüştürülen, başak veren temel tahıl bitkisi.",
    "Bu ilde bir bey tarafından devletin resmi dili ilan edilen dilimiz.",
    "Yuvarlak, sulu ve tatlı meyve (bahçelerinde bol yetişir).",
    "Türkçeyi devlet dili ilan eden Karaman beyi (13. yy).",
    "Ünlü Türk halk şairi, türbesi bu ilimizdedir.",
    "Dağ yamacında insanlarca oyulmuş eski mağara yerleşimleri."
  ],
);

const City kars = City(
  name: "Kars",
  latitude: 40.6167,
  longitude: 43.1000,
  arAsset: "",
  keywords: [
    "Kaz", "Peynir", "Kar", // kolay
    "Ani Harabeleri", "Sarıkamış", "Kars Kalesi" // orta
  ],
  keywordHints: [
    "Gagası ve ayakları turuncu, beyaz büyük çiftlik kuşu (yöresel lezzet).",
    "İnek sütünden yapılan, tekerlek şeklinde ünlü kaşar peyniri.",
    "Yağdığında her yeri beyaza bürüyen soğuk yağış.",
    "Ermenistan sınırında, içinde katedraller olan tarihi şehir kalıntıları.",
    "Çam ormanlarıyla kaplı, kayak merkezi ve şehitleriyle anılan ilçe.",
    "Şehre tepeden bakan, ışıklarla süslü tarihi taş kale."
  ],
);

const City kastamonu = City(
  name: "Kastamonu",
  latitude: 41.3887,
  longitude: 33.7827,
  arAsset: "",
  keywords: [
    "Sarımsak", "Şapka", "Orman", // kolay
    "Küre Dağları", "İstiklal Yolu", "Nasrullah Meydanı" // orta
  ],
  keywordHints: [
    "Yemeklere tat veren, keskin kokulu beyaz dişli bitki.",
    "Başımıza giydiğimiz giysi; bu ilde devrim olarak halka tanıtıldı.",
    "Sık ağaçlı geniş alanlarıyla ünlü yeşil il.",
    "Bakir ormanları ve kanyonlarıyla ünlü milli park.",
    "Kurtuluş Savaşı’nda cephane taşınan tarihi kara yolu.",
    "Atatürk’ün Şapka Devrimi’ni ilan ettiği ünlü cami ve çevresi."
  ],
);

const City kayseri = City(
  name: "Kayseri",
  latitude: 38.7312,
  longitude: 35.4787,
  arAsset: "",
  keywords: [
    "Pastırma", "Mantı", "Erciyes", // kolay
    "Mimar Sinan", "Kültepe", "Sultan Sazlığı" // orta
  ],
  keywordHints: [
    "Çemenle kaplanmış baharatlı kuru et dilimi.",
    "Minik hamur paketlerinde, üzerinde yoğurtla servis edilen et yemeği.",
    "Şehrin yanında yükselen, kışın kayak yapılan büyük volkanik dağ.",
    "Dünya çapında eserler vermiş, Kayseri doğumlu ünlü mimar.",
    "İlk yazılı tabletlerin bulunduğu antik ticaret kenti.",
    "Çok sayıda kuş türüne ev sahipliği yapan geniş sulak alan."
  ],
);

const City kilis = City(
  name: "Kilis",
  latitude: 36.7184,
  longitude: 37.1212,
  arAsset: "",
  keywords: [
    "Zeytin", "Sınır", "Üzüm", // kolay
    "Oylum Höyüğü", "Ravanda Kalesi", "Kilis Künefesi" // orta
  ],
  keywordHints: [
    "Yağı da çıkarılan küçük yeşil meyve (zeytinyağı ile ünlü).",
    "Komşu ülkeyle bitişik olan çizgi (Suriye ile komşu).",
    "Bağlarda yetişen tatlı taneli meyve.",
    "İlin tarihini aydınlatan, kazıları yapılan arkeolojik tepe.",
    "Yüksek tepe üzerinde kalıntıları duran eski kale.",
    "Peynirli şerbetli tatlısıyla komşu il Hatay’a da benzeyen yöresel lezzet."
  ],
);

const City kirikkale = City(
  name: "Kırıkkale",
  latitude: 39.8468,
  longitude: 33.5153,
  arAsset: "",
  keywords: [
    "Fabrika", "Silah", "Kızılırmak", // kolay
    "MKE Silah Fabrikası", "Çeşnigir Köprüsü", "Kırıkkale Rafinerisi" // orta
  ],
  keywordHints: [
    "Üretim yapılan büyük sanayi tesisi.",
    "Atış yapmaya yarayan alet (şehir sanayisiyle anılır).",
    "Türkiye’nin en uzun nehri, ilin yakınından akar.",
    "Ülkenin ilk silah ve çelik fabrikalarının kurulduğu şehir.",
    "Kızılırmak üzerinde Selçuklu’dan kalma tarihi taş köprü.",
    "Ham petrolün işlendiği büyük petrol tesisi."
  ],
);

const City kirklareli = City(
  name: "Kırklareli",
  latitude: 41.7333,
  longitude: 27.2167,
  arAsset: "",
  keywords: [
    "Peynir", "Üzüm", "Ayçiçeği", // kolay
    "İğneada Longozu", "Dupnisa Mağarası", "Hardaliye" // orta
  ],
  keywordHints: [
    "Trakya’nın meşhur tuzlu beyaz inek peyniri.",
    "Bağlarda yetişen, şaraplık olarak da kullanılan tatlı meyve.",
    "Sapsarı tarlalarıyla ünlü, çekirdek veren çiçek.",
    "Su basar orman olarak bilinen, gölleriyle ünlü eşsiz orman.",
    "İçinde yarasalar yaşayan ziyaret edilebilen büyük mağara.",
    "Üzümlerden yapılan, içine hardal tohumu katılan alkolsüz içecek."
  ],
);

const City kirsehir = City(
  name: "Kırşehir",
  latitude: 39.1425,
  longitude: 34.1709,
  arAsset: "",
  keywords: [
    "Türkü", "Çoban", "Kaplıca", // kolay
    "Neşet Ertaş", "Ahi Evran", "Seyfe Gölü" // orta
  ],
  keywordHints: [
    "Halkın dilinde söylenen geleneksel şarkı.",
    "Sürüyü otlatan, kaval çalan kişi.",
    "Sıcak şifalı suyun bulunduğu dinlenme yeri.",
    "Bozkırın Tezenesi lakaplı, ünlü halk ozanı (Kırşehirli).",
    "Esnaf dayanışma teşkilatını kuran, türbesi bu ilde bulunan kişi.",
    "Flamingoların konduğu, suları mevsime göre çekilen tuzlu göl."
  ],
);

const City kocaeli = City(
  name: "Kocaeli",
  latitude: 40.8533,
  longitude: 29.8815,
  arAsset: "",
  keywords: [
    "Pişmaniye", "Fabrika", "Köprü", // kolay
    "Osman Gazi Köprüsü", "Hereke Halısı", "Kartepe" // orta
  ],
  keywordHints: [
    "Tel tel çekilen, un ve şekerden yapılan tatlı yumak.",
    "Üretim yapılan büyük sanayi tesisi (bu il sanayisiyle ünlü).",
    "Denizin üzerinde yükselen, karşı kıyıyı bağlayan yapısal geçit.",
    "İzmit Körfezi’ni geçen, Türkiye’nin en uzun ikinci köprüsüdür.",
    "Dünyaca ünlü ince işçilikli ipek halılarıyla tanınır.",
    "Kışın karla kaplı, kayak merkezi olan yüksek dağ."
  ],
);

const City konya = City(
  name: "Konya",
  latitude: 37.8667,
  longitude: 32.4833,
  arAsset: "",
  keywords: [
    "Etli Ekmek", "Şeker", "Düz", // kolay
    "Mevlana Müzesi", "Çatalhöyük", "Tuz Gölü" // orta
  ],
  keywordHints: [
    "Uzun ince hamur üzerinde kıymalı harcıyla yapılan Konya pizzası.",
    "Çayla da yenen sert beyaz tatlı şeker (Mevlana şekeri).",
    "Deniz gibi uçsuz bucaksız, çok az engebeli arazi.",
    "Yeşil türbesiyle ünlü, Mevlana Celaleddin Rumi’nin dergah müzesi.",
    "İnsanlık tarihinin en eski yerleşimlerinden höyük (Neolitik şehir).",
    "Türkiye’nin ikinci büyük gölü, tuzdan bembeyaz görüntülü."
  ],
);

const City kutahya = City(
  name: "Kütahya",
  latitude: 39.4167,
  longitude: 29.9833,
  arAsset: "",
  keywords: [
    "Çini", "Vazo", "Termal", // kolay
    "Dumlupınar", "Aizanoi", "Kütahya Kalesi" // orta
  ],
  keywordHints: [
    "Fırınlanmış topraktan yapılan, üstü desenli tabak veya karo.",
    "Şehrin simgesi olan dev çiçek vazosu anıtı.",
    "Sıcak sularıyla ünlü kaplıcaları barındırır.",
    "Büyük Taarruz zaferinin kazanıldığı ilçe (şehitlikleriyle ünlü).",
    "Sütunlu Zeus Tapınağı’yla tanınan antik şehir kalıntıları.",
    "Şehre bakan tepede yer alan surlarıyla ünlü tarihi kale."
  ],
);

const City malatya = City(
  name: "Malatya",
  latitude: 38.3552,
  longitude: 38.3095,
  arAsset: "",
  keywords: [
    "Kayısı", "Güneş", "Şire", // kolay
    "Battalgazi Ulu Camii", "Arslantepe", "Kayısı Festivali" // orta
  ],
  keywordHints: [
    "Güneşte kurutularak da yenilen turuncu tatlı meyve.",
    "Doğudan parlayan, şehri ısıtan parlak yıldız.",
    "Kayısıdan yapılan sucuk, pestil gibi kuru tatlı ürünler.",
    "Anadolu’daki en eski camilerden; ahşap direkli tarihi ibadethane.",
    "Dünyanın en eski saray kalıntılarından birine sahip höyük (UNESCO).",
    "Her yıl düzenlenen, ilin meşhur meyvesine adanan şenlik."
  ],
);

const City manisa = City(
  name: "Manisa",
  latitude: 38.6191,
  longitude: 27.4289,
  arAsset: "",
  keywords: [
    "Mesir Macunu", "Üzüm", "Şehzade", // kolay
    "Spil Dağı", "Ağlayan Kaya", "Mesir Festivali" // orta
  ],
  keywordHints: [
    "Osmanlı’dan beri şifalı baharatlardan yapılan tatlı macun.",
    "Bağlarda yetişen, kurutularak sultaniye olarak da bilinen tatlı meyve.",
    "Padişah oğlu prens; Osmanlı’da burada eğitim görmüşlerdir.",
    "Üzerinde kardelen çiçekleri açan, efsanevi Ağlayan Kaya’sıyla ünlü dağ.",
    "Dağ eteğinde, ağlayan bir kadına benzeyen şekliyle ünlü kaya (Niobe).",
    "Her Nevruz’da halka şifalı macun dağıtılan geleneksel festival."
  ],
);

const City mardin = City(
  name: "Mardin",
  latitude: 37.3212,
  longitude: 40.7245,
  arAsset: "",
  keywords: [
    "Taş", "Gümüş", "Sabun", // kolay
    "Midyat Telkarisi", "Deyrulzafaran", "Mardin Evleri" // orta
  ],
  keywordHints: [
    "Mardin evlerinin yapıldığı, güneşte parlayan sarı yapı malzemesi.",
    "İncecik işlenip takılar yapılan değerli metal.",
    "Defne yağından yapılan, doğal kokulu temizlik ürünü.",
    "İnce gümüş tellerden takı yapma sanatı, yörede meşhurdur.",
    "Turuncu taşlı duvarlarıyla ünlü tarihi Süryani manastırı.",
    "Oymalı sarı kalker taşından yapılmış teraslı tarihi evler."
  ],
);

const City mersin = City(
  name: "Mersin",
  latitude: 36.8000,
  longitude: 34.6333,
  arAsset: "",
  keywords: [
    "Tantuni", "Cezerye", "Limon", // kolay
    "Kızkalesi", "Anamur Muzu", "Ashab-ı Kehf" // orta
  ],
  keywordHints: [
    "Sacda kavrulmuş etin lavaşa sarıldığı Mersin dürümü.",
    "Havuçtan yapılan, üzeri hindistanceviziyle kaplı tatlı lokum.",
    "Ekşi sarı turunçgil meyvesi, bu ilde bol yetişir.",
    "Deniz ortasındaki küçük adada bulunan tarihi kale.",
    "Ülkemizde yetişen tropik sarı meyvesiyle ünlü ilçe (muz diyarı).",
    "Yedi Uyurlar Mağarası olarak bilinen, Tarsus’taki ziyaret yeri."
  ],
);

const City mugla = City(
  name: "Muğla",
  latitude: 37.2153,
  longitude: 28.3636,
  arAsset: "",
  keywords: [
    "Deniz", "Plaj", "Yelken", // kolay
    "Ölüdeniz", "Caretta Kaplumbağası", "Bodrum Kalesi" // orta
  ],
  keywordHints: [
    "Yüzmek ve serinlemek için turkuaz rengi geniş su.",
    "Güneşlenilen kumluk deniz kıyısı.",
    "Rüzgarla ilerleyen beyaz üçgen kanatlı tekne.",
    "Durgun masmavi suyuyla ünlü, dünya çapında tanınan plaj.",
    "Koruma altındaki büyük deniz kaplumbağası türü.",
    "Limanı koruyan, içinde müzesi bulunan ortaçağ kalesi."
  ],
);

const City mus = City(
  name: "Muş",
  latitude: 38.9462,
  longitude: 41.7539,
  arAsset: "",
  keywords: [
    "Lale", "Ova", "Süt", // kolay
    "Malazgirt Meydan Muharebesi", "Muş Ovası", "Lale Festivali" // orta
  ],
  keywordHints: [
    "Bahar geldiğinde Muş Ovası’nı süsleyen kırmızı çiçek.",
    "Etrafı dağlarla çevrili geniş düz arazi.",
    "İneğin sağılmasıyla elde edilen beyaz içecek.",
    "1071’de Alparslan’ın Bizans’ı yendiği tarihî savaş.",
    "Türkülere konu olmuş verimli geniş ova.",
    "Her bahar ovayı kırmızıya boyayan çiçek şerefine yapılan şenlik."
  ],
);

const City nevsehir = City(
  name: "Nevşehir",
  latitude: 38.6939,
  longitude: 34.6857,
  arAsset: "",
  keywords: [
    "Peri Bacaları", "Balon", "At", // kolay
    "Kapadokya", "Derinkuyu Yeraltı Şehri", "Göreme Açık Hava Müzesi" // orta
  ],
  keywordHints: [
    "Rüzgar ve yağmurun oluşturduğu ilginç şekilli taş sütunlar.",
    "Sabah gökyüzünü rengarenk süsleyen sepetli hava aracı.",
    "Sırtına binilen dört nala koşan evcil hayvan.",
    "Peri bacaları diyarı ünlü turistik bölgenin adı.",
    "Binlerce kişinin barınabildiği, yerin altına oyulmuş antik şehir.",
    "Kayalara oyma kiliseleriyle ünlü, UNESCO listesindeki açık hava müzesi."
  ],
);

const City nigde = City(
  name: "Niğde",
  latitude: 37.9667,
  longitude: 34.6833,
  arAsset: "",
  keywords: [
    "Patates", "Elma", "Gazoz", // kolay
    "Tyana Su Kemeri", "Aladağlar", "Gümüşler Manastırı" // orta
  ],
  keywordHints: [
    "Toprağın altında yetişen, kızartması çok sevilen yumru sebze.",
    "Yuvarlak, tatlı ve sulu meyve (bahçelerinde bol yetişir).",
    "Rengarenk meyveli, sodalı, tatlı içecek (meşhur bir marka adıyla anılır).",
    "Roma döneminden kalma, su taşımaya yarayan kemerli yüksek yapı.",
    "Dik zirveleriyle ünlü, dağcılık yapılan milli park dağları.",
    "Kayalara oyulmuş, duvar resimli eski manastır yapısı."
  ],
);

const City ordu = City(
  name: "Ordu",
  latitude: 40.9839,
  longitude: 37.8764,
  arAsset: "",
  keywords: [
    "Fındık", "Yeşil", "Teleferik", // kolay
    "Boztepe", "Perşembe Yaylası", "Yason Burnu" // orta
  ],
  keywordHints: [
    "Çikolatanın içinde de olan küçük yuvarlak kuruyemiş.",
    "Doğayı simgeleyen renk; yaylaları bu renge bürünür.",
    "Yüksek bir tepeden şehri izleten, havada asılı giden vagonlu taşıt.",
    "Şehir manzaralı, teleferikle çıkılan ordu tepesi.",
    "Kıvrılarak akan dereleriyle ünlü çimenlik yayla.",
    "Denize uzanan, eski kilisesiyle bilinen tarihi yarımada."
  ],
);

const City osmaniye = City(
  name: "Osmaniye",
  latitude: 37.2130,
  longitude: 36.1763,
  arAsset: "",
  keywords: [
    "Yer fıstığı", "Portakal", "Yayla", // kolay
    "Karatepe-Aslantaş", "Amanos Dağları", "Zorkun Yaylası" // orta
  ],
  keywordHints: [
    "Kabuğu iki parçalı, kavrulup tuzlanan kuruyemiş (yer altında büyür).",
    "Turunçgillerden, suyu sıkılan, C vitamini dolu meyve.",
    "Yazın serinlemek için çıkılan dağlık yüksek yer.",
    "Hitit dönemi kabartmalarıyla ünlü açık hava müzesi ve antik kale.",
    "Çukurova kenarında, yemyeşil ormanlarla kaplı sıradağlar.",
    "Yazın halkın çıktığı, şenlikleriyle bilinen serin dağ yaylası."
  ],
);

const City rize = City(
  name: "Rize",
  latitude: 41.0201,
  longitude: 40.5234,
  arAsset: "",
  keywords: [
    "Çay", "Yağmur", "Hamsi", // kolay
    "Ayder Yaylası", "Kaçkar Dağları", "Anzer Balı" // orta
  ],
  keywordHints: [
    "Sıcak olarak içilen, bu ilde yeşil bahçelerde yetişen yaprak içeceği.",
    "Hemen her gün yağan, şehri yemyeşil yapan hava olayı.",
    "Karadeniz’de bol bulunan, çeşitli yemekleri yapılan küçük balık.",
    "Kaplıcası ve şenlikleriyle ünlü, çam ormanlı yüksek yayla.",
    "Ülkenin en yeşil zirvelerine sahip sıradağlar silsilesi.",
    "Dünyaca ünlü şifalı çiçek balı (yayla balı)."
  ],
);

const City sakarya = City(
  name: "Sakarya",
  latitude: 40.6940,
  longitude: 30.4358,
  arAsset: "",
  keywords: [
    "Ayçiçeği", "Mısır", "Köfte", // kolay
    "Sapanca Gölü", "Taraklı Evleri", "Sakarya Nehri" // orta
  ],
  keywordHints: [
    "Sarı tarlalarıyla ünlü çekirdek veren çiçek.",
    "Haşlaması sevilerek yenilen sarı taneli bitki (daneli mısır).",
    "Izgarada pişen, ekmek suyuna banılarak sunulan özel köfte türü.",
    "İstanbul’a yakın, kenarında tesisler olan tatlı su gölü.",
    "Osmanlı’dan kalma tarihi evleriyle ünlü sakin ilçe.",
    "Ülkenin önemli nehirlerinden, adını ile veren akarsu."
  ],
);

const City samsun = City(
  name: "Samsun",
  latitude: 41.2928,
  longitude: 36.3313,
  arAsset: "",
  keywords: [
    "Pide", "Atatürk", "Liman", // kolay
    "Bandırma Vapuru", "Çarşamba Ovası", "Amisos Tepesi" // orta
  ],
  keywordHints: [
    "Teknesi uzun, içinde peynirli ya da kıymalı Karadeniz hamur yemeği.",
    "Milli Mücadele’yi başlatmak için 19 Mayıs 1919’da Samsun’a çıkan lider.",
    "Gemilerin yük boşalttığı, yolcu indirdiği büyük iskele.",
    "Mustafa Kemal’i 19 Mayıs’ta Samsun’a getiren, şimdi müze olan gemi.",
    "Yeşilırmak’ın suladığı, verimli tarım yapılan geniş ova.",
    "Teleferikle çıkılan, Amazon heykeli bulunan şehir tepesi."
  ],
);

const City sanliurfa = City(
  name: "Şanlıurfa",
  latitude: 37.1591,
  longitude: 38.7969,
  arAsset: "",
  keywords: [
    "Balıklıgöl", "İsot", "Peygamber", // kolay
    "Göbeklitepe", "Halfeti", "Sıra Gecesi" // orta
  ],
  keywordHints: [
    "İçinde kutsal sayılan balıkların yüzdüğü tarihi göl.",
    "Yöreye özgü kurutulmuş acı kırmızı biber.",
    "İbrahim ve Eyüp gibi birçok peygamberle anılan şehir.",
    "Dünyanın en eski tapınak kalıntılarına sahip arkeolojik alan.",
    "Sular altında kalan güllü karagül diyarı sakin ilçe (tekne turlu).",
    "Türküler söylenen, çiğköfte yoğrulan geleneksel dost meclisi gecesi."
  ],
);

const City siirt = City(
  name: "Siirt",
  latitude: 37.9333,
  longitude: 41.9500,
  arAsset: "",
  keywords: [
    "Fıstık", "Bal", "Battaniye", // kolay
    "Büryan Kebabı", "Veysel Karani Türbesi", "Siirt Fıstığı" // orta
  ],
  keywordHints: [
    "Kabuklu yeşil içi olan lezzetli yemiş (Antep’inkinden farklı).",
    "Çiçeklerin özünden arılarca yapılan tatlı yiyecek (Pervari ile ünlü).",
    "Sıcacık tutan, yün dokuma kalın örtü (yöresel ürünü meşhur).",
    "Toprağa kazılan kuyuda pişen tandır kebabı (sabah yenir).",
    "Şehirde bulunan, İslam tarihinde önemli bir zatın türbesi.",
    "Antep fıstığına göre daha büyük taneli, yöreye özgü yemiş türü."
  ],
);

const City sinop = City(
  name: "Sinop",
  latitude: 42.0231,
  longitude: 35.1531,
  arAsset: "",
  keywords: [
    "Mantı", "Cezaevi", "Fok", // kolay
    "İnceburun Feneri", "Tarihi Cezaevi", "Hamsilos Koyu" // orta
  ],
  keywordHints: [
    "Cevizli harcıyla ünlü küçük hamur bohçası yemeği.",
    "Şehrin ünlü tarihi hapishanesi (artık müze olarak gezilir).",
    "Karadeniz kıyılarında yaşayan, nesli korunan yüzücü memeli.",
    "Türkiye’nin en kuzey ucundaki uçurumda yer alan deniz feneri.",
    "Türkülere konu olmuş, şimdi müze olan ünlü hapishane.",
    "Buzul aşındırmasıyla oluşmuş, ağaçlarla çevrili sakin koy."
  ],
);

const City sivas = City(
  name: "Sivas",
  latitude: 39.7477,
  longitude: 37.0179,
  arAsset: "",
  keywords: [
    "Köpek", "Aşık", "Madımak", // kolay
    "Sivas Kongresi", "Divriği Ulu Camii", "Balıklı Kaplıca" // orta
  ],
  keywordHints: [
    "Sürüyü koruyan iri ve güçlü çoban köpeği (Kangal).",
    "Saz çalıp halk türküleri söyleyen ozan kişi.",
    "Yemek olarak pişirilen, yörede yetişen yeşil ot.",
    "Mustafa Kemal’in 1919’da milli kararların alındığı önemli buluşması.",
    "Kapı motifleriyle ünlü, UNESCO listesinde Selçuklu yapısı cami ve şifahane.",
    "Hastaların cildini yiyerek tedavi eden balıklarıyla ünlü kaplıca."
  ],
);

const City sirnak = City(
  name: "Şırnak",
  latitude: 37.4187,
  longitude: 42.4918,
  arAsset: "",
  keywords: [
    "Cudi", "Sınır", "Petrol", // kolay
    "Nuh'un Gemisi", "Cizre Ulu Camii", "Cudi Festivali" // orta
  ],
  keywordHints: [
    "Nuh peygamberin gemisinin indiğine inanılan dağ.",
    "Komşu ülke ile çizilen hudut hattı (Irak’a komşu).",
    "Yer altından çıkarılan değerli siyah yakıt.",
    "Tufan sonrası geminin oturduğu rivayet edilen efsane.",
    "Ünlü İslam âlimi Cezeri’nin memleketindeki tarihi cami.",
    "Yıllar sonra tekrar düzenlenen, dağda yapılan kültür festivali."
  ],
);

const City tekirdag = City(
  name: "Tekirdağ",
  latitude: 40.9833,
  longitude: 27.5167,
  arAsset: "",
  keywords: [
    "Köfte", "Üzüm", "Rüzgar", // kolay
    "Şarköy Bağları", "Namık Kemal", "Tekirdağ Rakısı" // orta
  ],
  keywordHints: [
    "Izgarada pişen, yanında özel sosla sunulan meşhur köfte.",
    "Bağlarda yetişen, kurutularak pekmez de yapılan tatlı meyve.",
    "Yeldeğirmenlerini döndüren kuvvetli hava akımı, bu bölgede eser.",
    "Deniz manzaralı tepelerde uzanan üzüm bağları bölgesi.",
    "Vatan şairi olarak bilinen, burada doğmuş ünlü şair-yazar.",
    "Adı şehirle özdeşleşmiş, anason kokulu üzüm içeceği (yetişkinlere mahsus)."
  ],
);

const City tokat = City(
  name: "Tokat",
  latitude: 40.3167,
  longitude: 36.5500,
  arAsset: "",
  keywords: [
    "Yaprak", "Ceviz", "Kebab", // kolay
    "Ballıca Mağarası", "Tokat Kalesi", "Yağıbasan Medresesi" // orta
  ],
  keywordHints: [
    "Dolma yapmak için kullanılan salamura üzüm yaprağı (meşhur ürün).",
    "Sert kabuklu, içi yenilen faydalı kuru yemiş.",
    "Et, patlıcan, domates ve biberle şişlerde pişirilen yöresel kebap.",
    "Dünyanın en büyük mağaralarından, sarkıt ve dikitlerle dolu yeraltı harikası.",
    "Şehre tepeden bakan, efsanevi Drakula’nın esir tutulduğu rivayet edilen kale.",
    "Anadolu’nun ilk medreselerinden, Danişmendlilerden kalma eğitim yapısı."
  ],
);

const City trabzon = City(
  name: "Trabzon",
  latitude: 41.0015,
  longitude: 39.7178,
  arAsset: "",
  keywords: [
    "Hamsi", "Trabzonspor", "Kemençe", // kolay
    "Sümela Manastırı", "Uzungöl", "Trabzon Kalesi" // orta
  ],
  keywordHints: [
    "Karadeniz’in küçük lezzetli balığı, 40 çeşit yemeği yapılır derler.",
    "Bordo-mavi renkleriyle ünlü, şampiyonluklar kazanmış futbol takımı.",
    "Karadeniz türkü ve horonlarında çalınan küçük üç telli yaylı saz.",
    "Dağ yamacına kurulmuş, fresklerle dolu ünlü manastır.",
    "Dağlar arasında kartpostal güzelliğiyle bilinen turistik göl.",
    "Şehrin etrafını kuşatan Komnenoslardan kalma sur ve burçlar."
  ],
);

const City tunceli = City(
  name: "Tunceli",
  latitude: 39.3074,
  longitude: 39.4388,
  arAsset: "",
  keywords: [
    "Dağ Keçisi", "Munzur", "Bal", // kolay
    "Munzur Vadisi", "Dersim", "Cemevi" // orta
  ],
  keywordHints: [
    "Yüksek kayalıklarda gezen, koruma altındaki yaban hayvanı.",
    "Doğal güzelliğiyle ünlü, kırmızı benekli balıkları olan akarsu.",
    "Çiçekleri bol dağlarda üretilen lezzetli yayla balı.",
    "Endemik bitkileri ve su kaynaklarıyla ünlü korunan vadi.",
    "İlin eski adı; tarihi ve kültürel geçmişini yansıtır.",
    "Alevi vatandaşların ibadet ve toplanma yeri olan kültürel mekan."
  ],
);

const City usak = City(
  name: "Uşak",
  latitude: 38.6823,
  longitude: 29.4082,
  arAsset: "",
  keywords: [
    "Halı", "Tarhana", "İplik", // kolay
    "Ulubey Kanyonu", "Karun Hazineleri", "Blaundus Antik Kenti" // orta
  ],
  keywordHints: [
    "El dokumasıyla ünlü büyük yer yaygısı.",
    "Yoğurtlu ve baharatlı karışımın kurutulmasıyla yapılan çorba malzemesi.",
    "Kumaş dokumak için kullanılan uzun ince lif (sanayisiyle ünlü).",
    "Dünyanın ikinci en büyük kanyonu olarak bilinen doğa harikası vadi.",
    "Bu yörede bulunan, Lidya Kralı Karun’a ait olduğu düşünülen ünlü altın hazineler.",
    "Kendine özgü köprü kalıntılarıyla bilinen Uşak’taki antik şehir."
  ],
);

const City van = City(
  name: "Van",
  latitude: 38.4891,
  longitude: 43.4089,
  arAsset: "",
  keywords: [
    "Kedi", "Göl", "Kahvaltı", // kolay
    "Akdamar Kilisesi", "Van Kedisi Evi", "İnci Kefali" // orta
  ],
  keywordHints: [
    "Bir gözü mavi bir gözü yeşil olabilen, beyaz tüylü ünlü kedi.",
    "Türkiye’nin en büyük gölü, sodalı suyuyla tanınır.",
    "Çeşit çeşit peynir, bal ve daha fazlasıyla donatılan sabah sofrası.",
    "Van Gölü’ndeki adada bulunan, dışı kabartmalı tarihi Ermeni kilisesi.",
    "Saf Van kedilerinin korunduğu ve görülebildiği merkez.",
    "Sadece Van Gölü’nde yaşayan, üreme göçüyle ünlü balık türü."
  ],
);

const City yalova = City(
  name: "Yalova",
  latitude: 40.6500,
  longitude: 29.2667,
  arAsset: "",
  keywords: [
    "Termal", "Feribot", "Süs Bitkisi", // kolay
    "Yürüyen Köşk", "Termal Kaplıcalar", "Armutlu" // orta
  ],
  keywordHints: [
    "Sıcak sularıyla şifa sunan kaplıcalarıyla ünlü yer.",
    "İstanbul’a yolcu taşıyan büyük deniz ulaşım aracı.",
    "Seralarda yetiştirilen rengarenk çiçekler ve bitkiler (fidanlıkları meşhur).",
    "Atatürk’ün bir çınar ağacını kesmemek için yerini değiştirdiği tarihî köşk.",
    "Atatürk’ün de ziyaret ettiği, doğal sıcak su banyolarıyla ünlü tesisler.",
    "Deniz kenarında kaplıca ve tatil siteleriyle bilinen turistik ilçe."
  ],
);

const City yozgat = City(
  name: "Yozgat",
  latitude: 39.8181,
  longitude: 34.8147,
  arAsset: "",
  keywords: [
    "Testi Kebabı", "Çamlık", "Saat Kulesi", // kolay
    "Roma Hamamı", "Kerkenes Harabeleri", "Çapanoğlu Camii" // orta
  ],
  keywordHints: [
    "Toprak güveç içinde pişirilip kırılarak servis edilen et yemeği.",
    "Türkiye’nin ilk milli parkı olan sık çam ormanı.",
    "Şehrin merkezinde yükselen tarihi saatli kule.",
    "Sarıkaya ilçesinde sıcak suyu hâlâ akan antik Roma hamam kalıntısı.",
    "Paphlagonya bölgesine ait olduğu düşünülen antik şehir kalıntıları.",
    "Osmanlı’nın son döneminde yapılmış gösterişli tarihî cami."
  ],
);

const City zonguldak = City(
  name: "Zonguldak",
  latitude: 41.4564,
  longitude: 31.7987,
  arAsset: "",
  keywords: [
    "Kömür", "Tünel", "Çilek", // kolay
    "Maden Ocağı", "Uzun Mehmet", "Fener Mahallesi" // orta
  ],
  keywordHints: [
    "Yer altından çıkarılan, yakıt olarak kullanılan siyah taş.",
    "İşçilerin yer altına inip kömür kazdığı uzun geçit.",
    "Karadeniz Ereğli’nin küçük, kokulu meşhur meyvesi.",
    "Cumhuriyet’in ilk döneminden beri işletilen kömür madeni.",
    "1829’da taş kömürünü bulan Zonguldaklı, anısına adı yaşatılıyor.",
    "Tarihi evleri ve deniz feneriyle ünlü, yüksek mahalle."
  ],
);
