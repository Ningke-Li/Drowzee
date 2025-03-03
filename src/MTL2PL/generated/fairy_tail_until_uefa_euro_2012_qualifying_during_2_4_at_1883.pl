:- include('database.pl').
fairy_tail(Start,End) :- begin('fairy_tail',_,_,Start), end('fairy_tail',_,_,End), Start=<End.

uefa_euro_2012_qualifying(Start,End) :- begin('uefa_euro_2012_qualifying',_,_,Start), end('uefa_euro_2012_qualifying',_,_,End), Start=<End.

fairy_tail_last_till_2_4(Start,End) :- fairy_tail(Start1,End1), (End1-Start1)>=2, Start is (Start1+2), End is (End1+1).

fairy_tail_until_uefa_euro_2012_qualifying_during_2_4_overlap(Start,End) :- fairy_tail_last_till_2_4(Start1,End1), uefa_euro_2012_qualifying(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

fairy_tail_until_uefa_euro_2012_qualifying_during_2_4(Start,End) :- fairy_tail(W1,_), fairy_tail_until_uefa_euro_2012_qualifying_during_2_4_overlap(Start1,End1), Start is max((Start1-4),W1), End is (End1-2), Start=<End.

fairy_tail_until_uefa_euro_2012_qualifying_during_2_4_at_1883(Res) :- setof((Start,End),fairy_tail_until_uefa_euro_2012_qualifying_during_2_4(Start,End),AllINtervals), checkvalidity(1883,AllINtervals,Res).

check_query() :- write('Query = fairy_tail_until_uefa_euro_2012_qualifying_during_2_4_at_1883'), (fairy_tail_until_uefa_euro_2012_qualifying_during_2_4_at_1883(true) -> write('\nRes   = true');write('\nRes   = false')).

