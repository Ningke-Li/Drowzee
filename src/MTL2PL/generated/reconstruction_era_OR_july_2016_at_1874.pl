:- include('database.pl').
reconstruction_era(Start,End) :- begin('reconstruction_era',_,_,Start), end('reconstruction_era',_,_,End), Start=<End.

july_2016(Start,End) :- begin('july_2016',_,_,Start), end('july_2016',_,_,End), Start=<End.

generate_facts_reconstruction_era_OR_july_2016([]) :- assert(reconstruction_era_OR_july_2016(-1,-1)).

generate_facts_reconstruction_era_OR_july_2016([(Start,End) | Tail]) :- assert(reconstruction_era_OR_july_2016(Start,End)), generate_facts_reconstruction_era_OR_july_2016(Tail).

reconstruction_era_OR_july_2016_aux() :- findall((Start,End),reconstruction_era(Start,End),Interval1), findall((Start,End),july_2016(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_reconstruction_era_OR_july_2016(Interval).

reconstruction_era_OR_july_2016_at_1874(Res) :- setof((Start,End),reconstruction_era_OR_july_2016(Start,End),AllINtervals), checkvalidity(1874,AllINtervals,Res).

check_query() :- write('Query = reconstruction_era_OR_july_2016_at_1874'), (reconstruction_era_OR_july_2016_at_1874(true) -> write('\nRes   = true');write('\nRes   = false')).
?- reconstruction_era_OR_july_2016_aux().

