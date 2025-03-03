:- include('database.pl').
agent_carter(Start,End) :- begin('agent_carter',_,_,Start), end('agent_carter',_,_,End), Start=<End.

first_opium_war(Start,End) :- begin('first_opium_war',_,_,Start), end('first_opium_war',_,_,End), Start=<End.

generate_facts_agent_carter_OR_first_opium_war([]) :- assert(agent_carter_OR_first_opium_war(-1,-1)).

generate_facts_agent_carter_OR_first_opium_war([(Start,End) | Tail]) :- assert(agent_carter_OR_first_opium_war(Start,End)), generate_facts_agent_carter_OR_first_opium_war(Tail).

agent_carter_OR_first_opium_war_aux() :- findall((Start,End),agent_carter(Start,End),Interval1), findall((Start,End),first_opium_war(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_agent_carter_OR_first_opium_war(Interval).

agent_carter_OR_first_opium_war_at_1834(Res) :- setof((Start,End),agent_carter_OR_first_opium_war(Start,End),AllINtervals), checkvalidity(1834,AllINtervals,Res).

check_query() :- write('Query = agent_carter_OR_first_opium_war_at_1834'), (agent_carter_OR_first_opium_war_at_1834(true) -> write('\nRes   = true');write('\nRes   = false')).
?- agent_carter_OR_first_opium_war_aux().

