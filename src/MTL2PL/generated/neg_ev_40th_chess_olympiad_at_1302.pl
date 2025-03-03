:- include('database.pl').
ev_40th_chess_olympiad(Start,End) :- begin('ev_40th_chess_olympiad',_,_,Start), end('ev_40th_chess_olympiad',_,_,End), Start=<End.

compare_ev_40th_chess_olympiad(Dir,ev_40th_chess_olympiad(Start1,_),ev_40th_chess_olympiad(Start2,_)) :- Start1=<Start2.

generate_neg_ev_40th_chess_olympiad([]).

generate_neg_ev_40th_chess_olympiad([(Start,End) | Tail]) :- assert(neg_ev_40th_chess_olympiad(Start,End)), generate_neg_ev_40th_chess_olympiad(Tail).

sort_ev_40th_chess_olympiad(SortedIntervals) :- findall((Start,End),ev_40th_chess_olympiad(Start,End),UnsortedIntervals), predsort(compare_ev_40th_chess_olympiad,UnsortedIntervals,SortedIntervals).

generate_neg_ev_40th_chess_olympiad_aux() :- sort_ev_40th_chess_olympiad(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_ev_40th_chess_olympiad(NegatedIntervals).

neg_ev_40th_chess_olympiad_at_1302(Res) :- setof((Start,End),neg_ev_40th_chess_olympiad(Start,End),AllINtervals), checkvalidity(1302,AllINtervals,Res).

check_query() :- write('Query = neg_ev_40th_chess_olympiad_at_1302'), (neg_ev_40th_chess_olympiad_at_1302(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_ev_40th_chess_olympiad_aux().

