select
                               '&' || t.column_value || ';'  escaped,
   utl_i18n.unescape_reference('&' || t.column_value || ';') unescaped
from
  table(sys.dbms_debug_vc2coll(
  'aacute', 'Aacute', 'acirc', 'Acirc', 'acute', 'aelig', 'AElig', 'Agrave', 'agrave', 'amp', 'aring', 'Aring', 'atilde', 'Atilde',
  'auml', 'Auml', 'brvbar', 'Ccedil', 'ccedil', 'cedil', 'cent', 'copy', 'curren', 'deg', 'divide', 'eacute', 'Eacute', 'ecirc', 'Ecirc',
  'egrave', 'Egrave', 'eth', 'ETH', 'Euml', 'euml', 'euro', 'frac12', 'frac14', 'frac34', 'gt', 'Iacute', 'iacute', 'Icirc', 'icirc',
  'iexcl', 'igrave', 'Igrave', 'iquest', 'iuml', 'Iuml', 'lt', 'macr', 'micro', 'middot', 'nbsp', 'nbsp', 'not', 'Ntilde', 'ntilde',
  'oacute', 'Oacute', 'Ocirc', 'ocirc', 'ograve', 'Ograve', 'ordf', 'ordm', 'Oslash', 'oslash', 'otilde', 'Otilde', 'ouml', 'Ouml',
  'para', 'plusmn', 'pound', 'quot', 'raquo', 'reg', 'sect', 'shy', 'sup1', 'sup2', 'sup3', 'szlig', 'thorn', 'THORN', 'times',
  'Uacute', 'uacute', 'Ucirc', 'ucirc', 'Ugrave', 'ugrave', 'uml', 'uuml', 'Uuml', 'Yacute', 'yacute', 'yen', '#xe4')) t
;
-- &aacute;   á 
-- &Aacute;   Á 
-- &acirc;    â 
-- &Acirc;    Â 
-- &acute;    ´ 
-- &aelig;    c 
-- &AElig;    C 
-- &Agrave;   R 
-- &agrave;   r 
-- &amp;      & 
-- &aring;    l 
-- &Aring;    L 
-- &atilde;   a 
-- &Atilde;   A 
-- &auml;     ä 
-- &Auml;     Ä 
-- &brvbar;   ¦ 
-- &Ccedil;   Ç 
-- &ccedil;   ç 
-- &cedil;    ¸ 
-- &cent;     ? 
-- &copy;     © 
-- &curren;   ¤ 
-- &deg;      ° 
-- &divide;   ÷ 
-- &eacute;   é 
-- &Eacute;   É 
-- &ecirc;    e 
-- &Ecirc;    E 
-- &egrave;   c 
-- &Egrave;   C 
-- &eth;      d 
-- &ETH;      Ð 
-- &Euml;     Ë 
-- &euml;     ë 
-- &euro;     z 
-- &frac12;   ? 
-- &frac14;   L 
-- &frac34;   l 
-- &gt;       > 
-- &Iacute;   Í 
-- &iacute;   í 
-- &Icirc;    Î 
-- &icirc;    î 
-- &iexcl;    ? 
-- &igrave;   e 
-- &Igrave;   E 
-- &iquest;   z 
-- &iuml;     d 
-- &Iuml;     D 
-- &lt;       < 
-- &macr;     Z 
-- &micro;    µ 
-- &middot;   · 
-- &nbsp;       
-- &nbsp;       
-- &not;      ¬ 
-- &Ntilde;   N 
-- &ntilde;   n 
-- &oacute;   ó 
-- &Oacute;   Ó 
-- &Ocirc;    Ô 
-- &ocirc;    ô 
-- &ograve;   n 
-- &Ograve;   N 
-- &ordf;     S 
-- &ordm;     s 
-- &Oslash;   R 
-- &oslash;   r 
-- &otilde;   o 
-- &Otilde;   O 
-- &ouml;     ö 
-- &Ouml;     Ö 
-- &para;     ¶ 
-- &plusmn;   ± 
-- &pound;    L 
-- &quot;     " 
-- &raquo;    » 
-- &reg;      ® 
-- &sect;     § 
-- &shy;      ­ 
-- &sup1;     a 
-- &sup2;     ? 
-- &sup3;     l 
-- &szlig;    ß 
-- &thorn;    t 
-- &THORN;    T 
-- &times;    × 
-- &Uacute;   Ú 
-- &uacute;   ú 
-- &Ucirc;    U 
-- &ucirc;    u 
-- &Ugrave;   U 
-- &ugrave;   u 
-- &uml;      ¨ 
-- &uuml;     ü 
-- &Uuml;     Ü 
-- &Yacute;   Ý 
-- &yacute;   ý 
-- &yen;      A 
-- &#xe4;     ä 
