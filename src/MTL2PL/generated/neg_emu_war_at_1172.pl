:- include('database.pl').
emu_war(Start,End) :- begin('emu_war',_,_,Start), end('emu_war',_,_,End), Start=<End.

compare_emu_war(Dir,emu_war(Start1,_),emu_war(Start2,_)) :- Start1=<Start2.

generate_neg_emu_war([]).

generate_neg_emu_war([(Start,End) | Tail]) :- assert(neg_emu_war(Start,End)), generate_neg_emu_war(Tail).

sort_emu_war(SortedIntervals) :- findall((Start,End),emu_war(Start,End),UnsortedIntervals), predsort(compare_emu_war,UnsortedIntervals,SortedIntervals).

generate_neg_emu_war_aux() :- sort_emu_war(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_emu_war(NegatedIntervals).

neg_emu_war_at_1172(Res) :- setof((Start,End),neg_emu_war(Start,End),AllINtervals), checkvalidity(1172,AllINtervals,Res).

check_query() :- write('Query = neg_emu_war_at_1172'), (neg_emu_war_at_1172(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_emu_war_aux().

