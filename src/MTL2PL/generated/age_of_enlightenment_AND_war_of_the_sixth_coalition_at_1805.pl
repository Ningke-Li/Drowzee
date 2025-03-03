:- include('database.pl').
age_of_enlightenment(Start,End) :- begin('age_of_enlightenment',_,_,Start), end('age_of_enlightenment',_,_,End), Start=<End.

war_of_the_sixth_coalition(Start,End) :- begin('war_of_the_sixth_coalition',_,_,Start), end('war_of_the_sixth_coalition',_,_,End), Start=<End.

generate_facts_age_of_enlightenment_AND_war_of_the_sixth_coalition([]) :- assert(age_of_enlightenment_AND_war_of_the_sixth_coalition(-1,-1)).

generate_facts_age_of_enlightenment_AND_war_of_the_sixth_coalition([(Start,End) | Tail]) :- assert(age_of_enlightenment_AND_war_of_the_sixth_coalition(Start,End)), generate_facts_age_of_enlightenment_AND_war_of_the_sixth_coalition(Tail).

age_of_enlightenment_AND_war_of_the_sixth_coalition_aux() :- findall((Start,End),age_of_enlightenment(Start,End),Interval1), findall((Start,End),war_of_the_sixth_coalition(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_age_of_enlightenment_AND_war_of_the_sixth_coalition(Interval).

age_of_enlightenment_AND_war_of_the_sixth_coalition_at_1805(Res) :- setof((Start,End),age_of_enlightenment_AND_war_of_the_sixth_coalition(Start,End),AllINtervals), checkvalidity(1805,AllINtervals,Res).

check_query() :- write('Query = age_of_enlightenment_AND_war_of_the_sixth_coalition_at_1805'), (age_of_enlightenment_AND_war_of_the_sixth_coalition_at_1805(true) -> write('\nRes   = true');write('\nRes   = false')).
?- age_of_enlightenment_AND_war_of_the_sixth_coalition_aux().

