:- include('database.pl').
grimm(Start,End) :- begin('grimm',_,_,Start), end('grimm',_,_,End), Start=<End.

agent_carter(Start,End) :- begin('agent_carter',_,_,Start), end('agent_carter',_,_,End), Start=<End.

generate_facts_grimm_AND_agent_carter([]) :- assert(grimm_AND_agent_carter(-1,-1)).

generate_facts_grimm_AND_agent_carter([(Start,End) | Tail]) :- assert(grimm_AND_agent_carter(Start,End)), generate_facts_grimm_AND_agent_carter(Tail).

grimm_AND_agent_carter_aux() :- findall((Start,End),grimm(Start,End),Interval1), findall((Start,End),agent_carter(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_grimm_AND_agent_carter(Interval).

grimm_AND_agent_carter_at_2016(Res) :- setof((Start,End),grimm_AND_agent_carter(Start,End),AllINtervals), checkvalidity(2016,AllINtervals,Res).

check_query() :- write('Query = grimm_AND_agent_carter_at_2016'), (grimm_AND_agent_carter_at_2016(true) -> write('\nRes   = true');write('\nRes   = false')).
?- grimm_AND_agent_carter_aux().

