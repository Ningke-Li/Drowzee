:- include('database.pl').
athletics_at_the_2008_summer_olympics(Start,End) :- begin('athletics_at_the_2008_summer_olympics',_,_,Start), end('athletics_at_the_2008_summer_olympics',_,_,End), Start=<End.

gotham(Start,End) :- begin('gotham',_,_,Start), end('gotham',_,_,End), Start=<End.

generate_facts_athletics_at_the_2008_summer_olympics_OR_gotham([]) :- assert(athletics_at_the_2008_summer_olympics_OR_gotham(-1,-1)).

generate_facts_athletics_at_the_2008_summer_olympics_OR_gotham([(Start,End) | Tail]) :- assert(athletics_at_the_2008_summer_olympics_OR_gotham(Start,End)), generate_facts_athletics_at_the_2008_summer_olympics_OR_gotham(Tail).

athletics_at_the_2008_summer_olympics_OR_gotham_aux() :- findall((Start,End),athletics_at_the_2008_summer_olympics(Start,End),Interval1), findall((Start,End),gotham(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_athletics_at_the_2008_summer_olympics_OR_gotham(Interval).

athletics_at_the_2008_summer_olympics_OR_gotham_at_2053(Res) :- setof((Start,End),athletics_at_the_2008_summer_olympics_OR_gotham(Start,End),AllINtervals), checkvalidity(2053,AllINtervals,Res).

check_query() :- write('Query = athletics_at_the_2008_summer_olympics_OR_gotham_at_2053'), (athletics_at_the_2008_summer_olympics_OR_gotham_at_2053(true) -> write('\nRes   = true');write('\nRes   = false')).
?- athletics_at_the_2008_summer_olympics_OR_gotham_aux().

