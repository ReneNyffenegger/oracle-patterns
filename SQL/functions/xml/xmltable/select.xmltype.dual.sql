select x.*
from   dual d,
       xmltable('/root/elem'
         passing  
         xmltype('
<root attrib="hello world">
  <elem id="one"  >foo</elem>
  <elem id="two"  >bar</elem>
  <elem id="three">baz</elem>
  <xyz>Eggs, why and z</xyz>
</root>')
         columns 
           attrib_id  varchar2(7) path '@id',
           dot        varchar2(7) path '.'  ,
           slash      varchar2(7) path '/'
         ) x;
/*
ATTRIB_ DOT     SLASH
------- ------- -------
one     foo     foo
two     bar     bar
three   baz     baz
*/
