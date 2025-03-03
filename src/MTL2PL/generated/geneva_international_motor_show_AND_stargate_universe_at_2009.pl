:- include('database.pl').
geneva_international_motor_show(Start,End) :- begin('geneva_international_motor_show',_,_,Start), end('geneva_international_motor_show',_,_,End), Start=<End.

stargate_universe(Start,End) :- begin('stargate_universe',_,_,Start), end('stargate_universe',_,_,End), Start=<End.

generate_facts_geneva_international_motor_show_AND_stargate_universe([]) :- assert(geneva_international_motor_show_AND_stargate_universe(-1,-1)).

generate_facts_geneva_international_motor_show_AND_stargate_universe([(Start,End) | Tail]) :- assert(geneva_international_motor_show_AND_stargate_universe(Start,End)), generate_facts_geneva_international_motor_show_AND_stargate_universe(Tail).

geneva_international_motor_show_AND_stargate_universe_aux() :- findall((Start,End),geneva_international_motor_show(Start,End),Interval1), findall((Start,End),stargate_universe(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_geneva_international_motor_show_AND_stargate_universe(Interval).

geneva_international_motor_show_AND_stargate_universe_at_2009(Res) :- setof((Start,End),geneva_international_motor_show_AND_stargate_universe(Start,End),AllINtervals), checkvalidity(2009,AllINtervals,Res).

check_query() :- write('Query = geneva_international_motor_show_AND_stargate_universe_at_2009'), (geneva_international_motor_show_AND_stargate_universe_at_2009(true) -> write('\nRes   = true');write('\nRes   = false')).
?- geneva_international_motor_show_AND_stargate_universe_aux().

