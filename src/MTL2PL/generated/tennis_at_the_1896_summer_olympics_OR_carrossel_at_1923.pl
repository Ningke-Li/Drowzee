:- include('database.pl').
tennis_at_the_1896_summer_olympics(Start,End) :- begin('tennis_at_the_1896_summer_olympics',_,_,Start), end('tennis_at_the_1896_summer_olympics',_,_,End), Start=<End.

carrossel(Start,End) :- begin('carrossel',_,_,Start), end('carrossel',_,_,End), Start=<End.

generate_facts_tennis_at_the_1896_summer_olympics_OR_carrossel([]) :- assert(tennis_at_the_1896_summer_olympics_OR_carrossel(-1,-1)).

generate_facts_tennis_at_the_1896_summer_olympics_OR_carrossel([(Start,End) | Tail]) :- assert(tennis_at_the_1896_summer_olympics_OR_carrossel(Start,End)), generate_facts_tennis_at_the_1896_summer_olympics_OR_carrossel(Tail).

tennis_at_the_1896_summer_olympics_OR_carrossel_aux() :- findall((Start,End),tennis_at_the_1896_summer_olympics(Start,End),Interval1), findall((Start,End),carrossel(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_tennis_at_the_1896_summer_olympics_OR_carrossel(Interval).

tennis_at_the_1896_summer_olympics_OR_carrossel_at_1923(Res) :- setof((Start,End),tennis_at_the_1896_summer_olympics_OR_carrossel(Start,End),AllINtervals), checkvalidity(1923,AllINtervals,Res).

check_query() :- write('Query = tennis_at_the_1896_summer_olympics_OR_carrossel_at_1923'), (tennis_at_the_1896_summer_olympics_OR_carrossel_at_1923(true) -> write('\nRes   = true');write('\nRes   = false')).
?- tennis_at_the_1896_summer_olympics_OR_carrossel_aux().

