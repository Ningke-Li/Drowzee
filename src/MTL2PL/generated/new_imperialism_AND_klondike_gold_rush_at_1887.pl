:- include('database.pl').
new_imperialism(Start,End) :- begin('new_imperialism',_,_,Start), end('new_imperialism',_,_,End), Start=<End.

klondike_gold_rush(Start,End) :- begin('klondike_gold_rush',_,_,Start), end('klondike_gold_rush',_,_,End), Start=<End.

generate_facts_new_imperialism_AND_klondike_gold_rush([]) :- assert(new_imperialism_AND_klondike_gold_rush(-1,-1)).

generate_facts_new_imperialism_AND_klondike_gold_rush([(Start,End) | Tail]) :- assert(new_imperialism_AND_klondike_gold_rush(Start,End)), generate_facts_new_imperialism_AND_klondike_gold_rush(Tail).

new_imperialism_AND_klondike_gold_rush_aux() :- findall((Start,End),new_imperialism(Start,End),Interval1), findall((Start,End),klondike_gold_rush(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_new_imperialism_AND_klondike_gold_rush(Interval).

new_imperialism_AND_klondike_gold_rush_at_1887(Res) :- setof((Start,End),new_imperialism_AND_klondike_gold_rush(Start,End),AllINtervals), checkvalidity(1887,AllINtervals,Res).

check_query() :- write('Query = new_imperialism_AND_klondike_gold_rush_at_1887'), (new_imperialism_AND_klondike_gold_rush_at_1887(true) -> write('\nRes   = true');write('\nRes   = false')).
?- new_imperialism_AND_klondike_gold_rush_aux().

