:- include('database.pl').
ev_1936_soviet_constitution(Start,End) :- begin('ev_1936_soviet_constitution',_,_,Start), end('ev_1936_soviet_constitution',_,_,End), Start=<End.

lapland_war(Start,End) :- begin('lapland_war',_,_,Start), end('lapland_war',_,_,End), Start=<End.

ev_1936_soviet_constitution_last_till_1_7(Start,End) :- ev_1936_soviet_constitution(Start1,End1), (End1-Start1)>=1, Start is (Start1+1), End is (End1+1).

ev_1936_soviet_constitution_until_lapland_war_during_1_7_overlap(Start,End) :- ev_1936_soviet_constitution_last_till_1_7(Start1,End1), lapland_war(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

ev_1936_soviet_constitution_until_lapland_war_during_1_7(Start,End) :- ev_1936_soviet_constitution(W1,_), ev_1936_soviet_constitution_until_lapland_war_during_1_7_overlap(Start1,End1), Start is max((Start1-7),W1), End is (End1-1), Start=<End.

ev_1936_soviet_constitution_until_lapland_war_during_1_7_at_1942(Res) :- setof((Start,End),ev_1936_soviet_constitution_until_lapland_war_during_1_7(Start,End),AllINtervals), checkvalidity(1942,AllINtervals,Res).

check_query() :- write('Query = ev_1936_soviet_constitution_until_lapland_war_during_1_7_at_1942'), (ev_1936_soviet_constitution_until_lapland_war_during_1_7_at_1942(true) -> write('\nRes   = true');write('\nRes   = false')).

