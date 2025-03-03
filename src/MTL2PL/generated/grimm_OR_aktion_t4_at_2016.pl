:- include('database.pl').
grimm(Start,End) :- begin('grimm',_,_,Start), end('grimm',_,_,End), Start=<End.

aktion_t4(Start,End) :- begin('aktion_t4',_,_,Start), end('aktion_t4',_,_,End), Start=<End.

generate_facts_grimm_OR_aktion_t4([]) :- assert(grimm_OR_aktion_t4(-1,-1)).

generate_facts_grimm_OR_aktion_t4([(Start,End) | Tail]) :- assert(grimm_OR_aktion_t4(Start,End)), generate_facts_grimm_OR_aktion_t4(Tail).

grimm_OR_aktion_t4_aux() :- findall((Start,End),grimm(Start,End),Interval1), findall((Start,End),aktion_t4(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_grimm_OR_aktion_t4(Interval).

grimm_OR_aktion_t4_at_2016(Res) :- setof((Start,End),grimm_OR_aktion_t4(Start,End),AllINtervals), checkvalidity(2016,AllINtervals,Res).

check_query() :- write('Query = grimm_OR_aktion_t4_at_2016'), (grimm_OR_aktion_t4_at_2016(true) -> write('\nRes   = true');write('\nRes   = false')).
?- grimm_OR_aktion_t4_aux().

