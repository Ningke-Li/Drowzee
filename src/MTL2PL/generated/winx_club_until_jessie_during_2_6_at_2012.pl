:- include('database.pl').
winx_club(Start,End) :- begin('winx_club',_,_,Start), end('winx_club',_,_,End), Start=<End.

jessie(Start,End) :- begin('jessie',_,_,Start), end('jessie',_,_,End), Start=<End.

winx_club_last_till_2_6(Start,End) :- winx_club(Start1,End1), (End1-Start1)>=2, Start is (Start1+2), End is (End1+1).

winx_club_until_jessie_during_2_6_overlap(Start,End) :- winx_club_last_till_2_6(Start1,End1), jessie(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

winx_club_until_jessie_during_2_6(Start,End) :- winx_club(W1,_), winx_club_until_jessie_during_2_6_overlap(Start1,End1), Start is max((Start1-6),W1), End is (End1-2), Start=<End.

winx_club_until_jessie_during_2_6_at_2012(Res) :- setof((Start,End),winx_club_until_jessie_during_2_6(Start,End),AllINtervals), checkvalidity(2012,AllINtervals,Res).

check_query() :- write('Query = winx_club_until_jessie_during_2_6_at_2012'), (winx_club_until_jessie_during_2_6_at_2012(true) -> write('\nRes   = true');write('\nRes   = false')).

