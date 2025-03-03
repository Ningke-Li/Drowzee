:- include('database.pl').
the_big_bang_theory(Start,End) :- begin('the_big_bang_theory',_,_,Start), end('the_big_bang_theory',_,_,End), Start=<End.

mr__robot(Start,End) :- begin('mr__robot',_,_,Start), end('mr__robot',_,_,End), Start=<End.

the_big_bang_theory_last_till_7_14(Start,End) :- the_big_bang_theory(Start1,End1), (End1-Start1)>=7, Start is (Start1+7), End is (End1+1).

the_big_bang_theory_until_mr__robot_during_7_14_overlap(Start,End) :- the_big_bang_theory_last_till_7_14(Start1,End1), mr__robot(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

the_big_bang_theory_until_mr__robot_during_7_14(Start,End) :- the_big_bang_theory(W1,_), the_big_bang_theory_until_mr__robot_during_7_14_overlap(Start1,End1), Start is max((Start1-14),W1), End is (End1-7), Start=<End.

the_big_bang_theory_until_mr__robot_during_7_14_at_2043(Res) :- setof((Start,End),the_big_bang_theory_until_mr__robot_during_7_14(Start,End),AllINtervals), checkvalidity(2043,AllINtervals,Res).

check_query() :- write('Query = the_big_bang_theory_until_mr__robot_during_7_14_at_2043'), (the_big_bang_theory_until_mr__robot_during_7_14_at_2043(true) -> write('\nRes   = true');write('\nRes   = false')).

