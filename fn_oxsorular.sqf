/*	
	Dosya Adı: fn_oxsorular.sqf	
	Geliştirici: SalihF7
	
*/
if (life_oxsoru) exitWith {hint "AKTIF BIR SORU VARKEN YENI SORU SORAMAZSIN!";};
_sure = _this select 0;

private _katilimcilar = [];
{
	if (_x distance (getMarkerPos 'yarisma_orta_1') < 250) then {
		_katilimcilar pushBack _x;
	};
} forEach playableUnits;

// Sorular
// 0 Soru Cevabı yanlışı ifade eder
// 1 Soru cevabı doğru ifade eder

_sorular = [
	[1,"Arma 3 2013 Yılında Çıkmıştır."],
	[0,"MK200 Silahının Şarjörü 100 Mermilidir."],
	[0,"MK18 DLC İsteyen Bir Silahtır."],
	[1,"Arma 3 Bohemia Interactive Tarafından Yapılmıştır."],
	[0,"Katiba Silahının Kalibresi 5.56'Dır"],
	[1,"FATİH SULTAN MEHMETİN BABASI II.MURAT Dır."],
	[0,"Magna Carta Fransız Kralı ile Halkı Tarafından imzalanmış Bir Sözleşmedir."],
	[0,"Su Periyodik Tabloda Bir Elementtir."],
	[1,"2,5 Sayısı Bir Doğal Sayı Değildir."],
	[0,"Galatasaray UEFA 2001 Şampiyonu Olarak UEFA Şampiyonu Olan Tek Türk Takımıdır."],
	[1,"Kıbrıs Barış Harekatı 1974 Yılında Gerçekleştirilmiştir."],
	[1,"Lizazom Bir Hücrede Bulunabilen Organeldir"],
	[1,"Fransız İhtilali 1789-1799 Yılları Arasında Gerçekleşmiştir."],
	[0,"Penguen Memeli Bir Hayvandır."],
	[1,"Newton(N) Kuvvetin Birimidir."],
	[0,"Türk Kara Kuvvetlerinin Kuruluş Yılı 1071 Malazgirit Muharebesi Tarihi Olan 1071. Baz Almaktadır."],
	[0,"İstiklal Marşı 1920 Yılında Mehmet Akif Ersoy Tarafından Yazılmıştır."],
	[0,"Türkiyenin En Fazla Yağış Alan İli Trabzon dur"],
	[1,"Gülü İle Meşhur Olan İlimiz Isparta dır."],
	[1,"Seyahatname Adlı Eserin Yazarı Evliye Çelebi Dir."],
	[1,"Balina Memeli Türünde Bir Balıktır."],
	[1,"ünyada İlk Evcirleştirilmiş Hayvan Köpektir."],
	[0,"1071’de yapılan Malazgirt Savaşıyla Anadolu’nun kapılarını Türklere açan Selçuklu Sultanı Sultan Alaadin Keykubattır."],
	[1,"Milli mücadele döneminde işgallere karşı direnen düzensiz birliklerin adı  Kuvâ-yi Milliye Dir."],
	[1,"Bukelamun Sürüngen Bİr Hayvandır."],
	[1,"Kabakulak Cocukken Geçirilebilen bir hastalıktır."],
	[1,"Erciyes Volkanik Bir Dağdır."],
	[0,"Yahya Kemal Bayatlı İstiklal Şairi Olarak anılmaktadır."],
	[1,"Yazları sıcak ve kurak; kışları ise soğuk ve karlı geçen İklim Türü Karasal İklimdir."],
	[0,"Uçaklarda Pilot Kabinine Verilen İsme Kabin Denir."],
	[0,"Rumeli Hisarı Kanuni Sultan Süleyman Tarafından İnşaa Ettirilmiştir."],
	[1,"Kızınca Tüküren Hayvan Olarak Anılan Hayvan Lama Dır"],
	[0,"Türk Tarihinin En Ünlü Mimarı Mimar Kemalettindir."],
	[0,"Mum Doğal Bir Işık Kaynağıdır."],
	[1,"Osmanlı Devletinin kurucusu olan Osmanlı ailesi  Kayı Boyuna Sahiptir"],
	[1,"Duvara asılı bir haritanın sağı her zaman Doğu Yu Gösterir."],
	[0,"Ay Yön Bulmak İçin Kullanılabilir."],
	[0,"Kabak Toprak Altında Büyür."],
	[0,"Yazın kırlarda ve ekin tarlalarında yetişen kırmızı narin çiçeeğe Kır Çiçeği Denir."],
	[0,"Mıknatıs İle Cam Kırığını Çekebilirsiniz."],
	[0,"Çoçuk Hakları Günü Olarak Kutladığımız Tarih 20 Temmuzdur."],
	[1,"Türkiye 7 Coğrafi Bölgeden Oluşmaktadır"],
	[1,"Depremin büyüklüğünü ve süresini ölçen alete SİSMOGRAF Denir."],
	[0,"Ses En Hızlı Gaz Ortamında Yayılır."],
	[1,"Türkçe Ural-Altay Dil Ailesine  Üyedir"],
	[0,"Türkiye'yi ağaçlandırmak ve erozyonla mücadele etmek olan kurulan Sivil Toplum Kuruluşu Adı (TEV) Dir."],
	[1,"Turizm ve Kültür Bakanlığı ve UNESCO’nun işbirliği ile 2009 yılı Katip Çelebi- Hacı Bektaşi Veli İlan Edilmiştir."],
	[0,"Türkiyenin Sınırı Komşu Olduğu İl Sayısı 10 Dur."],
	[1,"Kuzey Kıbrıs Türk Cumhuriyetinin Başkenti Lefkoşa Dır."],
	[1,"2.Dünya Saşavı 1939-1945 Yılları Arasında Yaşanmıştır."],
	[1,"Dünyada Şuan En Çok Uçak Gemisi Kullanan Ülke ABD'Dir."],
	[1,"Fransa'nın Başkenti Paris Dir."],
	[1,"Büyük bir Destan olan 'BÜLBÜL' Bursa Nın İşgali Üzerine Yazılmıştır."],
	[1,"Atomun parcalanabilecegini ilk öne suren bilim insanı Cabir Bin Hayyandır ."],
	[0," 'Dünya tek bir devlet olsa başkenti İstanbul olurdu' diyen komutan Hitlerdir."],
	[1,"Fransız İhtilali 1789-1799 yılında gerçekleşmiştir"],
	[1,"Penguen Memeli"],
	[1,"Kaptan Amerika'yı Canlandıran Kişi Chris Evans dır."],
	[1,"Ahtapotların 3 Kalbi Vardır"],
	[0,"Altın en iyi iletkendir."],
	[1,"Dinozorlar olmasaydı kuşlar olmazdı."],
	[0,"-1,1 sayısı -1,01'den daha büyüktür."],
	[0,"Yer çekiminin olmadığı bir ortamda mum alevinin aldığı şekil değişmez."],
	[0,"Tüm suşilerin içinde çiğ balık bulunur."],
	[0,"Brezilya'nın başkenti Rio de Janerio'dur"],
	[0,"Civa, yeryüzünde bulunan tek sıvı metaldir."],
	[0,"Zıplayamayan tek memeli hayvan fildir."],
	[1,"Çakmak kibritten önce üretilmiştir."],
	[1,"Portekiz'de okyanusa işemek yasaktır."],
	[0,"Çarşamba dilimize Farsçadan gelmiştir ve anlamı da 'üçüncü gün' demektir."],
	[1,"Nokia aslında Finlandiya'da bir şehrin adıdır."],
	[1,"Apple 1976 Tarihinde Kurulmuştur"],
	[1,"Göz kırptığımızdan dolayı 120 dakikalık bir filmin yaklaşık 10 dakikasını göremeyiz."],
	[0,"Yer çekiminin olmadığı bir ortamda mum alevinin aldığı şekil değişmez."],
	[0,"Brezilya'nın başkenti Rio de Janerio'dur"],
	[0,"Öldükten sonra saç ve tırnaklar uzar."],
	[1,"Titanik ilk seferine İngiltere'nin Southampton şehrinden New York'a doğru hareket etti."],
	[0,"İnsan DNA'sı %50 oranında salatalık DNA'sı ile aynıdır.2"],
	[0,"Dünyadaki en kısa savaş 2 saat sürmüştür."],
	[1,"İran ordusu, 2007 yılında 14 sincabı ajan oldukları gerekçesiyle tutukladı."],
	[1,"İran'ın yüzölçümü Türkiye'nin yüzölçümünden büyüktür."],
	[1,"Avrupa'nın en kalabalık şehri İstanbul'dur."],
	[0,"Namaz, Arapça kökenli bir kelimedir."],
	[1,"Dinozorlar olmasaydı kuşlar olmazdı."],
	[1,"Aynı anda nefes alman ve yutkunman mümkün değildir."],
	[0,"Barcelona, İspanya'nın başkentidir"],
	[1,"Dayz Bohemia Interactive Tarafından Geliştirilmiştir"]
];

