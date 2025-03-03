:- include('database.pl').
tehran_conference(Start,End) :- begin('tehran_conference',_,_,Start), end('tehran_conference',_,_,End), Start=<End.

war_of_the_spanish_succession(Start,End) :- begin('war_of_the_spanish_succession',_,_,Start), end('war_of_the_spanish_succession',_,_,End), Start=<End.

generate_facts_tehran_conference_OR_war_of_the_spanish_succession([]) :- assert(tehran_conference_OR_war_of_the_spanish_succession(-1,-1)).

generate_facts_tehran_conference_OR_war_of_the_spanish_succession([(Start,End) | Tail]) :- assert(tehran_conference_OR_war_of_the_spanish_succession(Start,End)), generate_facts_tehran_conference_OR_war_of_the_spanish_succession(Tail).

tehran_conference_OR_war_of_the_spanish_succession_aux() :- findall((Start,End),tehran_conference(Start,End),Interval1), findall((Start,End),war_of_the_spanish_succession(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_tehran_conference_OR_war_of_the_spanish_succession(Interval).

tehran_conference_OR_war_of_the_spanish_succession_at_1957(Res) :- setof((Start,End),tehran_conference_OR_war_of_the_spanish_succession(Start,End),AllINtervals), checkvalidity(1957,AllINtervals,Res).

check_query() :- write('Query = tehran_conference_OR_war_of_the_spanish_succession_at_1957'), (tehran_conference_OR_war_of_the_spanish_succession_at_1957(true) -> write('\nRes   = true');write('\nRes   = false')).
?- tehran_conference_OR_war_of_the_spanish_succession_aux().

