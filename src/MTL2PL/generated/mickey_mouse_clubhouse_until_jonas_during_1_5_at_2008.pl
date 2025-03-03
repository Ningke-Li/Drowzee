:- include('database.pl').
mickey_mouse_clubhouse(Start,End) :- begin('mickey_mouse_clubhouse',_,_,Start), end('mickey_mouse_clubhouse',_,_,End), Start=<End.

jonas(Start,End) :- begin('jonas',_,_,Start), end('jonas',_,_,End), Start=<End.

mickey_mouse_clubhouse_last_till_1_5(Start,End) :- mickey_mouse_clubhouse(Start1,End1), (End1-Start1)>=1, Start is (Start1+1), End is (End1+1).

mickey_mouse_clubhouse_until_jonas_during_1_5_overlap(Start,End) :- mickey_mouse_clubhouse_last_till_1_5(Start1,End1), jonas(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

mickey_mouse_clubhouse_until_jonas_during_1_5(Start,End) :- mickey_mouse_clubhouse(W1,_), mickey_mouse_clubhouse_until_jonas_during_1_5_overlap(Start1,End1), Start is max((Start1-5),W1), End is (End1-1), Start=<End.

mickey_mouse_clubhouse_until_jonas_during_1_5_at_2008(Res) :- setof((Start,End),mickey_mouse_clubhouse_until_jonas_during_1_5(Start,End),AllINtervals), checkvalidity(2008,AllINtervals,Res).

check_query() :- write('Query = mickey_mouse_clubhouse_until_jonas_during_1_5_at_2008'), (mickey_mouse_clubhouse_until_jonas_during_1_5_at_2008(true) -> write('\nRes   = true');write('\nRes   = false')).

