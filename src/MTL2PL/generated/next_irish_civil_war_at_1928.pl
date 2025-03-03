:- include('database.pl').
irish_civil_war(Start,End) :- begin('irish_civil_war',_,_,Start), end('irish_civil_war',_,_,End), Start=<End.

next_irish_civil_war(Start,End) :- irish_civil_war(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_irish_civil_war_at_1928(Res) :- setof((Start,End),next_irish_civil_war(Start,End),AllINtervals), checkvalidity(1928,AllINtervals,Res).

check_query() :- write('Query = next_irish_civil_war_at_1928'), (next_irish_civil_war_at_1928(true) -> write('\nRes   = true');write('\nRes   = false')).

