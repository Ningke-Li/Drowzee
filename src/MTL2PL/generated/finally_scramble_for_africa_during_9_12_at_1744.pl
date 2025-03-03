:- include('database.pl').
scramble_for_africa(Start,End) :- begin('scramble_for_africa',_,_,Start), end('scramble_for_africa',_,_,End), Start=<End.

finally_scramble_for_africa_during_9_12(Start,End) :- scramble_for_africa(Start1,End1), (Start1-12)=<(End1-9), Start is (Start1-12), End is (End1-9), Start=<End.

finally_scramble_for_africa_during_9_12_at_1744(Res) :- setof((Start,End),finally_scramble_for_africa_during_9_12(Start,End),AllINtervals), checkvalidity(1744,AllINtervals,Res).

check_query() :- write('Query = finally_scramble_for_africa_during_9_12_at_1744'), (finally_scramble_for_africa_during_9_12_at_1744(true) -> write('\nRes   = true');write('\nRes   = false')).

