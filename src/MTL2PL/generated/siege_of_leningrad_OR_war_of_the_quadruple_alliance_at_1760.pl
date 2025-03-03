:- include('database.pl').
siege_of_leningrad(Start,End) :- begin('siege_of_leningrad',_,_,Start), end('siege_of_leningrad',_,_,End), Start=<End.

war_of_the_quadruple_alliance(Start,End) :- begin('war_of_the_quadruple_alliance',_,_,Start), end('war_of_the_quadruple_alliance',_,_,End), Start=<End.

generate_facts_siege_of_leningrad_OR_war_of_the_quadruple_alliance([]) :- assert(siege_of_leningrad_OR_war_of_the_quadruple_alliance(-1,-1)).

generate_facts_siege_of_leningrad_OR_war_of_the_quadruple_alliance([(Start,End) | Tail]) :- assert(siege_of_leningrad_OR_war_of_the_quadruple_alliance(Start,End)), generate_facts_siege_of_leningrad_OR_war_of_the_quadruple_alliance(Tail).

siege_of_leningrad_OR_war_of_the_quadruple_alliance_aux() :- findall((Start,End),siege_of_leningrad(Start,End),Interval1), findall((Start,End),war_of_the_quadruple_alliance(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_siege_of_leningrad_OR_war_of_the_quadruple_alliance(Interval).

siege_of_leningrad_OR_war_of_the_quadruple_alliance_at_1760(Res) :- setof((Start,End),siege_of_leningrad_OR_war_of_the_quadruple_alliance(Start,End),AllINtervals), checkvalidity(1760,AllINtervals,Res).

check_query() :- write('Query = siege_of_leningrad_OR_war_of_the_quadruple_alliance_at_1760'), (siege_of_leningrad_OR_war_of_the_quadruple_alliance_at_1760(true) -> write('\nRes   = true');write('\nRes   = false')).
?- siege_of_leningrad_OR_war_of_the_quadruple_alliance_aux().

