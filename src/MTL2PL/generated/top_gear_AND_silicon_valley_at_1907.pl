:- include('database.pl').
top_gear(Start,End) :- begin('top_gear',_,_,Start), end('top_gear',_,_,End), Start=<End.

silicon_valley(Start,End) :- begin('silicon_valley',_,_,Start), end('silicon_valley',_,_,End), Start=<End.

generate_facts_top_gear_AND_silicon_valley([]) :- assert(top_gear_AND_silicon_valley(-1,-1)).

generate_facts_top_gear_AND_silicon_valley([(Start,End) | Tail]) :- assert(top_gear_AND_silicon_valley(Start,End)), generate_facts_top_gear_AND_silicon_valley(Tail).

top_gear_AND_silicon_valley_aux() :- findall((Start,End),top_gear(Start,End),Interval1), findall((Start,End),silicon_valley(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_top_gear_AND_silicon_valley(Interval).

top_gear_AND_silicon_valley_at_1907(Res) :- setof((Start,End),top_gear_AND_silicon_valley(Start,End),AllINtervals), checkvalidity(1907,AllINtervals,Res).

check_query() :- write('Query = top_gear_AND_silicon_valley_at_1907'), (top_gear_AND_silicon_valley_at_1907(true) -> write('\nRes   = true');write('\nRes   = false')).
?- top_gear_AND_silicon_valley_aux().

