:- include('database.pl').
aktion_t4(Start,End) :- begin('aktion_t4',_,_,Start), end('aktion_t4',_,_,End), Start=<End.

peseta(Start,End) :- begin('peseta',_,_,Start), end('peseta',_,_,End), Start=<End.

generate_facts_aktion_t4_AND_peseta([]) :- assert(aktion_t4_AND_peseta(-1,-1)).

generate_facts_aktion_t4_AND_peseta([(Start,End) | Tail]) :- assert(aktion_t4_AND_peseta(Start,End)), generate_facts_aktion_t4_AND_peseta(Tail).

aktion_t4_AND_peseta_aux() :- findall((Start,End),aktion_t4(Start,End),Interval1), findall((Start,End),peseta(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_aktion_t4_AND_peseta(Interval).

aktion_t4_AND_peseta_at_1940(Res) :- setof((Start,End),aktion_t4_AND_peseta(Start,End),AllINtervals), checkvalidity(1940,AllINtervals,Res).

check_query() :- write('Query = aktion_t4_AND_peseta_at_1940'), (aktion_t4_AND_peseta_at_1940(true) -> write('\nRes   = true');write('\nRes   = false')).
?- aktion_t4_AND_peseta_aux().

