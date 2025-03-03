:- include('database.pl').
second_schleswig_war(Start,End) :- begin('second_schleswig_war',_,_,Start), end('second_schleswig_war',_,_,End), Start=<End.

paris_commune(Start,End) :- begin('paris_commune',_,_,Start), end('paris_commune',_,_,End), Start=<End.

generate_facts_second_schleswig_war_OR_paris_commune([]) :- assert(second_schleswig_war_OR_paris_commune(-1,-1)).

generate_facts_second_schleswig_war_OR_paris_commune([(Start,End) | Tail]) :- assert(second_schleswig_war_OR_paris_commune(Start,End)), generate_facts_second_schleswig_war_OR_paris_commune(Tail).

second_schleswig_war_OR_paris_commune_aux() :- findall((Start,End),second_schleswig_war(Start,End),Interval1), findall((Start,End),paris_commune(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_second_schleswig_war_OR_paris_commune(Interval).

second_schleswig_war_OR_paris_commune_at_1868(Res) :- setof((Start,End),second_schleswig_war_OR_paris_commune(Start,End),AllINtervals), checkvalidity(1868,AllINtervals,Res).

check_query() :- write('Query = second_schleswig_war_OR_paris_commune_at_1868'), (second_schleswig_war_OR_paris_commune_at_1868(true) -> write('\nRes   = true');write('\nRes   = false')).
?- second_schleswig_war_OR_paris_commune_aux().

