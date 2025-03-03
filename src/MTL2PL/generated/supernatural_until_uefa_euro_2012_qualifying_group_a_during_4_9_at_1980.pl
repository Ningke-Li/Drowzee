:- include('database.pl').
supernatural(Start,End) :- begin('supernatural',_,_,Start), end('supernatural',_,_,End), Start=<End.

uefa_euro_2012_qualifying_group_a(Start,End) :- begin('uefa_euro_2012_qualifying_group_a',_,_,Start), end('uefa_euro_2012_qualifying_group_a',_,_,End), Start=<End.

supernatural_last_till_4_9(Start,End) :- supernatural(Start1,End1), (End1-Start1)>=4, Start is (Start1+4), End is (End1+1).

supernatural_until_uefa_euro_2012_qualifying_group_a_during_4_9_overlap(Start,End) :- supernatural_last_till_4_9(Start1,End1), uefa_euro_2012_qualifying_group_a(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

supernatural_until_uefa_euro_2012_qualifying_group_a_during_4_9(Start,End) :- supernatural(W1,_), supernatural_until_uefa_euro_2012_qualifying_group_a_during_4_9_overlap(Start1,End1), Start is max((Start1-9),W1), End is (End1-4), Start=<End.

supernatural_until_uefa_euro_2012_qualifying_group_a_during_4_9_at_1980(Res) :- setof((Start,End),supernatural_until_uefa_euro_2012_qualifying_group_a_during_4_9(Start,End),AllINtervals), checkvalidity(1980,AllINtervals,Res).

check_query() :- write('Query = supernatural_until_uefa_euro_2012_qualifying_group_a_during_4_9_at_1980'), (supernatural_until_uefa_euro_2012_qualifying_group_a_during_4_9_at_1980(true) -> write('\nRes   = true');write('\nRes   = false')).

