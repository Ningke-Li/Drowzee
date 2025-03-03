:- include('database.pl').
the_penguins_of_madagascar(Start,End) :- begin('the_penguins_of_madagascar',_,_,Start), end('the_penguins_of_madagascar',_,_,End), Start=<End.

ev_2014_15_fu_ball_bundesliga(Start,End) :- begin('ev_2014_15_fu_ball_bundesliga',_,_,Start), end('ev_2014_15_fu_ball_bundesliga',_,_,End), Start=<End.

the_penguins_of_madagascar_last_till_1_11(Start,End) :- the_penguins_of_madagascar(Start1,End1), (End1-Start1)>=1, Start is (Start1+1), End is (End1+1).

the_penguins_of_madagascar_until_ev_2014_15_fu_ball_bundesliga_during_1_11_overlap(Start,End) :- the_penguins_of_madagascar_last_till_1_11(Start1,End1), ev_2014_15_fu_ball_bundesliga(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

the_penguins_of_madagascar_until_ev_2014_15_fu_ball_bundesliga_during_1_11(Start,End) :- the_penguins_of_madagascar(W1,_), the_penguins_of_madagascar_until_ev_2014_15_fu_ball_bundesliga_during_1_11_overlap(Start1,End1), Start is max((Start1-11),W1), End is (End1-1), Start=<End.

the_penguins_of_madagascar_until_ev_2014_15_fu_ball_bundesliga_during_1_11_at_1947(Res) :- setof((Start,End),the_penguins_of_madagascar_until_ev_2014_15_fu_ball_bundesliga_during_1_11(Start,End),AllINtervals), checkvalidity(1947,AllINtervals,Res).

check_query() :- write('Query = the_penguins_of_madagascar_until_ev_2014_15_fu_ball_bundesliga_during_1_11_at_1947'), (the_penguins_of_madagascar_until_ev_2014_15_fu_ball_bundesliga_during_1_11_at_1947(true) -> write('\nRes   = true');write('\nRes   = false')).

