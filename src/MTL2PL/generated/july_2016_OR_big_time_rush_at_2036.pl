:- include('database.pl').
july_2016(Start,End) :- begin('july_2016',_,_,Start), end('july_2016',_,_,End), Start=<End.

big_time_rush(Start,End) :- begin('big_time_rush',_,_,Start), end('big_time_rush',_,_,End), Start=<End.

generate_facts_july_2016_OR_big_time_rush([]) :- assert(july_2016_OR_big_time_rush(-1,-1)).

generate_facts_july_2016_OR_big_time_rush([(Start,End) | Tail]) :- assert(july_2016_OR_big_time_rush(Start,End)), generate_facts_july_2016_OR_big_time_rush(Tail).

july_2016_OR_big_time_rush_aux() :- findall((Start,End),july_2016(Start,End),Interval1), findall((Start,End),big_time_rush(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_july_2016_OR_big_time_rush(Interval).

july_2016_OR_big_time_rush_at_2036(Res) :- setof((Start,End),july_2016_OR_big_time_rush(Start,End),AllINtervals), checkvalidity(2036,AllINtervals,Res).

check_query() :- write('Query = july_2016_OR_big_time_rush_at_2036'), (july_2016_OR_big_time_rush_at_2036(true) -> write('\nRes   = true');write('\nRes   = false')).
?- july_2016_OR_big_time_rush_aux().

