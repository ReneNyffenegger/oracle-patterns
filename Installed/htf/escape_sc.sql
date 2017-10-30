set define off
select
  htf.escape_sc
  (
    '<foo>bar & baz / bar''n "baz"</foo>'
  )
  from dual;
--
-- &lt;foo&gt;bar &amp; baz / bar'n &quot;baz&quot;&lt;/foo&gt;
--
