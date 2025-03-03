:- include('database.pl').
spanish_civil_war(Start,End) :- begin('spanish_civil_war',_,_,Start), end('spanish_civil_war',_,_,End), Start=<End.

globally_spanish_civil_war_during_1_2(Start,End) :- spanish_civil_war(Start1,End1), Start is (Start1-1), End is (End1-2), Start=<End.

globally_spanish_civil_war_during_1_2_at_1904(Res) :- setof((Start,End),globally_spanish_civil_war_during_1_2(Start,End),AllINtervals), checkvalidity(1904,AllINtervals,Res).

check_query() :- write('Query = globally_spanish_civil_war_during_1_2_at_1904'), (globally_spanish_civil_war_during_1_2_at_1904(true) -> write('\nRes   = true');write('\nRes   = false')).

