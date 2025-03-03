:- include('database.pl').
uefa_euro_2012_qualifying(Start,End) :- begin('uefa_euro_2012_qualifying',_,_,Start), end('uefa_euro_2012_qualifying',_,_,End), Start=<End.

russian_civil_war(Start,End) :- begin('russian_civil_war',_,_,Start), end('russian_civil_war',_,_,End), Start=<End.

generate_facts_uefa_euro_2012_qualifying_OR_russian_civil_war([]) :- assert(uefa_euro_2012_qualifying_OR_russian_civil_war(-1,-1)).

generate_facts_uefa_euro_2012_qualifying_OR_russian_civil_war([(Start,End) | Tail]) :- assert(uefa_euro_2012_qualifying_OR_russian_civil_war(Start,End)), generate_facts_uefa_euro_2012_qualifying_OR_russian_civil_war(Tail).

uefa_euro_2012_qualifying_OR_russian_civil_war_aux() :- findall((Start,End),uefa_euro_2012_qualifying(Start,End),Interval1), findall((Start,End),russian_civil_war(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_uefa_euro_2012_qualifying_OR_russian_civil_war(Interval).

uefa_euro_2012_qualifying_OR_russian_civil_war_at_2050(Res) :- setof((Start,End),uefa_euro_2012_qualifying_OR_russian_civil_war(Start,End),AllINtervals), checkvalidity(2050,AllINtervals,Res).

check_query() :- write('Query = uefa_euro_2012_qualifying_OR_russian_civil_war_at_2050'), (uefa_euro_2012_qualifying_OR_russian_civil_war_at_2050(true) -> write('\nRes   = true');write('\nRes   = false')).
?- uefa_euro_2012_qualifying_OR_russian_civil_war_aux().

