:- include('database.pl').
crimean_war(Start,End) :- begin('crimean_war',_,_,Start), end('crimean_war',_,_,End), Start=<End.

romanticism(Start,End) :- begin('romanticism',_,_,Start), end('romanticism',_,_,End), Start=<End.

generate_facts_crimean_war_AND_romanticism([]) :- assert(crimean_war_AND_romanticism(-1,-1)).

generate_facts_crimean_war_AND_romanticism([(Start,End) | Tail]) :- assert(crimean_war_AND_romanticism(Start,End)), generate_facts_crimean_war_AND_romanticism(Tail).

crimean_war_AND_romanticism_aux() :- findall((Start,End),crimean_war(Start,End),Interval1), findall((Start,End),romanticism(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_crimean_war_AND_romanticism(Interval).

crimean_war_AND_romanticism_at_1855(Res) :- setof((Start,End),crimean_war_AND_romanticism(Start,End),AllINtervals), checkvalidity(1855,AllINtervals,Res).

check_query() :- write('Query = crimean_war_AND_romanticism_at_1855'), (crimean_war_AND_romanticism_at_1855(true) -> write('\nRes   = true');write('\nRes   = false')).
?- crimean_war_AND_romanticism_aux().

