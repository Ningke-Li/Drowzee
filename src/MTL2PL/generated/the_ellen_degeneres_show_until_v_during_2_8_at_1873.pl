:- include('database.pl').
the_ellen_degeneres_show(Start,End) :- begin('the_ellen_degeneres_show',_,_,Start), end('the_ellen_degeneres_show',_,_,End), Start=<End.

v(Start,End) :- begin('v',_,_,Start), end('v',_,_,End), Start=<End.

the_ellen_degeneres_show_last_till_2_8(Start,End) :- the_ellen_degeneres_show(Start1,End1), (End1-Start1)>=2, Start is (Start1+2), End is (End1+1).

the_ellen_degeneres_show_until_v_during_2_8_overlap(Start,End) :- the_ellen_degeneres_show_last_till_2_8(Start1,End1), v(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

the_ellen_degeneres_show_until_v_during_2_8(Start,End) :- the_ellen_degeneres_show(W1,_), the_ellen_degeneres_show_until_v_during_2_8_overlap(Start1,End1), Start is max((Start1-8),W1), End is (End1-2), Start=<End.

the_ellen_degeneres_show_until_v_during_2_8_at_1873(Res) :- setof((Start,End),the_ellen_degeneres_show_until_v_during_2_8(Start,End),AllINtervals), checkvalidity(1873,AllINtervals,Res).

check_query() :- write('Query = the_ellen_degeneres_show_until_v_during_2_8_at_1873'), (the_ellen_degeneres_show_until_v_during_2_8_at_1873(true) -> write('\nRes   = true');write('\nRes   = false')).

