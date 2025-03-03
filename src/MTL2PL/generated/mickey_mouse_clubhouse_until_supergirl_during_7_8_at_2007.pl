:- include('database.pl').
mickey_mouse_clubhouse(Start,End) :- begin('mickey_mouse_clubhouse',_,_,Start), end('mickey_mouse_clubhouse',_,_,End), Start=<End.

supergirl(Start,End) :- begin('supergirl',_,_,Start), end('supergirl',_,_,End), Start=<End.

mickey_mouse_clubhouse_last_till_7_8(Start,End) :- mickey_mouse_clubhouse(Start1,End1), (End1-Start1)>=7, Start is (Start1+7), End is (End1+1).

mickey_mouse_clubhouse_until_supergirl_during_7_8_overlap(Start,End) :- mickey_mouse_clubhouse_last_till_7_8(Start1,End1), supergirl(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

mickey_mouse_clubhouse_until_supergirl_during_7_8(Start,End) :- mickey_mouse_clubhouse(W1,_), mickey_mouse_clubhouse_until_supergirl_during_7_8_overlap(Start1,End1), Start is max((Start1-8),W1), End is (End1-7), Start=<End.

mickey_mouse_clubhouse_until_supergirl_during_7_8_at_2007(Res) :- setof((Start,End),mickey_mouse_clubhouse_until_supergirl_during_7_8(Start,End),AllINtervals), checkvalidity(2007,AllINtervals,Res).

check_query() :- write('Query = mickey_mouse_clubhouse_until_supergirl_during_7_8_at_2007'), (mickey_mouse_clubhouse_until_supergirl_during_7_8_at_2007(true) -> write('\nRes   = true');write('\nRes   = false')).

