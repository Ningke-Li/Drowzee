:- include('database.pl').
western_african_ebola_virus_epidemic(Start,End) :- begin('western_african_ebola_virus_epidemic',_,_,Start), end('western_african_ebola_virus_epidemic',_,_,End), Start=<End.

compare_western_african_ebola_virus_epidemic(Dir,western_african_ebola_virus_epidemic(Start1,_),western_african_ebola_virus_epidemic(Start2,_)) :- Start1=<Start2.

generate_neg_western_african_ebola_virus_epidemic([]).

generate_neg_western_african_ebola_virus_epidemic([(Start,End) | Tail]) :- assert(neg_western_african_ebola_virus_epidemic(Start,End)), generate_neg_western_african_ebola_virus_epidemic(Tail).

sort_western_african_ebola_virus_epidemic(SortedIntervals) :- findall((Start,End),western_african_ebola_virus_epidemic(Start,End),UnsortedIntervals), predsort(compare_western_african_ebola_virus_epidemic,UnsortedIntervals,SortedIntervals).

generate_neg_western_african_ebola_virus_epidemic_aux() :- sort_western_african_ebola_virus_epidemic(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_western_african_ebola_virus_epidemic(NegatedIntervals).

neg_western_african_ebola_virus_epidemic_at_1500(Res) :- setof((Start,End),neg_western_african_ebola_virus_epidemic(Start,End),AllINtervals), checkvalidity(1500,AllINtervals,Res).

check_query() :- write('Query = neg_western_african_ebola_virus_epidemic_at_1500'), (neg_western_african_ebola_virus_epidemic_at_1500(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_western_african_ebola_virus_epidemic_aux().

