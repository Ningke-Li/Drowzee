:- include('database.pl').
codename__kids_next_door(Start,End) :- begin('codename__kids_next_door',_,_,Start), end('codename__kids_next_door',_,_,End), Start=<End.

bol_var(Start,End) :- begin('bol_var',_,_,Start), end('bol_var',_,_,End), Start=<End.

generate_facts_codename__kids_next_door_AND_bol_var([]) :- assert(codename__kids_next_door_AND_bol_var(-1,-1)).

generate_facts_codename__kids_next_door_AND_bol_var([(Start,End) | Tail]) :- assert(codename__kids_next_door_AND_bol_var(Start,End)), generate_facts_codename__kids_next_door_AND_bol_var(Tail).

codename__kids_next_door_AND_bol_var_aux() :- findall((Start,End),codename__kids_next_door(Start,End),Interval1), findall((Start,End),bol_var(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_codename__kids_next_door_AND_bol_var(Interval).

codename__kids_next_door_AND_bol_var_at_1930(Res) :- setof((Start,End),codename__kids_next_door_AND_bol_var(Start,End),AllINtervals), checkvalidity(1930,AllINtervals,Res).

check_query() :- write('Query = codename__kids_next_door_AND_bol_var_at_1930'), (codename__kids_next_door_AND_bol_var_at_1930(true) -> write('\nRes   = true');write('\nRes   = false')).
?- codename__kids_next_door_AND_bol_var_aux().

