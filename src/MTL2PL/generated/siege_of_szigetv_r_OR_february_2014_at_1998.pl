:- include('database.pl').
siege_of_szigetv_r(Start,End) :- begin('siege_of_szigetv_r',_,_,Start), end('siege_of_szigetv_r',_,_,End), Start=<End.

february_2014(Start,End) :- begin('february_2014',_,_,Start), end('february_2014',_,_,End), Start=<End.

generate_facts_siege_of_szigetv_r_OR_february_2014([]) :- assert(siege_of_szigetv_r_OR_february_2014(-1,-1)).

generate_facts_siege_of_szigetv_r_OR_february_2014([(Start,End) | Tail]) :- assert(siege_of_szigetv_r_OR_february_2014(Start,End)), generate_facts_siege_of_szigetv_r_OR_february_2014(Tail).

siege_of_szigetv_r_OR_february_2014_aux() :- findall((Start,End),siege_of_szigetv_r(Start,End),Interval1), findall((Start,End),february_2014(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_siege_of_szigetv_r_OR_february_2014(Interval).

siege_of_szigetv_r_OR_february_2014_at_1998(Res) :- setof((Start,End),siege_of_szigetv_r_OR_february_2014(Start,End),AllINtervals), checkvalidity(1998,AllINtervals,Res).

check_query() :- write('Query = siege_of_szigetv_r_OR_february_2014_at_1998'), (siege_of_szigetv_r_OR_february_2014_at_1998(true) -> write('\nRes   = true');write('\nRes   = false')).
?- siege_of_szigetv_r_OR_february_2014_aux().

