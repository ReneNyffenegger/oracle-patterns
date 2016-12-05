declare

  tz_ utl_i18n.string_array;
  n         number;

  tz  ku$_vcnt := ku$_vcnt();

begin

  tz_ := utl_i18n.get_common_time_zones;

  n := tz_.first;
  while n is not null loop
      tz.extend;
      tz(tz.count) := tz_(n);
      n := tz_.next(n);
  end loop;

  for tzSorted in (select * from table(tz) order by 1) loop
      dbms_output.put_line(tzSorted.column_value);
  end loop;

end;
/
-- Africa/Abidjan
-- Africa/Addis_Ababa
-- Africa/Algiers
-- Africa/Brazzaville
-- Africa/Cairo
-- Africa/Casablanca
-- Africa/Dakar
-- Africa/Dar_es_Salaam
-- Africa/Djibouti
-- Africa/Douala
-- Africa/Johannesburg
-- Africa/Kampala
-- Africa/Khartoum
-- Africa/Kinshasa
-- Africa/Lagos
-- Africa/Libreville
-- Africa/Lusaka
-- Africa/Mogadishu
-- Africa/Nairobi
-- Africa/Nouakchott
-- Africa/Tripoli
-- Africa/Tunis
-- America/Anchorage
-- America/Asuncion
-- America/Belize
-- America/Bogota
-- America/Buenos_Aires
-- America/Caracas
-- America/Chicago
-- America/Costa_Rica
-- America/Denver
-- America/Edmonton
-- America/El_Salvador
-- America/Guatemala
-- America/Guayaquil
-- America/Halifax
-- America/Indianapolis
-- America/La_Paz
-- America/Lima
-- America/Los_Angeles
-- America/Managua
-- America/Mazatlan
-- America/Mexico_City
-- America/Montevideo
-- America/Montreal
-- America/Nassau
-- America/New_York
-- America/Panama
-- America/Phoenix
-- America/Puerto_Rico
-- America/Regina
-- America/Santiago
-- America/Sao_Paulo
-- America/St_Johns
-- America/Tegucigalpa
-- America/Tijuana
-- America/Vancouver
-- America/Winnipeg
-- Asia/Aden
-- Asia/Almaty
-- Asia/Amman
-- Asia/Baghdad
-- Asia/Bahrain
-- Asia/Baku
-- Asia/Bangkok
-- Asia/Beirut
-- Asia/Calcutta
-- Asia/Colombo
-- Asia/Dacca
-- Asia/Damascus
-- Asia/Dubai
-- Asia/Hong_Kong
-- Asia/Irkutsk
-- Asia/Jakarta
-- Asia/Jerusalem
-- Asia/Kabul
-- Asia/Kamchatka
-- Asia/Karachi
-- Asia/Kathmandu
-- Asia/Krasnoyarsk
-- Asia/Kuala_Lumpur
-- Asia/Kuwait
-- Asia/Magadan
-- Asia/Manila
-- Asia/Muscat
-- Asia/Nicosia
-- Asia/Novosibirsk
-- Asia/Phnom_Penh
-- Asia/Qatar
-- Asia/Riyadh
-- Asia/Saigon
-- Asia/Seoul
-- Asia/Shanghai
-- Asia/Singapore
-- Asia/Taipei
-- Asia/Tashkent
-- Asia/Tehran
-- Asia/Tokyo
-- Asia/Vientiane
-- Asia/Vladivostok
-- Asia/Yakutsk
-- Asia/Yekaterinburg
-- Asia/Yerevan
-- Atlantic/Azores
-- Atlantic/Bermuda
-- Atlantic/Reykjavik
-- Australia/Adelaide
-- Australia/Brisbane
-- Australia/Darwin
-- Australia/Hobart
-- Australia/Perth
-- Australia/Sydney
-- Europe/Amsterdam
-- Europe/Athens
-- Europe/Belgrade
-- Europe/Berlin
-- Europe/Brussels
-- Europe/Bucharest
-- Europe/Budapest
-- Europe/Copenhagen
-- Europe/Dublin
-- Europe/Helsinki
-- Europe/Istanbul
-- Europe/Kiev
-- Europe/Lisbon
-- Europe/London
-- Europe/Luxembourg
-- Europe/Madrid
-- Europe/Malta
-- Europe/Minsk
-- Europe/Moscow
-- Europe/Oslo
-- Europe/Paris
-- Europe/Prague
-- Europe/Riga
-- Europe/Rome
-- Europe/Sarajevo
-- Europe/Sofia
-- Europe/Stockholm
-- Europe/Tallinn
-- Europe/Tirane
-- Europe/Vienna
-- Europe/Vilnius
-- Europe/Warsaw
-- Europe/Zurich
-- Indian/Maldives
-- Pacific/Auckland
-- Pacific/Honolulu
-- Pacific/Noumea
-- Pacific/Pago_Pago
-- UTC
