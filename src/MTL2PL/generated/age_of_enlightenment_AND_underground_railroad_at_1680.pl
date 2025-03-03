:- include('database.pl').
age_of_enlightenment(Start,End) :- begin('age_of_enlightenment',_,_,Start), end('age_of_enlightenment',_,_,End), Start=<End.

underground_railroad(Start,End) :- begin('underground_railroad',_,_,Start), end('underground_railroad',_,_,End), Start=<End.

generate_facts_age_of_enlightenment_AND_underground_railroad([]) :- assert(age_of_enlightenment_AND_underground_railroad(-1,-1)).

generate_facts_age_of_enlightenment_AND_underground_railroad([(Start,End) | Tail]) :- assert(age_of_enlightenment_AND_underground_railroad(Start,End)), generate_facts_age_of_enlightenment_AND_underground_railroad(Tail).

age_of_enlightenment_AND_underground_railroad_aux() :- findall((Start,End),age_of_enlightenment(Start,End),Interval1), findall((Start,End),underground_railroad(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_age_of_enlightenment_AND_underground_railroad(Interval).

age_of_enlightenment_AND_underground_railroad_at_1680(Res) :- setof((Start,End),age_of_enlightenment_AND_underground_railroad(Start,End),AllINtervals), checkvalidity(1680,AllINtervals,Res).

check_query() :- write('Query = age_of_enlightenment_AND_underground_railroad_at_1680'), (age_of_enlightenment_AND_underground_railroad_at_1680(true) -> write('\nRes   = true');write('\nRes   = false')).
?- age_of_enlightenment_AND_underground_railroad_aux().

