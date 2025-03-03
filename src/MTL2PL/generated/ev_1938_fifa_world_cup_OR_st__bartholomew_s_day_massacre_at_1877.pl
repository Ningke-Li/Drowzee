:- include('database.pl').
ev_1938_fifa_world_cup(Start,End) :- begin('ev_1938_fifa_world_cup',_,_,Start), end('ev_1938_fifa_world_cup',_,_,End), Start=<End.

st__bartholomew_s_day_massacre(Start,End) :- begin('st__bartholomew_s_day_massacre',_,_,Start), end('st__bartholomew_s_day_massacre',_,_,End), Start=<End.

generate_facts_ev_1938_fifa_world_cup_OR_st__bartholomew_s_day_massacre([]) :- assert(ev_1938_fifa_world_cup_OR_st__bartholomew_s_day_massacre(-1,-1)).

generate_facts_ev_1938_fifa_world_cup_OR_st__bartholomew_s_day_massacre([(Start,End) | Tail]) :- assert(ev_1938_fifa_world_cup_OR_st__bartholomew_s_day_massacre(Start,End)), generate_facts_ev_1938_fifa_world_cup_OR_st__bartholomew_s_day_massacre(Tail).

ev_1938_fifa_world_cup_OR_st__bartholomew_s_day_massacre_aux() :- findall((Start,End),ev_1938_fifa_world_cup(Start,End),Interval1), findall((Start,End),st__bartholomew_s_day_massacre(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_1938_fifa_world_cup_OR_st__bartholomew_s_day_massacre(Interval).

ev_1938_fifa_world_cup_OR_st__bartholomew_s_day_massacre_at_1877(Res) :- setof((Start,End),ev_1938_fifa_world_cup_OR_st__bartholomew_s_day_massacre(Start,End),AllINtervals), checkvalidity(1877,AllINtervals,Res).

check_query() :- write('Query = ev_1938_fifa_world_cup_OR_st__bartholomew_s_day_massacre_at_1877'), (ev_1938_fifa_world_cup_OR_st__bartholomew_s_day_massacre_at_1877(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_1938_fifa_world_cup_OR_st__bartholomew_s_day_massacre_aux().

