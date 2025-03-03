:- include('database.pl').
hussite_wars(Start,End) :- begin('hussite_wars',_,_,Start), end('hussite_wars',_,_,End), Start=<End.

finally_hussite_wars_during_6_11(Start,End) :- hussite_wars(Start1,End1), (Start1-11)=<(End1-6), Start is (Start1-11), End is (End1-6), Start=<End.

finally_hussite_wars_during_6_11_at_1414(Res) :- setof((Start,End),finally_hussite_wars_during_6_11(Start,End),AllINtervals), checkvalidity(1414,AllINtervals,Res).

check_query() :- write('Query = finally_hussite_wars_during_6_11_at_1414'), (finally_hussite_wars_during_6_11_at_1414(true) -> write('\nRes   = true');write('\nRes   = false')).

