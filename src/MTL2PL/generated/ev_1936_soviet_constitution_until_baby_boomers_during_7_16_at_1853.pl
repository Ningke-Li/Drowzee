:- include('database.pl').
ev_1936_soviet_constitution(Start,End) :- begin('ev_1936_soviet_constitution',_,_,Start), end('ev_1936_soviet_constitution',_,_,End), Start=<End.

baby_boomers(Start,End) :- begin('baby_boomers',_,_,Start), end('baby_boomers',_,_,End), Start=<End.

ev_1936_soviet_constitution_last_till_7_16(Start,End) :- ev_1936_soviet_constitution(Start1,End1), (End1-Start1)>=7, Start is (Start1+7), End is (End1+1).

ev_1936_soviet_constitution_until_baby_boomers_during_7_16_overlap(Start,End) :- ev_1936_soviet_constitution_last_till_7_16(Start1,End1), baby_boomers(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

ev_1936_soviet_constitution_until_baby_boomers_during_7_16(Start,End) :- ev_1936_soviet_constitution(W1,_), ev_1936_soviet_constitution_until_baby_boomers_during_7_16_overlap(Start1,End1), Start is max((Start1-16),W1), End is (End1-7), Start=<End.

ev_1936_soviet_constitution_until_baby_boomers_during_7_16_at_1853(Res) :- setof((Start,End),ev_1936_soviet_constitution_until_baby_boomers_during_7_16(Start,End),AllINtervals), checkvalidity(1853,AllINtervals,Res).

check_query() :- write('Query = ev_1936_soviet_constitution_until_baby_boomers_during_7_16_at_1853'), (ev_1936_soviet_constitution_until_baby_boomers_during_7_16_at_1853(true) -> write('\nRes   = true');write('\nRes   = false')).

