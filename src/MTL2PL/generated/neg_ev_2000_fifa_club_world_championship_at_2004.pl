:- include('database.pl').
ev_2000_fifa_club_world_championship(Start,End) :- begin('ev_2000_fifa_club_world_championship',_,_,Start), end('ev_2000_fifa_club_world_championship',_,_,End), Start=<End.

compare_ev_2000_fifa_club_world_championship(Dir,ev_2000_fifa_club_world_championship(Start1,_),ev_2000_fifa_club_world_championship(Start2,_)) :- Start1=<Start2.

generate_neg_ev_2000_fifa_club_world_championship([]).

generate_neg_ev_2000_fifa_club_world_championship([(Start,End) | Tail]) :- assert(neg_ev_2000_fifa_club_world_championship(Start,End)), generate_neg_ev_2000_fifa_club_world_championship(Tail).

sort_ev_2000_fifa_club_world_championship(SortedIntervals) :- findall((Start,End),ev_2000_fifa_club_world_championship(Start,End),UnsortedIntervals), predsort(compare_ev_2000_fifa_club_world_championship,UnsortedIntervals,SortedIntervals).

generate_neg_ev_2000_fifa_club_world_championship_aux() :- sort_ev_2000_fifa_club_world_championship(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_ev_2000_fifa_club_world_championship(NegatedIntervals).

neg_ev_2000_fifa_club_world_championship_at_2004(Res) :- setof((Start,End),neg_ev_2000_fifa_club_world_championship(Start,End),AllINtervals), checkvalidity(2004,AllINtervals,Res).

check_query() :- write('Query = neg_ev_2000_fifa_club_world_championship_at_2004'), (neg_ev_2000_fifa_club_world_championship_at_2004(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_ev_2000_fifa_club_world_championship_aux().

