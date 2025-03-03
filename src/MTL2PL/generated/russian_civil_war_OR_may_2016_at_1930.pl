:- include('database.pl').
russian_civil_war(Start,End) :- begin('russian_civil_war',_,_,Start), end('russian_civil_war',_,_,End), Start=<End.

may_2016(Start,End) :- begin('may_2016',_,_,Start), end('may_2016',_,_,End), Start=<End.

generate_facts_russian_civil_war_OR_may_2016([]) :- assert(russian_civil_war_OR_may_2016(-1,-1)).

generate_facts_russian_civil_war_OR_may_2016([(Start,End) | Tail]) :- assert(russian_civil_war_OR_may_2016(Start,End)), generate_facts_russian_civil_war_OR_may_2016(Tail).

russian_civil_war_OR_may_2016_aux() :- findall((Start,End),russian_civil_war(Start,End),Interval1), findall((Start,End),may_2016(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_russian_civil_war_OR_may_2016(Interval).

russian_civil_war_OR_may_2016_at_1930(Res) :- setof((Start,End),russian_civil_war_OR_may_2016(Start,End),AllINtervals), checkvalidity(1930,AllINtervals,Res).

check_query() :- write('Query = russian_civil_war_OR_may_2016_at_1930'), (russian_civil_war_OR_may_2016_at_1930(true) -> write('\nRes   = true');write('\nRes   = false')).
?- russian_civil_war_OR_may_2016_aux().

