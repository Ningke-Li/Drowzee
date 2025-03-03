:- include('database.pl').
el_chavo_animado(Start,End) :- begin('el_chavo_animado',_,_,Start), end('el_chavo_animado',_,_,End), Start=<End.

next_el_chavo_animado(Start,End) :- el_chavo_animado(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_el_chavo_animado_at_2008(Res) :- setof((Start,End),next_el_chavo_animado(Start,End),AllINtervals), checkvalidity(2008,AllINtervals,Res).

check_query() :- write('Query = next_el_chavo_animado_at_2008'), (next_el_chavo_animado_at_2008(true) -> write('\nRes   = true');write('\nRes   = false')).

