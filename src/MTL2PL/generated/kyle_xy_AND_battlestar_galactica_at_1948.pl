:- include('database.pl').
kyle_xy(Start,End) :- begin('kyle_xy',_,_,Start), end('kyle_xy',_,_,End), Start=<End.

battlestar_galactica(Start,End) :- begin('battlestar_galactica',_,_,Start), end('battlestar_galactica',_,_,End), Start=<End.

generate_facts_kyle_xy_AND_battlestar_galactica([]) :- assert(kyle_xy_AND_battlestar_galactica(-1,-1)).

generate_facts_kyle_xy_AND_battlestar_galactica([(Start,End) | Tail]) :- assert(kyle_xy_AND_battlestar_galactica(Start,End)), generate_facts_kyle_xy_AND_battlestar_galactica(Tail).

kyle_xy_AND_battlestar_galactica_aux() :- findall((Start,End),kyle_xy(Start,End),Interval1), findall((Start,End),battlestar_galactica(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_kyle_xy_AND_battlestar_galactica(Interval).

kyle_xy_AND_battlestar_galactica_at_1948(Res) :- setof((Start,End),kyle_xy_AND_battlestar_galactica(Start,End),AllINtervals), checkvalidity(1948,AllINtervals,Res).

check_query() :- write('Query = kyle_xy_AND_battlestar_galactica_at_1948'), (kyle_xy_AND_battlestar_galactica_at_1948(true) -> write('\nRes   = true');write('\nRes   = false')).
?- kyle_xy_AND_battlestar_galactica_aux().

