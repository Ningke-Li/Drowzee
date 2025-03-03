:- include('database.pl').
bobsleigh_at_the_2014_winter_olympics(Start,End) :- begin('bobsleigh_at_the_2014_winter_olympics',_,_,Start), end('bobsleigh_at_the_2014_winter_olympics',_,_,End), Start=<End.

arab_revolt(Start,End) :- begin('arab_revolt',_,_,Start), end('arab_revolt',_,_,End), Start=<End.

generate_facts_bobsleigh_at_the_2014_winter_olympics_OR_arab_revolt([]) :- assert(bobsleigh_at_the_2014_winter_olympics_OR_arab_revolt(-1,-1)).

generate_facts_bobsleigh_at_the_2014_winter_olympics_OR_arab_revolt([(Start,End) | Tail]) :- assert(bobsleigh_at_the_2014_winter_olympics_OR_arab_revolt(Start,End)), generate_facts_bobsleigh_at_the_2014_winter_olympics_OR_arab_revolt(Tail).

bobsleigh_at_the_2014_winter_olympics_OR_arab_revolt_aux() :- findall((Start,End),bobsleigh_at_the_2014_winter_olympics(Start,End),Interval1), findall((Start,End),arab_revolt(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_bobsleigh_at_the_2014_winter_olympics_OR_arab_revolt(Interval).

bobsleigh_at_the_2014_winter_olympics_OR_arab_revolt_at_1785(Res) :- setof((Start,End),bobsleigh_at_the_2014_winter_olympics_OR_arab_revolt(Start,End),AllINtervals), checkvalidity(1785,AllINtervals,Res).

check_query() :- write('Query = bobsleigh_at_the_2014_winter_olympics_OR_arab_revolt_at_1785'), (bobsleigh_at_the_2014_winter_olympics_OR_arab_revolt_at_1785(true) -> write('\nRes   = true');write('\nRes   = false')).
?- bobsleigh_at_the_2014_winter_olympics_OR_arab_revolt_aux().

