:- include('database.pl').
ev_1936_soviet_constitution(Start,End) :- begin('ev_1936_soviet_constitution',_,_,Start), end('ev_1936_soviet_constitution',_,_,End), Start=<End.

i_love_lucy(Start,End) :- begin('i_love_lucy',_,_,Start), end('i_love_lucy',_,_,End), Start=<End.

ev_1936_soviet_constitution_last_till_14_17(Start,End) :- ev_1936_soviet_constitution(Start1,End1), (End1-Start1)>=14, Start is (Start1+14), End is (End1+1).

ev_1936_soviet_constitution_until_i_love_lucy_during_14_17_overlap(Start,End) :- ev_1936_soviet_constitution_last_till_14_17(Start1,End1), i_love_lucy(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

ev_1936_soviet_constitution_until_i_love_lucy_during_14_17(Start,End) :- ev_1936_soviet_constitution(W1,_), ev_1936_soviet_constitution_until_i_love_lucy_during_14_17_overlap(Start1,End1), Start is max((Start1-17),W1), End is (End1-14), Start=<End.

ev_1936_soviet_constitution_until_i_love_lucy_during_14_17_at_1976(Res) :- setof((Start,End),ev_1936_soviet_constitution_until_i_love_lucy_during_14_17(Start,End),AllINtervals), checkvalidity(1976,AllINtervals,Res).

check_query() :- write('Query = ev_1936_soviet_constitution_until_i_love_lucy_during_14_17_at_1976'), (ev_1936_soviet_constitution_until_i_love_lucy_during_14_17_at_1976(true) -> write('\nRes   = true');write('\nRes   = false')).

