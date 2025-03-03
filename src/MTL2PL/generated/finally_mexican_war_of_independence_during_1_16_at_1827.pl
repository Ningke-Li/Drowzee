:- include('database.pl').
mexican_war_of_independence(Start,End) :- begin('mexican_war_of_independence',_,_,Start), end('mexican_war_of_independence',_,_,End), Start=<End.

finally_mexican_war_of_independence_during_1_16(Start,End) :- mexican_war_of_independence(Start1,End1), (Start1-16)=<(End1-1), Start is (Start1-16), End is (End1-1), Start=<End.

finally_mexican_war_of_independence_during_1_16_at_1827(Res) :- setof((Start,End),finally_mexican_war_of_independence_during_1_16(Start,End),AllINtervals), checkvalidity(1827,AllINtervals,Res).

check_query() :- write('Query = finally_mexican_war_of_independence_during_1_16_at_1827'), (finally_mexican_war_of_independence_during_1_16_at_1827(true) -> write('\nRes   = true');write('\nRes   = false')).

