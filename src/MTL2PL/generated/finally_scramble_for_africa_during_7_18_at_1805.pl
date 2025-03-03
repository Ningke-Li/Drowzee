:- include('database.pl').
scramble_for_africa(Start,End) :- begin('scramble_for_africa',_,_,Start), end('scramble_for_africa',_,_,End), Start=<End.

finally_scramble_for_africa_during_7_18(Start,End) :- scramble_for_africa(Start1,End1), (Start1-18)=<(End1-7), Start is (Start1-18), End is (End1-7), Start=<End.

finally_scramble_for_africa_during_7_18_at_1805(Res) :- setof((Start,End),finally_scramble_for_africa_during_7_18(Start,End),AllINtervals), checkvalidity(1805,AllINtervals,Res).

check_query() :- write('Query = finally_scramble_for_africa_during_7_18_at_1805'), (finally_scramble_for_africa_during_7_18_at_1805(true) -> write('\nRes   = true');write('\nRes   = false')).

