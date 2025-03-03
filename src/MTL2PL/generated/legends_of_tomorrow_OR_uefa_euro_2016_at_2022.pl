:- include('database.pl').
legends_of_tomorrow(Start,End) :- begin('legends_of_tomorrow',_,_,Start), end('legends_of_tomorrow',_,_,End), Start=<End.

uefa_euro_2016(Start,End) :- begin('uefa_euro_2016',_,_,Start), end('uefa_euro_2016',_,_,End), Start=<End.

generate_facts_legends_of_tomorrow_OR_uefa_euro_2016([]) :- assert(legends_of_tomorrow_OR_uefa_euro_2016(-1,-1)).

generate_facts_legends_of_tomorrow_OR_uefa_euro_2016([(Start,End) | Tail]) :- assert(legends_of_tomorrow_OR_uefa_euro_2016(Start,End)), generate_facts_legends_of_tomorrow_OR_uefa_euro_2016(Tail).

legends_of_tomorrow_OR_uefa_euro_2016_aux() :- findall((Start,End),legends_of_tomorrow(Start,End),Interval1), findall((Start,End),uefa_euro_2016(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_legends_of_tomorrow_OR_uefa_euro_2016(Interval).

legends_of_tomorrow_OR_uefa_euro_2016_at_2022(Res) :- setof((Start,End),legends_of_tomorrow_OR_uefa_euro_2016(Start,End),AllINtervals), checkvalidity(2022,AllINtervals,Res).

check_query() :- write('Query = legends_of_tomorrow_OR_uefa_euro_2016_at_2022'), (legends_of_tomorrow_OR_uefa_euro_2016_at_2022(true) -> write('\nRes   = true');write('\nRes   = false')).
?- legends_of_tomorrow_OR_uefa_euro_2016_aux().

