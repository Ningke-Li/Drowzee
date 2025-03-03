:- include('database.pl').
supernatural(Start,End) :- begin('supernatural',_,_,Start), end('supernatural',_,_,End), Start=<End.

uefa_euro_2012_qualifying(Start,End) :- begin('uefa_euro_2012_qualifying',_,_,Start), end('uefa_euro_2012_qualifying',_,_,End), Start=<End.

supernatural_last_till_1_4(Start,End) :- supernatural(Start1,End1), (End1-Start1)>=1, Start is (Start1+1), End is (End1+1).

supernatural_until_uefa_euro_2012_qualifying_during_1_4_overlap(Start,End) :- supernatural_last_till_1_4(Start1,End1), uefa_euro_2012_qualifying(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

supernatural_until_uefa_euro_2012_qualifying_during_1_4(Start,End) :- supernatural(W1,_), supernatural_until_uefa_euro_2012_qualifying_during_1_4_overlap(Start1,End1), Start is max((Start1-4),W1), End is (End1-1), Start=<End.

supernatural_until_uefa_euro_2012_qualifying_during_1_4_at_1979(Res) :- setof((Start,End),supernatural_until_uefa_euro_2012_qualifying_during_1_4(Start,End),AllINtervals), checkvalidity(1979,AllINtervals,Res).

check_query() :- write('Query = supernatural_until_uefa_euro_2012_qualifying_during_1_4_at_1979'), (supernatural_until_uefa_euro_2012_qualifying_during_1_4_at_1979(true) -> write('\nRes   = true');write('\nRes   = false')).

