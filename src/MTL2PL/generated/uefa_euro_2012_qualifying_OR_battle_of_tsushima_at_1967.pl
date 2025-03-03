:- include('database.pl').
uefa_euro_2012_qualifying(Start,End) :- begin('uefa_euro_2012_qualifying',_,_,Start), end('uefa_euro_2012_qualifying',_,_,End), Start=<End.

battle_of_tsushima(Start,End) :- begin('battle_of_tsushima',_,_,Start), end('battle_of_tsushima',_,_,End), Start=<End.

generate_facts_uefa_euro_2012_qualifying_OR_battle_of_tsushima([]) :- assert(uefa_euro_2012_qualifying_OR_battle_of_tsushima(-1,-1)).

generate_facts_uefa_euro_2012_qualifying_OR_battle_of_tsushima([(Start,End) | Tail]) :- assert(uefa_euro_2012_qualifying_OR_battle_of_tsushima(Start,End)), generate_facts_uefa_euro_2012_qualifying_OR_battle_of_tsushima(Tail).

uefa_euro_2012_qualifying_OR_battle_of_tsushima_aux() :- findall((Start,End),uefa_euro_2012_qualifying(Start,End),Interval1), findall((Start,End),battle_of_tsushima(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_uefa_euro_2012_qualifying_OR_battle_of_tsushima(Interval).

uefa_euro_2012_qualifying_OR_battle_of_tsushima_at_1967(Res) :- setof((Start,End),uefa_euro_2012_qualifying_OR_battle_of_tsushima(Start,End),AllINtervals), checkvalidity(1967,AllINtervals,Res).

check_query() :- write('Query = uefa_euro_2012_qualifying_OR_battle_of_tsushima_at_1967'), (uefa_euro_2012_qualifying_OR_battle_of_tsushima_at_1967(true) -> write('\nRes   = true');write('\nRes   = false')).
?- uefa_euro_2012_qualifying_OR_battle_of_tsushima_aux().

