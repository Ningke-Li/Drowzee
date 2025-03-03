:- include('database.pl').
winx_club(Start,End) :- begin('winx_club',_,_,Start), end('winx_club',_,_,End), Start=<End.

new_girl(Start,End) :- begin('new_girl',_,_,Start), end('new_girl',_,_,End), Start=<End.

winx_club_last_till_4_12(Start,End) :- winx_club(Start1,End1), (End1-Start1)>=4, Start is (Start1+4), End is (End1+1).

winx_club_until_new_girl_during_4_12_overlap(Start,End) :- winx_club_last_till_4_12(Start1,End1), new_girl(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

winx_club_until_new_girl_during_4_12(Start,End) :- winx_club(W1,_), winx_club_until_new_girl_during_4_12_overlap(Start1,End1), Start is max((Start1-12),W1), End is (End1-4), Start=<End.

winx_club_until_new_girl_during_4_12_at_2004(Res) :- setof((Start,End),winx_club_until_new_girl_during_4_12(Start,End),AllINtervals), checkvalidity(2004,AllINtervals,Res).

check_query() :- write('Query = winx_club_until_new_girl_during_4_12_at_2004'), (winx_club_until_new_girl_during_4_12_at_2004(true) -> write('\nRes   = true');write('\nRes   = false')).

