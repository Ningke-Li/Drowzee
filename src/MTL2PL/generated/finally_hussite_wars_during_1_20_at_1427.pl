:- include('database.pl').
hussite_wars(Start,End) :- begin('hussite_wars',_,_,Start), end('hussite_wars',_,_,End), Start=<End.

finally_hussite_wars_during_1_20(Start,End) :- hussite_wars(Start1,End1), (Start1-20)=<(End1-1), Start is (Start1-20), End is (End1-1), Start=<End.

finally_hussite_wars_during_1_20_at_1427(Res) :- setof((Start,End),finally_hussite_wars_during_1_20(Start,End),AllINtervals), checkvalidity(1427,AllINtervals,Res).

check_query() :- write('Query = finally_hussite_wars_during_1_20_at_1427'), (finally_hussite_wars_during_1_20_at_1427(true) -> write('\nRes   = true');write('\nRes   = false')).

