:- include('database.pl').
death_note(Start,End) :- begin('death_note',_,_,Start), end('death_note',_,_,End), Start=<End.

compare_death_note(Dir,death_note(Start1,_),death_note(Start2,_)) :- Start1=<Start2.

generate_neg_death_note([]).

generate_neg_death_note([(Start,End) | Tail]) :- assert(neg_death_note(Start,End)), generate_neg_death_note(Tail).

sort_death_note(SortedIntervals) :- findall((Start,End),death_note(Start,End),UnsortedIntervals), predsort(compare_death_note,UnsortedIntervals,SortedIntervals).

generate_neg_death_note_aux() :- sort_death_note(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_death_note(NegatedIntervals).

neg_death_note_at_1640(Res) :- setof((Start,End),neg_death_note(Start,End),AllINtervals), checkvalidity(1640,AllINtervals,Res).

check_query() :- write('Query = neg_death_note_at_1640'), (neg_death_note_at_1640(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_death_note_aux().

