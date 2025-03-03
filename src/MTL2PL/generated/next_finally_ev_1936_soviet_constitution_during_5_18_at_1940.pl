:- include('database.pl').
ev_1936_soviet_constitution(Start,End) :- begin('ev_1936_soviet_constitution',_,_,Start), end('ev_1936_soviet_constitution',_,_,End), Start=<End.

finally_ev_1936_soviet_constitution_during_5_18(Start,End) :- ev_1936_soviet_constitution(Start1,End1), (Start1-18)=<(End1-5), Start is (Start1-18), End is (End1-5), Start=<End.

next_finally_ev_1936_soviet_constitution_during_5_18(Start,End) :- finally_ev_1936_soviet_constitution_during_5_18(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_finally_ev_1936_soviet_constitution_during_5_18_at_1940(Res) :- setof((Start,End),next_finally_ev_1936_soviet_constitution_during_5_18(Start,End),AllINtervals), checkvalidity(1940,AllINtervals,Res).

check_query() :- write('Query = next_finally_ev_1936_soviet_constitution_during_5_18_at_1940'), (next_finally_ev_1936_soviet_constitution_during_5_18_at_1940(true) -> write('\nRes   = true');write('\nRes   = false')).

