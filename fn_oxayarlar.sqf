/*	
	file: oxayarlar.sqf	
	Author: Silex
	YUZEXP,BESYUZEXP,BINEXP
	if (player distance (getMarkerPos "yarisma_odulal") < 3) then {
		life_binkasf7 = life_binkasf7 + 500000;
	};bankakisi
	if (player distance (getMarkerPos "yarisma_odulal") < 3) then {
		["BINEXP"] spawn mav_ttm_fnc_addExp;
	};
	[4] execvm "Etkinlik\oxayarlar.sqf";
*/
private _type = _this select 0;
switch(_type) do{
	// cevap dogru yanlislari beklemeye gonderir
	case 0:	{
		
		{
			if (player distance (getMarkerPos _x) < 4) then {
[] spawn {
life_safeWalk = true;
player setPos (getMarkerPos "yarisma_bekleme");
sleep 2;
life_safeWalk = false;
};
				
				hint "SORU SORULDUGUNDA ORTADA KALDIGIN ICIN ARENADAN CIKARTILDIN";
			};
		} forEach ["yarisma_orta_1","yarisma_orta_2","yarisma_orta_3","yarisma_orta_4","yarisma_orta_5","yarisma_orta_6","yarisma_orta_7","yarisma_orta_8","yarisma_orta_9","yarisma_orta_10","yarisma_orta_11","yarisma_orta_12","yarisma_orta_13","yarisma_orta_14","yarisma_orta_15","yarisma_orta_16","yarisma_orta_17","yarisma_orta_18"];
		
		if (player distance (getMarkerPos "yarisma_x1") < 23) then {
[] spawn {
life_safeWalk = true;
player setPos (getMarkerPos "yarisma_bekleme");
sleep 2;
life_safeWalk = false;
};
			hint "SORUNUN CEVABINI BILEMEDIGIN ICIN ARENADAN CIKARTILDIN";
		};
		
		{
			if (player distance (getMarkerPos _x) < 5) then {
[] spawn {
life_safeWalk = true;
player setPos (getMarkerPos "yarisma_bekleme");
sleep 2;
life_safeWalk = false;
};
				hint "SORUNUN CEVABINI BILEMEDIGIN ICIN ARENADAN CIKARTILDIN";
			};
		} forEach ["yarisma_xx_1","yarisma_xx_2","yarisma_xx_3","yarisma_xx_4","yarisma_xx_5","yarisma_xx_7","yarisma_xx_8","yarisma_xx_9"];
		
		{
			if (player distance (getMarkerPos _x) < 15) then {
[] spawn {
life_safeWalk = true;
player setPos (getMarkerPos "yarisma_bekleme");
sleep 2;
life_safeWalk = false;
};
				hint "SORUNUN CEVABINI BILEMEDIGIN ICIN ARENADAN CIKARTILDIN";
			};
		} forEach ["yarisma_x1_2","yarisma_x1_3"];
		
	};
	// cevap yanlis doğruları beklemeye gonderir
	case 1:	{
		
		{
			if (player distance (getMarkerPos _x) < 4) then {
[] spawn {
life_safeWalk = true;
player setPos (getMarkerPos "yarisma_bekleme");
sleep 2;
life_safeWalk = false;
};
				hint "SORU SORULDUGUNDA ORTADA KALDIGIN ICIN ARENADAN CIKARTILDIN";
			};
		} forEach ["yarisma_orta_1","yarisma_orta_2","yarisma_orta_3","yarisma_orta_4","yarisma_orta_5","yarisma_orta_6","yarisma_orta_7","yarisma_orta_8","yarisma_orta_9","yarisma_orta_10","yarisma_orta_11","yarisma_orta_12","yarisma_orta_13","yarisma_orta_14","yarisma_orta_15","yarisma_orta_16","yarisma_orta_17","yarisma_orta_18"];
		
		
		if (player distance (getMarkerPos "yarisma_oo_x1") < 19) then {
[] spawn {
life_safeWalk = true;
player setPos (getMarkerPos "yarisma_bekleme");
sleep 2;
life_safeWalk = false;
};
			hint "SORUNUN CEVABINI BILEMEDIGIN ICIN ARENADAN CIKARTILDIN";
		};
		
		
		{
			if (player distance (getMarkerPos _x) < 5) then {
[] spawn {
life_safeWalk = true;
player setPos (getMarkerPos "yarisma_bekleme");
sleep 2;
life_safeWalk = false;
};
				hint "SORUNUN CEVABINI BILEMEDIGIN ICIN ARENADAN CIKARTILDIN";
			};
		} forEach ["yarisma_oo_1","yarisma_oo_2","yarisma_oo_3","yarisma_oo_4","yarisma_oo_5","yarisma_oo_6","yarisma_oo_7","yarisma_oo_8","yarisma_oo_9","yarisma_oo_10","yarisma_oo_11","yarisma_oo_12","yarisma_oo_13","yarisma_oo_14","yarisma_oo_15","yarisma_oo_16"];
		
	};
	//Soru Bekleme alanına atar tabeladan calısır
	case 2:	{
[] spawn {
life_safeWalk = true;
player setPos (getMarkerPos "yarisma_sorubekleme");
sleep 2;
life_safeWalk = false;
};
	};
	//Bekleme alanına atar tabeladan calısır
	case 3:	{
[] spawn {
life_safeWalk = true;
player setPos (getMarkerPos "yarisma_bekleme");
sleep 2;
life_safeWalk = false;
};
	};
	
	// DUYURU GEÇER
	case 4:	{
		_msg = ctrlText 6158;
		[format ["<t align='center'><t color='#FF0000' size='1.4'>OX ETKINLIGI DUYURU!!</t><br/><br/><t color='#FFFFFF'> <t color='#fdff00' size='1.2'> %1 </t><br/><br/>",_msg],true,"slow"] remoteExecCall ["life_fnc_notification_system",-2];
		["EtkinlikXOSoru",["OX ETKINLIK DUYURUSU!!!"]] remoteExecCall ["BIS_fnc_showNotification",-2];
	};
	
	
	// ALANDAKI HERKESİ KAVALAYA ISINLAR
	case 5:	{
		if (player distance (getMarkerPos "yarisma_sorubekleme") < 95) then {
[] spawn {
life_safeWalk = true;
player setPos (getMarkerPos "yarisma_cikiskav");
sleep 2;
life_safeWalk = false;
};
		};
	};
	
	// ÖZEL SORU GONDERİR
	case 6:	{
		_msg = ctrlText 6150;
		private _katilimcilar = [];
		{
			if (_x distance (getMarkerPos 'yarisma_orta_1') < 250) then {
				_katilimcilar pushBack _x;
			};
		} forEach playableUnits;
		[format ["<t align='center'><t color='#FF0000' size='1.6' align='center'>YENI SORU</t><br/><br/><t color='#FFFFFF' size='1.4'> %1 </t> <br/><br/><t color='#FF0000' underline='true'> DOGRU ISE <t color='#ddea0e' size='1.2'> O </t><br/>YANLIS ISE<t color='#ddea0e' size='1.2'> X </t> <br/> <t size='1.3'>YONUNE ILERLE.</t><br/><br/> BU SORU ICIN <t color='#ddea0e' size='1.5'>15</t> SANIYENIZ VAR !!",_msg],true,"slow"] remoteExecCall ["life_fnc_notification_system", _katilimcilar];
		["EtkinlikXOSoru",["OX ETKINLIK SORUSU GELDI!!!"]] remoteExecCall ["BIS_fnc_showNotification",_katilimcilar];
	};
	// Arenada fişekler gönderir
	case 7: {
		{
			[getMarkerPos _x, "random", "random"] remoteExec ["fisek_fnc_prepareFireworks", 2];
		} forEach ["sorucevapfisek_1","sorucevapfisek_2","sorucevapfisek_3","sorucevapfisek_4","sorucevapfisek_5"];
	};
	
	
};