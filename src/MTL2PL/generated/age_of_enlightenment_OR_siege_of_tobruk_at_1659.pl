:- include('database.pl').
age_of_enlightenment(Start,End) :- begin('age_of_enlightenment',_,_,Start), end('age_of_enlightenment',_,_,End), Start=<End.

siege_of_tobruk(Start,End) :- begin('siege_of_tobruk',_,_,Start), end('siege_of_tobruk',_,_,End), Start=<End.

generate_facts_age_of_enlightenment_OR_siege_of_tobruk([]) :- assert(age_of_enlightenment_OR_siege_of_tobruk(-1,-1)).

generate_facts_age_of_enlightenment_OR_siege_of_tobruk([(Start,End) | Tail]) :- assert(age_of_enlightenment_OR_siege_of_tobruk(Start,End)), generate_facts_age_of_enlightenment_OR_siege_of_tobruk(Tail).

age_of_enlightenment_OR_siege_of_tobruk_aux() :- findall((Start,End),age_of_enlightenment(Start,End),Interval1), findall((Start,End),siege_of_tobruk(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_age_of_enlightenment_OR_siege_of_tobruk(Interval).

age_of_enlightenment_OR_siege_of_tobruk_at_1659(Res) :- setof((Start,End),age_of_enlightenment_OR_siege_of_tobruk(Start,End),AllINtervals), checkvalidity(1659,AllINtervals,Res).

check_query() :- write('Query = age_of_enlightenment_OR_siege_of_tobruk_at_1659'), (age_of_enlightenment_OR_siege_of_tobruk_at_1659(true) -> write('\nRes   = true');write('\nRes   = false')).
?- age_of_enlightenment_OR_siege_of_tobruk_aux().

