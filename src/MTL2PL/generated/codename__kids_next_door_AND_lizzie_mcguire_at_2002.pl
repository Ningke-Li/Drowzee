:- include('database.pl').
codename__kids_next_door(Start,End) :- begin('codename__kids_next_door',_,_,Start), end('codename__kids_next_door',_,_,End), Start=<End.

lizzie_mcguire(Start,End) :- begin('lizzie_mcguire',_,_,Start), end('lizzie_mcguire',_,_,End), Start=<End.

generate_facts_codename__kids_next_door_AND_lizzie_mcguire([]) :- assert(codename__kids_next_door_AND_lizzie_mcguire(-1,-1)).

generate_facts_codename__kids_next_door_AND_lizzie_mcguire([(Start,End) | Tail]) :- assert(codename__kids_next_door_AND_lizzie_mcguire(Start,End)), generate_facts_codename__kids_next_door_AND_lizzie_mcguire(Tail).

codename__kids_next_door_AND_lizzie_mcguire_aux() :- findall((Start,End),codename__kids_next_door(Start,End),Interval1), findall((Start,End),lizzie_mcguire(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_codename__kids_next_door_AND_lizzie_mcguire(Interval).

codename__kids_next_door_AND_lizzie_mcguire_at_2002(Res) :- setof((Start,End),codename__kids_next_door_AND_lizzie_mcguire(Start,End),AllINtervals), checkvalidity(2002,AllINtervals,Res).

check_query() :- write('Query = codename__kids_next_door_AND_lizzie_mcguire_at_2002'), (codename__kids_next_door_AND_lizzie_mcguire_at_2002(true) -> write('\nRes   = true');write('\nRes   = false')).
?- codename__kids_next_door_AND_lizzie_mcguire_aux().

