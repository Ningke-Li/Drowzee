:- include('database.pl').
spanish_civil_war(Start,End) :- begin('spanish_civil_war',_,_,Start), end('spanish_civil_war',_,_,End), Start=<End.

next_spanish_civil_war(Start,End) :- spanish_civil_war(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_spanish_civil_war_at_1936(Res) :- setof((Start,End),next_spanish_civil_war(Start,End),AllINtervals), checkvalidity(1936,AllINtervals,Res).

check_query() :- write('Query = next_spanish_civil_war_at_1936'), (next_spanish_civil_war_at_1936(true) -> write('\nRes   = true');write('\nRes   = false')).

