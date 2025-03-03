:- include('database.pl').
mickey_mouse_clubhouse(Start,End) :- begin('mickey_mouse_clubhouse',_,_,Start), end('mickey_mouse_clubhouse',_,_,End), Start=<End.

the_legend_of_korra(Start,End) :- begin('the_legend_of_korra',_,_,Start), end('the_legend_of_korra',_,_,End), Start=<End.

mickey_mouse_clubhouse_last_till_1_9(Start,End) :- mickey_mouse_clubhouse(Start1,End1), (End1-Start1)>=1, Start is (Start1+1), End is (End1+1).

mickey_mouse_clubhouse_until_the_legend_of_korra_during_1_9_overlap(Start,End) :- mickey_mouse_clubhouse_last_till_1_9(Start1,End1), the_legend_of_korra(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

mickey_mouse_clubhouse_until_the_legend_of_korra_during_1_9(Start,End) :- mickey_mouse_clubhouse(W1,_), mickey_mouse_clubhouse_until_the_legend_of_korra_during_1_9_overlap(Start1,End1), Start is max((Start1-9),W1), End is (End1-1), Start=<End.

mickey_mouse_clubhouse_until_the_legend_of_korra_during_1_9_at_2011(Res) :- setof((Start,End),mickey_mouse_clubhouse_until_the_legend_of_korra_during_1_9(Start,End),AllINtervals), checkvalidity(2011,AllINtervals,Res).

check_query() :- write('Query = mickey_mouse_clubhouse_until_the_legend_of_korra_during_1_9_at_2011'), (mickey_mouse_clubhouse_until_the_legend_of_korra_during_1_9_at_2011(true) -> write('\nRes   = true');write('\nRes   = false')).

