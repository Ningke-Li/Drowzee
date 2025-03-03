:- include('database.pl').
first_opium_war(Start,End) :- begin('first_opium_war',_,_,Start), end('first_opium_war',_,_,End), Start=<End.

finally_first_opium_war_during_2_20(Start,End) :- first_opium_war(Start1,End1), (Start1-20)=<(End1-2), Start is (Start1-20), End is (End1-2), Start=<End.

finally_first_opium_war_during_2_20_at_1827(Res) :- setof((Start,End),finally_first_opium_war_during_2_20(Start,End),AllINtervals), checkvalidity(1827,AllINtervals,Res).

check_query() :- write('Query = finally_first_opium_war_during_2_20_at_1827'), (finally_first_opium_war_during_2_20_at_1827(true) -> write('\nRes   = true');write('\nRes   = false')).

