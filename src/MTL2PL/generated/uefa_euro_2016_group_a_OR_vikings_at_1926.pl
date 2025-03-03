:- include('database.pl').
uefa_euro_2016_group_a(Start,End) :- begin('uefa_euro_2016_group_a',_,_,Start), end('uefa_euro_2016_group_a',_,_,End), Start=<End.

vikings(Start,End) :- begin('vikings',_,_,Start), end('vikings',_,_,End), Start=<End.

generate_facts_uefa_euro_2016_group_a_OR_vikings([]) :- assert(uefa_euro_2016_group_a_OR_vikings(-1,-1)).

generate_facts_uefa_euro_2016_group_a_OR_vikings([(Start,End) | Tail]) :- assert(uefa_euro_2016_group_a_OR_vikings(Start,End)), generate_facts_uefa_euro_2016_group_a_OR_vikings(Tail).

uefa_euro_2016_group_a_OR_vikings_aux() :- findall((Start,End),uefa_euro_2016_group_a(Start,End),Interval1), findall((Start,End),vikings(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_uefa_euro_2016_group_a_OR_vikings(Interval).

uefa_euro_2016_group_a_OR_vikings_at_1926(Res) :- setof((Start,End),uefa_euro_2016_group_a_OR_vikings(Start,End),AllINtervals), checkvalidity(1926,AllINtervals,Res).

check_query() :- write('Query = uefa_euro_2016_group_a_OR_vikings_at_1926'), (uefa_euro_2016_group_a_OR_vikings_at_1926(true) -> write('\nRes   = true');write('\nRes   = false')).
?- uefa_euro_2016_group_a_OR_vikings_aux().

