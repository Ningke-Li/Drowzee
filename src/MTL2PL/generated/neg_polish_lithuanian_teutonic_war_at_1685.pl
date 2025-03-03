:- include('database.pl').
polish_lithuanian_teutonic_war(Start,End) :- begin('polish_lithuanian_teutonic_war',_,_,Start), end('polish_lithuanian_teutonic_war',_,_,End), Start=<End.

compare_polish_lithuanian_teutonic_war(Dir,polish_lithuanian_teutonic_war(Start1,_),polish_lithuanian_teutonic_war(Start2,_)) :- Start1=<Start2.

generate_neg_polish_lithuanian_teutonic_war([]).

generate_neg_polish_lithuanian_teutonic_war([(Start,End) | Tail]) :- assert(neg_polish_lithuanian_teutonic_war(Start,End)), generate_neg_polish_lithuanian_teutonic_war(Tail).

sort_polish_lithuanian_teutonic_war(SortedIntervals) :- findall((Start,End),polish_lithuanian_teutonic_war(Start,End),UnsortedIntervals), predsort(compare_polish_lithuanian_teutonic_war,UnsortedIntervals,SortedIntervals).

generate_neg_polish_lithuanian_teutonic_war_aux() :- sort_polish_lithuanian_teutonic_war(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_polish_lithuanian_teutonic_war(NegatedIntervals).

neg_polish_lithuanian_teutonic_war_at_1685(Res) :- setof((Start,End),neg_polish_lithuanian_teutonic_war(Start,End),AllINtervals), checkvalidity(1685,AllINtervals,Res).

check_query() :- write('Query = neg_polish_lithuanian_teutonic_war_at_1685'), (neg_polish_lithuanian_teutonic_war_at_1685(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_polish_lithuanian_teutonic_war_aux().

