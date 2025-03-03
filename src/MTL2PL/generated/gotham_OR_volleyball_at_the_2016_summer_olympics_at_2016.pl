:- include('database.pl').
gotham(Start,End) :- begin('gotham',_,_,Start), end('gotham',_,_,End), Start=<End.

volleyball_at_the_2016_summer_olympics(Start,End) :- begin('volleyball_at_the_2016_summer_olympics',_,_,Start), end('volleyball_at_the_2016_summer_olympics',_,_,End), Start=<End.

generate_facts_gotham_OR_volleyball_at_the_2016_summer_olympics([]) :- assert(gotham_OR_volleyball_at_the_2016_summer_olympics(-1,-1)).

generate_facts_gotham_OR_volleyball_at_the_2016_summer_olympics([(Start,End) | Tail]) :- assert(gotham_OR_volleyball_at_the_2016_summer_olympics(Start,End)), generate_facts_gotham_OR_volleyball_at_the_2016_summer_olympics(Tail).

gotham_OR_volleyball_at_the_2016_summer_olympics_aux() :- findall((Start,End),gotham(Start,End),Interval1), findall((Start,End),volleyball_at_the_2016_summer_olympics(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_gotham_OR_volleyball_at_the_2016_summer_olympics(Interval).

gotham_OR_volleyball_at_the_2016_summer_olympics_at_2016(Res) :- setof((Start,End),gotham_OR_volleyball_at_the_2016_summer_olympics(Start,End),AllINtervals), checkvalidity(2016,AllINtervals,Res).

check_query() :- write('Query = gotham_OR_volleyball_at_the_2016_summer_olympics_at_2016'), (gotham_OR_volleyball_at_the_2016_summer_olympics_at_2016(true) -> write('\nRes   = true');write('\nRes   = false')).
?- gotham_OR_volleyball_at_the_2016_summer_olympics_aux().