_rsgtleSoru = selectRandom _sorular;

[_sure,_katilimcilar,_rsgtleSoru] spawn {
	_sure = _this select 0;
	_katilimcilar = _this select 1;
	_rsgtleSoru = _this select 2;

	[format ["<t align='center'><t color='#FF0000' size='1.6' align='center'>YENI SORU</t><br/><br/><t color='#FFFFFF' size='1.4'> %2 </t> <br/><br/><t color='#FF0000' underline='true'> DOGRU ISE <t color='#ddea0e' size='1.2'> O </t><br/>YANLIS ISE<t color='#ddea0e' size='1.2'> X </t> <br/> <t size='1.3'>YONUNE ILERLE.</t><br/><br/> BU SORU ICIN <t color='#ddea0e' size='1.5'>%1</t> SANIYENIZ VAR !!",[_sure] call life_fnc_numberText,_rsgtleSoru select 1],true,"slow"] remoteExecCall ["life_fnc_notification_system", _katilimcilar];
	
	life_oxsoru = true;
	publicVariable "life_oxsoru";
	
	_future = time + _sure;
	waitUntil {time >= _future};
	
	
	switch(_rsgtleSoru select 0) do {
		case 0:	{
			["<t align='center'><t color='#FF0000' size='1.6'>SORU CEVABI</t><br/><br/><t color='#FFFFFF' size='1.4'> CEVAP: X (YANLIŞ) </t><br/><br/><br/><t color='#f0ff00'><t underline='true'> YANLIS CEVAPLAYANLAR ELENDI",true,"slow"] remoteExecCall ["life_fnc_notification_system", _katilimcilar];
			[1] remoteExecCall ["life_fnc_oxayarlar", _katilimcilar];
			["EtkinlikXO",["OX ETKINLIGI SORUSUNUN CEVABI YAYINLANDI!!"]] remoteExecCall ["bis_fnc_showNotification", _katilimcilar];
			if (true) exitwith {
				hint "Yeni Soru Gonderebilirsin";
				life_oxsoru = false;
				publicVariable "life_oxsoru";
			};
		};
		case 1:	{
			["<t align='center'><t color='#FF0000' size='1.6'>SORU CEVABI</t><br/><br/><t color='#FFFFFF' size='1.4'> CEVAP: O (DOĞRU) </t><br/><br/><br/><t color='#f0ff00'><t underline='true'> YANLIS CEVAPLAYANLAR ELENDI",true,"slow"] remoteExecCall ["life_fnc_notification_system", _katilimcilar];
			[0] remoteExecCall ["life_fnc_oxayarlar", _katilimcilar];
			["EtkinlikXO",["OX ETKINLIGI SORUSUNUN CEVABI YAYINLANDI!!"]] remoteExecCall ["bis_fnc_showNotification", _katilimcilar];
			if (true) exitwith {
				hint "Yeni Soru Gonderebilirsin";
				life_oxsoru = false;
				publicVariable "life_oxsoru";
			};
		};
		default {
			hint "Soru Secilemedi !!!!";
			life_oxsoru = false;
			publicVariable "life_oxsoru";
		};
	};
};