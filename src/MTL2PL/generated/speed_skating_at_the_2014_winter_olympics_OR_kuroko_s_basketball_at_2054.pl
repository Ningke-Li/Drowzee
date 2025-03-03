:- include('database.pl').
speed_skating_at_the_2014_winter_olympics(Start,End) :- begin('speed_skating_at_the_2014_winter_olympics',_,_,Start), end('speed_skating_at_the_2014_winter_olympics',_,_,End), Start=<End.

kuroko_s_basketball(Start,End) :- begin('kuroko_s_basketball',_,_,Start), end('kuroko_s_basketball',_,_,End), Start=<End.

generate_facts_speed_skating_at_the_2014_winter_olympics_OR_kuroko_s_basketball([]) :- assert(speed_skating_at_the_2014_winter_olympics_OR_kuroko_s_basketball(-1,-1)).

generate_facts_speed_skating_at_the_2014_winter_olympics_OR_kuroko_s_basketball([(Start,End) | Tail]) :- assert(speed_skating_at_the_2014_winter_olympics_OR_kuroko_s_basketball(Start,End)), generate_facts_speed_skating_at_the_2014_winter_olympics_OR_kuroko_s_basketball(Tail).

speed_skating_at_the_2014_winter_olympics_OR_kuroko_s_basketball_aux() :- findall((Start,End),speed_skating_at_the_2014_winter_olympics(Start,End),Interval1), findall((Start,End),kuroko_s_basketball(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_speed_skating_at_the_2014_winter_olympics_OR_kuroko_s_basketball(Interval).

speed_skating_at_the_2014_winter_olympics_OR_kuroko_s_basketball_at_2054(Res) :- setof((Start,End),speed_skating_at_the_2014_winter_olympics_OR_kuroko_s_basketball(Start,End),AllINtervals), checkvalidity(2054,AllINtervals,Res).

check_query() :- write('Query = speed_skating_at_the_2014_winter_olympics_OR_kuroko_s_basketball_at_2054'), (speed_skating_at_the_2014_winter_olympics_OR_kuroko_s_basketball_at_2054(true) -> write('\nRes   = true');write('\nRes   = false')).
?- speed_skating_at_the_2014_winter_olympics_OR_kuroko_s_basketball_aux().

