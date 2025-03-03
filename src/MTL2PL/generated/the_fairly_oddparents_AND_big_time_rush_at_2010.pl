:- include('database.pl').
the_fairly_oddparents(Start,End) :- begin('the_fairly_oddparents',_,_,Start), end('the_fairly_oddparents',_,_,End), Start=<End.

big_time_rush(Start,End) :- begin('big_time_rush',_,_,Start), end('big_time_rush',_,_,End), Start=<End.

generate_facts_the_fairly_oddparents_AND_big_time_rush([]) :- assert(the_fairly_oddparents_AND_big_time_rush(-1,-1)).

generate_facts_the_fairly_oddparents_AND_big_time_rush([(Start,End) | Tail]) :- assert(the_fairly_oddparents_AND_big_time_rush(Start,End)), generate_facts_the_fairly_oddparents_AND_big_time_rush(Tail).

the_fairly_oddparents_AND_big_time_rush_aux() :- findall((Start,End),the_fairly_oddparents(Start,End),Interval1), findall((Start,End),big_time_rush(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_the_fairly_oddparents_AND_big_time_rush(Interval).

the_fairly_oddparents_AND_big_time_rush_at_2010(Res) :- setof((Start,End),the_fairly_oddparents_AND_big_time_rush(Start,End),AllINtervals), checkvalidity(2010,AllINtervals,Res).

check_query() :- write('Query = the_fairly_oddparents_AND_big_time_rush_at_2010'), (the_fairly_oddparents_AND_big_time_rush_at_2010(true) -> write('\nRes   = true');write('\nRes   = false')).
?- the_fairly_oddparents_AND_big_time_rush_aux().

