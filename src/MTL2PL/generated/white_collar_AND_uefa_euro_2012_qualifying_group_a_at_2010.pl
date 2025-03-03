:- include('database.pl').
white_collar(Start,End) :- begin('white_collar',_,_,Start), end('white_collar',_,_,End), Start=<End.

uefa_euro_2012_qualifying_group_a(Start,End) :- begin('uefa_euro_2012_qualifying_group_a',_,_,Start), end('uefa_euro_2012_qualifying_group_a',_,_,End), Start=<End.

generate_facts_white_collar_AND_uefa_euro_2012_qualifying_group_a([]) :- assert(white_collar_AND_uefa_euro_2012_qualifying_group_a(-1,-1)).

generate_facts_white_collar_AND_uefa_euro_2012_qualifying_group_a([(Start,End) | Tail]) :- assert(white_collar_AND_uefa_euro_2012_qualifying_group_a(Start,End)), generate_facts_white_collar_AND_uefa_euro_2012_qualifying_group_a(Tail).

white_collar_AND_uefa_euro_2012_qualifying_group_a_aux() :- findall((Start,End),white_collar(Start,End),Interval1), findall((Start,End),uefa_euro_2012_qualifying_group_a(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_white_collar_AND_uefa_euro_2012_qualifying_group_a(Interval).

white_collar_AND_uefa_euro_2012_qualifying_group_a_at_2010(Res) :- setof((Start,End),white_collar_AND_uefa_euro_2012_qualifying_group_a(Start,End),AllINtervals), checkvalidity(2010,AllINtervals,Res).

check_query() :- write('Query = white_collar_AND_uefa_euro_2012_qualifying_group_a_at_2010'), (white_collar_AND_uefa_euro_2012_qualifying_group_a_at_2010(true) -> write('\nRes   = true');write('\nRes   = false')).
?- white_collar_AND_uefa_euro_2012_qualifying_group_a_aux().

