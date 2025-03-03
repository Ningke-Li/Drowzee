:- include('database.pl').
morotai_island(Start,End) :- begin('morotai_island',_,_,Start), end('morotai_island',_,_,End), Start=<End.

luge_at_the_2014_winter_olympics(Start,End) :- begin('luge_at_the_2014_winter_olympics',_,_,Start), end('luge_at_the_2014_winter_olympics',_,_,End), Start=<End.

generate_facts_morotai_island_OR_luge_at_the_2014_winter_olympics([]) :- assert(morotai_island_OR_luge_at_the_2014_winter_olympics(-1,-1)).

generate_facts_morotai_island_OR_luge_at_the_2014_winter_olympics([(Start,End) | Tail]) :- assert(morotai_island_OR_luge_at_the_2014_winter_olympics(Start,End)), generate_facts_morotai_island_OR_luge_at_the_2014_winter_olympics(Tail).

morotai_island_OR_luge_at_the_2014_winter_olympics_aux() :- findall((Start,End),morotai_island(Start,End),Interval1), findall((Start,End),luge_at_the_2014_winter_olympics(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_morotai_island_OR_luge_at_the_2014_winter_olympics(Interval).

morotai_island_OR_luge_at_the_2014_winter_olympics_at_1819(Res) :- setof((Start,End),morotai_island_OR_luge_at_the_2014_winter_olympics(Start,End),AllINtervals), checkvalidity(1819,AllINtervals,Res).

check_query() :- write('Query = morotai_island_OR_luge_at_the_2014_winter_olympics_at_1819'), (morotai_island_OR_luge_at_the_2014_winter_olympics_at_1819(true) -> write('\nRes   = true');write('\nRes   = false')).
?- morotai_island_OR_luge_at_the_2014_winter_olympics_aux().

