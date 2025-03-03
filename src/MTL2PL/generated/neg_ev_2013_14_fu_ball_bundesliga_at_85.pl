:- include('database.pl').
ev_2013_14_fu_ball_bundesliga(Start,End) :- begin('ev_2013_14_fu_ball_bundesliga',_,_,Start), end('ev_2013_14_fu_ball_bundesliga',_,_,End), Start=<End.

compare_ev_2013_14_fu_ball_bundesliga(Dir,ev_2013_14_fu_ball_bundesliga(Start1,_),ev_2013_14_fu_ball_bundesliga(Start2,_)) :- Start1=<Start2.

generate_neg_ev_2013_14_fu_ball_bundesliga([]).

generate_neg_ev_2013_14_fu_ball_bundesliga([(Start,End) | Tail]) :- assert(neg_ev_2013_14_fu_ball_bundesliga(Start,End)), generate_neg_ev_2013_14_fu_ball_bundesliga(Tail).

sort_ev_2013_14_fu_ball_bundesliga(SortedIntervals) :- findall((Start,End),ev_2013_14_fu_ball_bundesliga(Start,End),UnsortedIntervals), predsort(compare_ev_2013_14_fu_ball_bundesliga,UnsortedIntervals,SortedIntervals).

generate_neg_ev_2013_14_fu_ball_bundesliga_aux() :- sort_ev_2013_14_fu_ball_bundesliga(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_ev_2013_14_fu_ball_bundesliga(NegatedIntervals).

neg_ev_2013_14_fu_ball_bundesliga_at_85(Res) :- setof((Start,End),neg_ev_2013_14_fu_ball_bundesliga(Start,End),AllINtervals), checkvalidity(85,AllINtervals,Res).

check_query() :- write('Query = neg_ev_2013_14_fu_ball_bundesliga_at_85'), (neg_ev_2013_14_fu_ball_bundesliga_at_85(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_ev_2013_14_fu_ball_bundesliga_aux().

