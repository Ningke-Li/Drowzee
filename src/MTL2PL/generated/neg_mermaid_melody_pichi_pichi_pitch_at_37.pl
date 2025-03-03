:- include('database.pl').
mermaid_melody_pichi_pichi_pitch(Start,End) :- begin('mermaid_melody_pichi_pichi_pitch',_,_,Start), end('mermaid_melody_pichi_pichi_pitch',_,_,End), Start=<End.

compare_mermaid_melody_pichi_pichi_pitch(Dir,mermaid_melody_pichi_pichi_pitch(Start1,_),mermaid_melody_pichi_pichi_pitch(Start2,_)) :- Start1=<Start2.

generate_neg_mermaid_melody_pichi_pichi_pitch([]).

generate_neg_mermaid_melody_pichi_pichi_pitch([(Start,End) | Tail]) :- assert(neg_mermaid_melody_pichi_pichi_pitch(Start,End)), generate_neg_mermaid_melody_pichi_pichi_pitch(Tail).

sort_mermaid_melody_pichi_pichi_pitch(SortedIntervals) :- findall((Start,End),mermaid_melody_pichi_pichi_pitch(Start,End),UnsortedIntervals), predsort(compare_mermaid_melody_pichi_pichi_pitch,UnsortedIntervals,SortedIntervals).

generate_neg_mermaid_melody_pichi_pichi_pitch_aux() :- sort_mermaid_melody_pichi_pichi_pitch(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_mermaid_melody_pichi_pichi_pitch(NegatedIntervals).

neg_mermaid_melody_pichi_pichi_pitch_at_37(Res) :- setof((Start,End),neg_mermaid_melody_pichi_pichi_pitch(Start,End),AllINtervals), checkvalidity(37,AllINtervals,Res).

check_query() :- write('Query = neg_mermaid_melody_pichi_pichi_pitch_at_37'), (neg_mermaid_melody_pichi_pichi_pitch_at_37(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_mermaid_melody_pichi_pichi_pitch_aux().

