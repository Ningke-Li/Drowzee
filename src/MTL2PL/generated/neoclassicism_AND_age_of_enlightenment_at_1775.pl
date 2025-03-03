:- include('database.pl').
neoclassicism(Start,End) :- begin('neoclassicism',_,_,Start), end('neoclassicism',_,_,End), Start=<End.

age_of_enlightenment(Start,End) :- begin('age_of_enlightenment',_,_,Start), end('age_of_enlightenment',_,_,End), Start=<End.

generate_facts_neoclassicism_AND_age_of_enlightenment([]) :- assert(neoclassicism_AND_age_of_enlightenment(-1,-1)).

generate_facts_neoclassicism_AND_age_of_enlightenment([(Start,End) | Tail]) :- assert(neoclassicism_AND_age_of_enlightenment(Start,End)), generate_facts_neoclassicism_AND_age_of_enlightenment(Tail).

neoclassicism_AND_age_of_enlightenment_aux() :- findall((Start,End),neoclassicism(Start,End),Interval1), findall((Start,End),age_of_enlightenment(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_neoclassicism_AND_age_of_enlightenment(Interval).

neoclassicism_AND_age_of_enlightenment_at_1775(Res) :- setof((Start,End),neoclassicism_AND_age_of_enlightenment(Start,End),AllINtervals), checkvalidity(1775,AllINtervals,Res).

check_query() :- write('Query = neoclassicism_AND_age_of_enlightenment_at_1775'), (neoclassicism_AND_age_of_enlightenment_at_1775(true) -> write('\nRes   = true');write('\nRes   = false')).
?- neoclassicism_AND_age_of_enlightenment_aux().

