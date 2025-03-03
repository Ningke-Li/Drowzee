:- include('database.pl').
sofia_the_first(Start,End) :- begin('sofia_the_first',_,_,Start), end('sofia_the_first',_,_,End), Start=<End.

uefa_euro_2016_qualifying(Start,End) :- begin('uefa_euro_2016_qualifying',_,_,Start), end('uefa_euro_2016_qualifying',_,_,End), Start=<End.

generate_facts_sofia_the_first_AND_uefa_euro_2016_qualifying([]) :- assert(sofia_the_first_AND_uefa_euro_2016_qualifying(-1,-1)).

generate_facts_sofia_the_first_AND_uefa_euro_2016_qualifying([(Start,End) | Tail]) :- assert(sofia_the_first_AND_uefa_euro_2016_qualifying(Start,End)), generate_facts_sofia_the_first_AND_uefa_euro_2016_qualifying(Tail).

sofia_the_first_AND_uefa_euro_2016_qualifying_aux() :- findall((Start,End),sofia_the_first(Start,End),Interval1), findall((Start,End),uefa_euro_2016_qualifying(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_sofia_the_first_AND_uefa_euro_2016_qualifying(Interval).

sofia_the_first_AND_uefa_euro_2016_qualifying_at_2055(Res) :- setof((Start,End),sofia_the_first_AND_uefa_euro_2016_qualifying(Start,End),AllINtervals), checkvalidity(2055,AllINtervals,Res).

check_query() :- write('Query = sofia_the_first_AND_uefa_euro_2016_qualifying_at_2055'), (sofia_the_first_AND_uefa_euro_2016_qualifying_at_2055(true) -> write('\nRes   = true');write('\nRes   = false')).
?- sofia_the_first_AND_uefa_euro_2016_qualifying_aux().

