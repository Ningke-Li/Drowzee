:- include('database.pl').
basketball_at_the_2000_summer_olympics(Start,End) :- begin('basketball_at_the_2000_summer_olympics',_,_,Start), end('basketball_at_the_2000_summer_olympics',_,_,End), Start=<End.

age_of_enlightenment(Start,End) :- begin('age_of_enlightenment',_,_,Start), end('age_of_enlightenment',_,_,End), Start=<End.

generate_facts_basketball_at_the_2000_summer_olympics_OR_age_of_enlightenment([]) :- assert(basketball_at_the_2000_summer_olympics_OR_age_of_enlightenment(-1,-1)).

generate_facts_basketball_at_the_2000_summer_olympics_OR_age_of_enlightenment([(Start,End) | Tail]) :- assert(basketball_at_the_2000_summer_olympics_OR_age_of_enlightenment(Start,End)), generate_facts_basketball_at_the_2000_summer_olympics_OR_age_of_enlightenment(Tail).

basketball_at_the_2000_summer_olympics_OR_age_of_enlightenment_aux() :- findall((Start,End),basketball_at_the_2000_summer_olympics(Start,End),Interval1), findall((Start,End),age_of_enlightenment(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_basketball_at_the_2000_summer_olympics_OR_age_of_enlightenment(Interval).

basketball_at_the_2000_summer_olympics_OR_age_of_enlightenment_at_1615(Res) :- setof((Start,End),basketball_at_the_2000_summer_olympics_OR_age_of_enlightenment(Start,End),AllINtervals), checkvalidity(1615,AllINtervals,Res).

check_query() :- write('Query = basketball_at_the_2000_summer_olympics_OR_age_of_enlightenment_at_1615'), (basketball_at_the_2000_summer_olympics_OR_age_of_enlightenment_at_1615(true) -> write('\nRes   = true');write('\nRes   = false')).
?- basketball_at_the_2000_summer_olympics_OR_age_of_enlightenment_aux().

