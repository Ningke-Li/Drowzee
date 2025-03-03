:- include('database.pl').
winx_club(Start,End) :- begin('winx_club',_,_,Start), end('winx_club',_,_,End), Start=<End.

community(Start,End) :- begin('community',_,_,Start), end('community',_,_,End), Start=<End.

winx_club_last_till_3_10(Start,End) :- winx_club(Start1,End1), (End1-Start1)>=3, Start is (Start1+3), End is (End1+1).

winx_club_until_community_during_3_10_overlap(Start,End) :- winx_club_last_till_3_10(Start1,End1), community(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

winx_club_until_community_during_3_10(Start,End) :- winx_club(W1,_), winx_club_until_community_during_3_10_overlap(Start1,End1), Start is max((Start1-10),W1), End is (End1-3), Start=<End.

winx_club_until_community_during_3_10_at_1889(Res) :- setof((Start,End),winx_club_until_community_during_3_10(Start,End),AllINtervals), checkvalidity(1889,AllINtervals,Res).

check_query() :- write('Query = winx_club_until_community_during_3_10_at_1889'), (winx_club_until_community_during_3_10_at_1889(true) -> write('\nRes   = true');write('\nRes   = false')).

