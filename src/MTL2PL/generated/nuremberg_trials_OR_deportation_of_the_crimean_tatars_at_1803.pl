:- include('database.pl').
nuremberg_trials(Start,End) :- begin('nuremberg_trials',_,_,Start), end('nuremberg_trials',_,_,End), Start=<End.

deportation_of_the_crimean_tatars(Start,End) :- begin('deportation_of_the_crimean_tatars',_,_,Start), end('deportation_of_the_crimean_tatars',_,_,End), Start=<End.

generate_facts_nuremberg_trials_OR_deportation_of_the_crimean_tatars([]) :- assert(nuremberg_trials_OR_deportation_of_the_crimean_tatars(-1,-1)).

generate_facts_nuremberg_trials_OR_deportation_of_the_crimean_tatars([(Start,End) | Tail]) :- assert(nuremberg_trials_OR_deportation_of_the_crimean_tatars(Start,End)), generate_facts_nuremberg_trials_OR_deportation_of_the_crimean_tatars(Tail).

nuremberg_trials_OR_deportation_of_the_crimean_tatars_aux() :- findall((Start,End),nuremberg_trials(Start,End),Interval1), findall((Start,End),deportation_of_the_crimean_tatars(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_nuremberg_trials_OR_deportation_of_the_crimean_tatars(Interval).

nuremberg_trials_OR_deportation_of_the_crimean_tatars_at_1803(Res) :- setof((Start,End),nuremberg_trials_OR_deportation_of_the_crimean_tatars(Start,End),AllINtervals), checkvalidity(1803,AllINtervals,Res).

check_query() :- write('Query = nuremberg_trials_OR_deportation_of_the_crimean_tatars_at_1803'), (nuremberg_trials_OR_deportation_of_the_crimean_tatars_at_1803(true) -> write('\nRes   = true');write('\nRes   = false')).
?- nuremberg_trials_OR_deportation_of_the_crimean_tatars_aux().

