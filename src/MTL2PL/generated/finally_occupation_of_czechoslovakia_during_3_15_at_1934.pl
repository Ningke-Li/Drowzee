:- include('database.pl').
occupation_of_czechoslovakia(Start,End) :- begin('occupation_of_czechoslovakia',_,_,Start), end('occupation_of_czechoslovakia',_,_,End), Start=<End.

finally_occupation_of_czechoslovakia_during_3_15(Start,End) :- occupation_of_czechoslovakia(Start1,End1), (Start1-15)=<(End1-3), Start is (Start1-15), End is (End1-3), Start=<End.

finally_occupation_of_czechoslovakia_during_3_15_at_1934(Res) :- setof((Start,End),finally_occupation_of_czechoslovakia_during_3_15(Start,End),AllINtervals), checkvalidity(1934,AllINtervals,Res).

check_query() :- write('Query = finally_occupation_of_czechoslovakia_during_3_15_at_1934'), (finally_occupation_of_czechoslovakia_during_3_15_at_1934(true) -> write('\nRes   = true');write('\nRes   = false')).

