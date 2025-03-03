:- include('database.pl').
schitt_s_creek(Start,End) :- begin('schitt_s_creek',_,_,Start), end('schitt_s_creek',_,_,End), Start=<End.

agent_carter(Start,End) :- begin('agent_carter',_,_,Start), end('agent_carter',_,_,End), Start=<End.

generate_facts_schitt_s_creek_AND_agent_carter([]) :- assert(schitt_s_creek_AND_agent_carter(-1,-1)).

generate_facts_schitt_s_creek_AND_agent_carter([(Start,End) | Tail]) :- assert(schitt_s_creek_AND_agent_carter(Start,End)), generate_facts_schitt_s_creek_AND_agent_carter(Tail).

schitt_s_creek_AND_agent_carter_aux() :- findall((Start,End),schitt_s_creek(Start,End),Interval1), findall((Start,End),agent_carter(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_schitt_s_creek_AND_agent_carter(Interval).

schitt_s_creek_AND_agent_carter_at_2015(Res) :- setof((Start,End),schitt_s_creek_AND_agent_carter(Start,End),AllINtervals), checkvalidity(2015,AllINtervals,Res).

check_query() :- write('Query = schitt_s_creek_AND_agent_carter_at_2015'), (schitt_s_creek_AND_agent_carter_at_2015(true) -> write('\nRes   = true');write('\nRes   = false')).
?- schitt_s_creek_AND_agent_carter_aux().

