:- include('database.pl').
el_chavo_animado(Start,End) :- begin('el_chavo_animado',_,_,Start), end('el_chavo_animado',_,_,End), Start=<End.

finally_el_chavo_animado_during_6_18(Start,End) :- el_chavo_animado(Start1,End1), (Start1-18)=<(End1-6), Start is (Start1-18), End is (End1-6), Start=<End.

finally_el_chavo_animado_during_6_18_at_1995(Res) :- setof((Start,End),finally_el_chavo_animado_during_6_18(Start,End),AllINtervals), checkvalidity(1995,AllINtervals,Res).

check_query() :- write('Query = finally_el_chavo_animado_during_6_18_at_1995'), (finally_el_chavo_animado_during_6_18_at_1995(true) -> write('\nRes   = true');write('\nRes   = false')).

