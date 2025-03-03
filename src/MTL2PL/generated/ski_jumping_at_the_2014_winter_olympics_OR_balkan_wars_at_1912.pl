:- include('database.pl').
ski_jumping_at_the_2014_winter_olympics(Start,End) :- begin('ski_jumping_at_the_2014_winter_olympics',_,_,Start), end('ski_jumping_at_the_2014_winter_olympics',_,_,End), Start=<End.

balkan_wars(Start,End) :- begin('balkan_wars',_,_,Start), end('balkan_wars',_,_,End), Start=<End.

generate_facts_ski_jumping_at_the_2014_winter_olympics_OR_balkan_wars([]) :- assert(ski_jumping_at_the_2014_winter_olympics_OR_balkan_wars(-1,-1)).

generate_facts_ski_jumping_at_the_2014_winter_olympics_OR_balkan_wars([(Start,End) | Tail]) :- assert(ski_jumping_at_the_2014_winter_olympics_OR_balkan_wars(Start,End)), generate_facts_ski_jumping_at_the_2014_winter_olympics_OR_balkan_wars(Tail).

ski_jumping_at_the_2014_winter_olympics_OR_balkan_wars_aux() :- findall((Start,End),ski_jumping_at_the_2014_winter_olympics(Start,End),Interval1), findall((Start,End),balkan_wars(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ski_jumping_at_the_2014_winter_olympics_OR_balkan_wars(Interval).

ski_jumping_at_the_2014_winter_olympics_OR_balkan_wars_at_1912(Res) :- setof((Start,End),ski_jumping_at_the_2014_winter_olympics_OR_balkan_wars(Start,End),AllINtervals), checkvalidity(1912,AllINtervals,Res).

check_query() :- write('Query = ski_jumping_at_the_2014_winter_olympics_OR_balkan_wars_at_1912'), (ski_jumping_at_the_2014_winter_olympics_OR_balkan_wars_at_1912(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ski_jumping_at_the_2014_winter_olympics_OR_balkan_wars_aux().

