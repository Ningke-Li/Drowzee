:- include('database.pl').
ev_1936_soviet_constitution(Start,End) :- begin('ev_1936_soviet_constitution',_,_,Start), end('ev_1936_soviet_constitution',_,_,End), Start=<End.

continuation_war(Start,End) :- begin('continuation_war',_,_,Start), end('continuation_war',_,_,End), Start=<End.

ev_1936_soviet_constitution_last_till_2_3(Start,End) :- ev_1936_soviet_constitution(Start1,End1), (End1-Start1)>=2, Start is (Start1+2), End is (End1+1).

ev_1936_soviet_constitution_until_continuation_war_during_2_3_overlap(Start,End) :- ev_1936_soviet_constitution_last_till_2_3(Start1,End1), continuation_war(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

ev_1936_soviet_constitution_until_continuation_war_during_2_3(Start,End) :- ev_1936_soviet_constitution(W1,_), ev_1936_soviet_constitution_until_continuation_war_during_2_3_overlap(Start1,End1), Start is max((Start1-3),W1), End is (End1-2), Start=<End.

ev_1936_soviet_constitution_until_continuation_war_during_2_3_at_1958(Res) :- setof((Start,End),ev_1936_soviet_constitution_until_continuation_war_during_2_3(Start,End),AllINtervals), checkvalidity(1958,AllINtervals,Res).

check_query() :- write('Query = ev_1936_soviet_constitution_until_continuation_war_during_2_3_at_1958'), (ev_1936_soviet_constitution_until_continuation_war_during_2_3_at_1958(true) -> write('\nRes   = true');write('\nRes   = false')).

