:- include('database.pl').
the_big_bang_theory(Start,End) :- begin('the_big_bang_theory',_,_,Start), end('the_big_bang_theory',_,_,End), Start=<End.

born_this_way_ball(Start,End) :- begin('born_this_way_ball',_,_,Start), end('born_this_way_ball',_,_,End), Start=<End.

the_big_bang_theory_last_till_4_8(Start,End) :- the_big_bang_theory(Start1,End1), (End1-Start1)>=4, Start is (Start1+4), End is (End1+1).

the_big_bang_theory_until_born_this_way_ball_during_4_8_overlap(Start,End) :- the_big_bang_theory_last_till_4_8(Start1,End1), born_this_way_ball(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

the_big_bang_theory_until_born_this_way_ball_during_4_8(Start,End) :- the_big_bang_theory(W1,_), the_big_bang_theory_until_born_this_way_ball_during_4_8_overlap(Start1,End1), Start is max((Start1-8),W1), End is (End1-4), Start=<End.

the_big_bang_theory_until_born_this_way_ball_during_4_8_at_1985(Res) :- setof((Start,End),the_big_bang_theory_until_born_this_way_ball_during_4_8(Start,End),AllINtervals), checkvalidity(1985,AllINtervals,Res).

check_query() :- write('Query = the_big_bang_theory_until_born_this_way_ball_during_4_8_at_1985'), (the_big_bang_theory_until_born_this_way_ball_during_4_8_at_1985(true) -> write('\nRes   = true');write('\nRes   = false')).

