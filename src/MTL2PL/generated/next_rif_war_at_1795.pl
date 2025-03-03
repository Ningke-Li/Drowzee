:- include('database.pl').
rif_war(Start,End) :- begin('rif_war',_,_,Start), end('rif_war',_,_,End), Start=<End.

next_rif_war(Start,End) :- rif_war(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_rif_war_at_1795(Res) :- setof((Start,End),next_rif_war(Start,End),AllINtervals), checkvalidity(1795,AllINtervals,Res).

check_query() :- write('Query = next_rif_war_at_1795'), (next_rif_war_at_1795(true) -> write('\nRes   = true');write('\nRes   = false')).

