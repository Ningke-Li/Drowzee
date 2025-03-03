:- include('database.pl').
congress_of_vienna(Start,End) :- begin('congress_of_vienna',_,_,Start), end('congress_of_vienna',_,_,End), Start=<End.

underground_railroad(Start,End) :- begin('underground_railroad',_,_,Start), end('underground_railroad',_,_,End), Start=<End.

generate_facts_congress_of_vienna_AND_underground_railroad([]) :- assert(congress_of_vienna_AND_underground_railroad(-1,-1)).

generate_facts_congress_of_vienna_AND_underground_railroad([(Start,End) | Tail]) :- assert(congress_of_vienna_AND_underground_railroad(Start,End)), generate_facts_congress_of_vienna_AND_underground_railroad(Tail).

congress_of_vienna_AND_underground_railroad_aux() :- findall((Start,End),congress_of_vienna(Start,End),Interval1), findall((Start,End),underground_railroad(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_congress_of_vienna_AND_underground_railroad(Interval).

congress_of_vienna_AND_underground_railroad_at_1756(Res) :- setof((Start,End),congress_of_vienna_AND_underground_railroad(Start,End),AllINtervals), checkvalidity(1756,AllINtervals,Res).

check_query() :- write('Query = congress_of_vienna_AND_underground_railroad_at_1756'), (congress_of_vienna_AND_underground_railroad_at_1756(true) -> write('\nRes   = true');write('\nRes   = false')).
?- congress_of_vienna_AND_underground_railroad_aux().

