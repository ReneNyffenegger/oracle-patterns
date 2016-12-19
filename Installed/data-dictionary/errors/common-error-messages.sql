select
  count(*),
  text
from (
  select
    regexp_replace(
    regexp_replace(
    regexp_replace(
    regexp_replace(
    regexp_replace(
    regexp_replace(
    regexp_replace(
    regexp_replace(
    regexp_replace(
    regexp_replace(
    regexp_replace(
    regexp_replace(
    regexp_replace(
    regexp_replace(
    regexp_replace(
    regexp_replace(
    regexp_replace(
    regexp_replace(
    regexp_replace(replace(text, chr(10), ' '),
      'PLS-00201: identifier ''[^'']+'' must be declared'                                                                        , 'PLS-00201: identifier ''...'' must be declared'                                                                            ),
      'PLW-06005: inlining of call of procedure ''[^'']+'' was done'                                                             , 'PLW-06005: inlining of call of procedure ''...'' was done'                                                                 ),
      'ORA-00904: ("[^"]+"\.)?"[^"]+": invalid identifier'                                                                       , 'ORA-00904: "...": invalid identifier'                                                                                      ),
      'PLS-00364: loop index variable ''[^'']+'' use is invalid'                                                                 , 'PLS-00364: loop index variable ''...'' use is invalid'                                                                     ),
      'ORA-04063: view "[^"]+" has errors'                                                                                       , 'ORA04063: view "..." has errors'                                                                                           ),
      'PLW-06006: uncalled procedure "[^"]+" is removed.'                                                                        , 'PLW-06006: uncalled procedure "..." is removed.'                                                                           ),
      'PLS-00103: Encountered the symbol "[^"]+" *$'                                                                             , 'PLS-00103: Encountered the symbol ...'                                                                                     ),
      'PLS-00103: Encountered the symbol "[^"]+" when expecting.*'                                                               , 'PLS-00103: Encountered the symbol "..." when expecting ...'                                                                ),
      'PLW-05021: exception \w+ does not have a pragma EXCEPTION_INIT'                                                           , 'PLW-05021: exception ... does not have a pragma EXCEPTION_INIT'                                                            ),
      'PLS-00302: component ''[^'']+'' must be declared'                                                                         , 'PLS-00302: component ''...'' must be declared'                                                                             ),
      'PLW-07203: parameter ''[^'']+'' may benefit from use of the NOCOPY compiler hint'                                         , 'PLW-07203: parameter ''...'' may benefit from use of the NOCOPY compiler hint'                                             ),
      'PLS-00904: insufficient privilege to access object \S+'                                                                   , 'PLS-00904: insufficient privilege to access object ...'                                                                    ),
      'PLW-06009: procedure "[^"]+" OTHERS handler does not end in RAISE or RAISE_APPLICATION_ERROR'                             , 'PLW-06009: procedure "..." OTHERS handler does not end in RAISE or RAISE_APPLICATION_ERROR'                                ),
      'PLS-00304: cannot compile body of ''[^'']+'' without its specification'                                                   , 'PLS-00304: cannot compile body of ''...'' without its specification'                                                       ),
      'PLS-00114: identifier ''[^'']+'' too long'                                                                                , 'PLS-00114: identifier ''...'' too long'                                                                                    ),
      'PLS-00113: END identifier ''[^'']+'' must match ''[^'']+'' at line \d+, column \d+'                                       , 'PLS-00113: END identifier ''...'' must match ''...'' at line \d+, column \d+'                                              ),
      'PLS-00323: subprogram or cursor ''[^'']+'' is declared in a package specification and must be defined in the package body', 'PLS-00323: subprogram or cursor ''[^'']+'' is declared in a package specification and must be defined in the package body' ),
      'PLS-00905: object \S+ is invalid'                                                                                         , 'PLS-00905: object ... is invalid'                                                                                          ),
      'PLS-00221: ''[^'']+'' is not a procedure or is undefined'                                                                 , 'PLS-00221: ... is not a procedure or or is undefined'                                                                      )
      || '<'
      text
  from
    dba_errors
)
group by
  text 
order by
  count(*) desc
;  
