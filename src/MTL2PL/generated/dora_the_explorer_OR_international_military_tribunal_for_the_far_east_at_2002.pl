:- include('database.pl').
dora_the_explorer(Start,End) :- begin('dora_the_explorer',_,_,Start), end('dora_the_explorer',_,_,End), Start=<End.

international_military_tribunal_for_the_far_east(Start,End) :- begin('international_military_tribunal_for_the_far_east',_,_,Start), end('international_military_tribunal_for_the_far_east',_,_,End), Start=<End.

generate_facts_dora_the_explorer_OR_international_military_tribunal_for_the_far_east([]) :- assert(dora_the_explorer_OR_international_military_tribunal_for_the_far_east(-1,-1)).

generate_facts_dora_the_explorer_OR_international_military_tribunal_for_the_far_east([(Start,End) | Tail]) :- assert(dora_the_explorer_OR_international_military_tribunal_for_the_far_east(Start,End)), generate_facts_dora_the_explorer_OR_international_military_tribunal_for_the_far_east(Tail).

dora_the_explorer_OR_international_military_tribunal_for_the_far_east_aux() :- findall((Start,End),dora_the_explorer(Start,End),Interval1), findall((Start,End),international_military_tribunal_for_the_far_east(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_dora_the_explorer_OR_international_military_tribunal_for_the_far_east(Interval).

dora_the_explorer_OR_international_military_tribunal_for_the_far_east_at_2002(Res) :- setof((Start,End),dora_the_explorer_OR_international_military_tribunal_for_the_far_east(Start,End),AllINtervals), checkvalidity(2002,AllINtervals,Res).

check_query() :- write('Query = dora_the_explorer_OR_international_military_tribunal_for_the_far_east_at_2002'), (dora_the_explorer_OR_international_military_tribunal_for_the_far_east_at_2002(true) -> write('\nRes   = true');write('\nRes   = false')).
?- dora_the_explorer_OR_international_military_tribunal_for_the_far_east_aux().

