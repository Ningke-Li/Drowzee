:- include('database.pl').
second_opium_war(Start,End) :- begin('second_opium_war',_,_,Start), end('second_opium_war',_,_,End), Start=<End.

romanticism(Start,End) :- begin('romanticism',_,_,Start), end('romanticism',_,_,End), Start=<End.

generate_facts_second_opium_war_AND_romanticism([]) :- assert(second_opium_war_AND_romanticism(-1,-1)).

generate_facts_second_opium_war_AND_romanticism([(Start,End) | Tail]) :- assert(second_opium_war_AND_romanticism(Start,End)), generate_facts_second_opium_war_AND_romanticism(Tail).

second_opium_war_AND_romanticism_aux() :- findall((Start,End),second_opium_war(Start,End),Interval1), findall((Start,End),romanticism(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_second_opium_war_AND_romanticism(Interval).

second_opium_war_AND_romanticism_at_1793(Res) :- setof((Start,End),second_opium_war_AND_romanticism(Start,End),AllINtervals), checkvalidity(1793,AllINtervals,Res).

check_query() :- write('Query = second_opium_war_AND_romanticism_at_1793'), (second_opium_war_AND_romanticism_at_1793(true) -> write('\nRes   = true');write('\nRes   = false')).
?- second_opium_war_AND_romanticism_aux().

