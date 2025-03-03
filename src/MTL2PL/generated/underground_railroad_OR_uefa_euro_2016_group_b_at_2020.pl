:- include('database.pl').
underground_railroad(Start,End) :- begin('underground_railroad',_,_,Start), end('underground_railroad',_,_,End), Start=<End.

uefa_euro_2016_group_b(Start,End) :- begin('uefa_euro_2016_group_b',_,_,Start), end('uefa_euro_2016_group_b',_,_,End), Start=<End.

generate_facts_underground_railroad_OR_uefa_euro_2016_group_b([]) :- assert(underground_railroad_OR_uefa_euro_2016_group_b(-1,-1)).

generate_facts_underground_railroad_OR_uefa_euro_2016_group_b([(Start,End) | Tail]) :- assert(underground_railroad_OR_uefa_euro_2016_group_b(Start,End)), generate_facts_underground_railroad_OR_uefa_euro_2016_group_b(Tail).

underground_railroad_OR_uefa_euro_2016_group_b_aux() :- findall((Start,End),underground_railroad(Start,End),Interval1), findall((Start,End),uefa_euro_2016_group_b(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_underground_railroad_OR_uefa_euro_2016_group_b(Interval).

underground_railroad_OR_uefa_euro_2016_group_b_at_2020(Res) :- setof((Start,End),underground_railroad_OR_uefa_euro_2016_group_b(Start,End),AllINtervals), checkvalidity(2020,AllINtervals,Res).

check_query() :- write('Query = underground_railroad_OR_uefa_euro_2016_group_b_at_2020'), (underground_railroad_OR_uefa_euro_2016_group_b_at_2020(true) -> write('\nRes   = true');write('\nRes   = false')).
?- underground_railroad_OR_uefa_euro_2016_group_b_aux().

