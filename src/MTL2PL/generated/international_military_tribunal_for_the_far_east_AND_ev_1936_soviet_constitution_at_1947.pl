:- include('database.pl').
international_military_tribunal_for_the_far_east(Start,End) :- begin('international_military_tribunal_for_the_far_east',_,_,Start), end('international_military_tribunal_for_the_far_east',_,_,End), Start=<End.

ev_1936_soviet_constitution(Start,End) :- begin('ev_1936_soviet_constitution',_,_,Start), end('ev_1936_soviet_constitution',_,_,End), Start=<End.

generate_facts_international_military_tribunal_for_the_far_east_AND_ev_1936_soviet_constitution([]) :- assert(international_military_tribunal_for_the_far_east_AND_ev_1936_soviet_constitution(-1,-1)).

generate_facts_international_military_tribunal_for_the_far_east_AND_ev_1936_soviet_constitution([(Start,End) | Tail]) :- assert(international_military_tribunal_for_the_far_east_AND_ev_1936_soviet_constitution(Start,End)), generate_facts_international_military_tribunal_for_the_far_east_AND_ev_1936_soviet_constitution(Tail).

international_military_tribunal_for_the_far_east_AND_ev_1936_soviet_constitution_aux() :- findall((Start,End),international_military_tribunal_for_the_far_east(Start,End),Interval1), findall((Start,End),ev_1936_soviet_constitution(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_international_military_tribunal_for_the_far_east_AND_ev_1936_soviet_constitution(Interval).

international_military_tribunal_for_the_far_east_AND_ev_1936_soviet_constitution_at_1947(Res) :- setof((Start,End),international_military_tribunal_for_the_far_east_AND_ev_1936_soviet_constitution(Start,End),AllINtervals), checkvalidity(1947,AllINtervals,Res).

check_query() :- write('Query = international_military_tribunal_for_the_far_east_AND_ev_1936_soviet_constitution_at_1947'), (international_military_tribunal_for_the_far_east_AND_ev_1936_soviet_constitution_at_1947(true) -> write('\nRes   = true');write('\nRes   = false')).
?- international_military_tribunal_for_the_far_east_AND_ev_1936_soviet_constitution_aux().

