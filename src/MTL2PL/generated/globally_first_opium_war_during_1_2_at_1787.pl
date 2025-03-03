:- include('database.pl').
first_opium_war(Start,End) :- begin('first_opium_war',_,_,Start), end('first_opium_war',_,_,End), Start=<End.

globally_first_opium_war_during_1_2(Start,End) :- first_opium_war(Start1,End1), Start is (Start1-1), End is (End1-2), Start=<End.

globally_first_opium_war_during_1_2_at_1787(Res) :- setof((Start,End),globally_first_opium_war_during_1_2(Start,End),AllINtervals), checkvalidity(1787,AllINtervals,Res).

check_query() :- write('Query = globally_first_opium_war_during_1_2_at_1787'), (globally_first_opium_war_during_1_2_at_1787(true) -> write('\nRes   = true');write('\nRes   = false')).

