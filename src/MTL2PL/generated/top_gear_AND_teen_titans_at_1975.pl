:- include('database.pl').
top_gear(Start,End) :- begin('top_gear',_,_,Start), end('top_gear',_,_,End), Start=<End.

teen_titans(Start,End) :- begin('teen_titans',_,_,Start), end('teen_titans',_,_,End), Start=<End.

generate_facts_top_gear_AND_teen_titans([]) :- assert(top_gear_AND_teen_titans(-1,-1)).

generate_facts_top_gear_AND_teen_titans([(Start,End) | Tail]) :- assert(top_gear_AND_teen_titans(Start,End)), generate_facts_top_gear_AND_teen_titans(Tail).

top_gear_AND_teen_titans_aux() :- findall((Start,End),top_gear(Start,End),Interval1), findall((Start,End),teen_titans(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_top_gear_AND_teen_titans(Interval).

top_gear_AND_teen_titans_at_1975(Res) :- setof((Start,End),top_gear_AND_teen_titans(Start,End),AllINtervals), checkvalidity(1975,AllINtervals,Res).

check_query() :- write('Query = top_gear_AND_teen_titans_at_1975'), (top_gear_AND_teen_titans_at_1975(true) -> write('\nRes   = true');write('\nRes   = false')).
?- top_gear_AND_teen_titans_aux().

