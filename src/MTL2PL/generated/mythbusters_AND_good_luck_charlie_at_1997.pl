:- include('database.pl').
mythbusters(Start,End) :- begin('mythbusters',_,_,Start), end('mythbusters',_,_,End), Start=<End.

good_luck_charlie(Start,End) :- begin('good_luck_charlie',_,_,Start), end('good_luck_charlie',_,_,End), Start=<End.

generate_facts_mythbusters_AND_good_luck_charlie([]) :- assert(mythbusters_AND_good_luck_charlie(-1,-1)).

generate_facts_mythbusters_AND_good_luck_charlie([(Start,End) | Tail]) :- assert(mythbusters_AND_good_luck_charlie(Start,End)), generate_facts_mythbusters_AND_good_luck_charlie(Tail).

mythbusters_AND_good_luck_charlie_aux() :- findall((Start,End),mythbusters(Start,End),Interval1), findall((Start,End),good_luck_charlie(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_mythbusters_AND_good_luck_charlie(Interval).

mythbusters_AND_good_luck_charlie_at_1997(Res) :- setof((Start,End),mythbusters_AND_good_luck_charlie(Start,End),AllINtervals), checkvalidity(1997,AllINtervals,Res).

check_query() :- write('Query = mythbusters_AND_good_luck_charlie_at_1997'), (mythbusters_AND_good_luck_charlie_at_1997(true) -> write('\nRes   = true');write('\nRes   = false')).
?- mythbusters_AND_good_luck_charlie_aux().

