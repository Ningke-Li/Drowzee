:- include('database.pl').
ben_10__alien_force(Start,End) :- begin('ben_10__alien_force',_,_,Start), end('ben_10__alien_force',_,_,End), Start=<End.

ev_1400s(Start,End) :- begin('ev_1400s',_,_,Start), end('ev_1400s',_,_,End), Start=<End.

generate_facts_ben_10__alien_force_OR_ev_1400s([]) :- assert(ben_10__alien_force_OR_ev_1400s(-1,-1)).

generate_facts_ben_10__alien_force_OR_ev_1400s([(Start,End) | Tail]) :- assert(ben_10__alien_force_OR_ev_1400s(Start,End)), generate_facts_ben_10__alien_force_OR_ev_1400s(Tail).

ben_10__alien_force_OR_ev_1400s_aux() :- findall((Start,End),ben_10__alien_force(Start,End),Interval1), findall((Start,End),ev_1400s(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ben_10__alien_force_OR_ev_1400s(Interval).

ben_10__alien_force_OR_ev_1400s_at_1406(Res) :- setof((Start,End),ben_10__alien_force_OR_ev_1400s(Start,End),AllINtervals), checkvalidity(1406,AllINtervals,Res).

check_query() :- write('Query = ben_10__alien_force_OR_ev_1400s_at_1406'), (ben_10__alien_force_OR_ev_1400s_at_1406(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ben_10__alien_force_OR_ev_1400s_aux().

