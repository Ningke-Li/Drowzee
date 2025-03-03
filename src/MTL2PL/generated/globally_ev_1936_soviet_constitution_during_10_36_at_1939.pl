:- include('database.pl').
ev_1936_soviet_constitution(Start,End) :- begin('ev_1936_soviet_constitution',_,_,Start), end('ev_1936_soviet_constitution',_,_,End), Start=<End.

globally_ev_1936_soviet_constitution_during_10_36(Start,End) :- ev_1936_soviet_constitution(Start1,End1), Start is (Start1-10), End is (End1-36), Start=<End.

globally_ev_1936_soviet_constitution_during_10_36_at_1939(Res) :- setof((Start,End),globally_ev_1936_soviet_constitution_during_10_36(Start,End),AllINtervals), checkvalidity(1939,AllINtervals,Res).

check_query() :- write('Query = globally_ev_1936_soviet_constitution_during_10_36_at_1939'), (globally_ev_1936_soviet_constitution_during_10_36_at_1939(true) -> write('\nRes   = true');write('\nRes   = false')).

