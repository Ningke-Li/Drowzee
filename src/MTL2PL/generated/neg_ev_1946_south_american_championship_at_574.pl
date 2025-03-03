:- include('database.pl').
ev_1946_south_american_championship(Start,End) :- begin('ev_1946_south_american_championship',_,_,Start), end('ev_1946_south_american_championship',_,_,End), Start=<End.

compare_ev_1946_south_american_championship(Dir,ev_1946_south_american_championship(Start1,_),ev_1946_south_american_championship(Start2,_)) :- Start1=<Start2.

generate_neg_ev_1946_south_american_championship([]).

generate_neg_ev_1946_south_american_championship([(Start,End) | Tail]) :- assert(neg_ev_1946_south_american_championship(Start,End)), generate_neg_ev_1946_south_american_championship(Tail).

sort_ev_1946_south_american_championship(SortedIntervals) :- findall((Start,End),ev_1946_south_american_championship(Start,End),UnsortedIntervals), predsort(compare_ev_1946_south_american_championship,UnsortedIntervals,SortedIntervals).

generate_neg_ev_1946_south_american_championship_aux() :- sort_ev_1946_south_american_championship(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_ev_1946_south_american_championship(NegatedIntervals).

neg_ev_1946_south_american_championship_at_574(Res) :- setof((Start,End),neg_ev_1946_south_american_championship(Start,End),AllINtervals), checkvalidity(574,AllINtervals,Res).

check_query() :- write('Query = neg_ev_1946_south_american_championship_at_574'), (neg_ev_1946_south_american_championship_at_574(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_ev_1946_south_american_championship_aux().

