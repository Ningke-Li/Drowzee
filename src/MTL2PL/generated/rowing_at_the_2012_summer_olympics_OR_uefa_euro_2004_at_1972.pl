:- include('database.pl').
rowing_at_the_2012_summer_olympics(Start,End) :- begin('rowing_at_the_2012_summer_olympics',_,_,Start), end('rowing_at_the_2012_summer_olympics',_,_,End), Start=<End.

uefa_euro_2004(Start,End) :- begin('uefa_euro_2004',_,_,Start), end('uefa_euro_2004',_,_,End), Start=<End.

generate_facts_rowing_at_the_2012_summer_olympics_OR_uefa_euro_2004([]) :- assert(rowing_at_the_2012_summer_olympics_OR_uefa_euro_2004(-1,-1)).

generate_facts_rowing_at_the_2012_summer_olympics_OR_uefa_euro_2004([(Start,End) | Tail]) :- assert(rowing_at_the_2012_summer_olympics_OR_uefa_euro_2004(Start,End)), generate_facts_rowing_at_the_2012_summer_olympics_OR_uefa_euro_2004(Tail).

rowing_at_the_2012_summer_olympics_OR_uefa_euro_2004_aux() :- findall((Start,End),rowing_at_the_2012_summer_olympics(Start,End),Interval1), findall((Start,End),uefa_euro_2004(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_rowing_at_the_2012_summer_olympics_OR_uefa_euro_2004(Interval).

rowing_at_the_2012_summer_olympics_OR_uefa_euro_2004_at_1972(Res) :- setof((Start,End),rowing_at_the_2012_summer_olympics_OR_uefa_euro_2004(Start,End),AllINtervals), checkvalidity(1972,AllINtervals,Res).

check_query() :- write('Query = rowing_at_the_2012_summer_olympics_OR_uefa_euro_2004_at_1972'), (rowing_at_the_2012_summer_olympics_OR_uefa_euro_2004_at_1972(true) -> write('\nRes   = true');write('\nRes   = false')).
?- rowing_at_the_2012_summer_olympics_OR_uefa_euro_2004_aux().

