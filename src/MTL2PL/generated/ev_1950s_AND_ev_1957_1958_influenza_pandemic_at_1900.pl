:- include('database.pl').
ev_1950s(Start,End) :- begin('ev_1950s',_,_,Start), end('ev_1950s',_,_,End), Start=<End.

ev_1957_1958_influenza_pandemic(Start,End) :- begin('ev_1957_1958_influenza_pandemic',_,_,Start), end('ev_1957_1958_influenza_pandemic',_,_,End), Start=<End.

generate_facts_ev_1950s_AND_ev_1957_1958_influenza_pandemic([]) :- assert(ev_1950s_AND_ev_1957_1958_influenza_pandemic(-1,-1)).

generate_facts_ev_1950s_AND_ev_1957_1958_influenza_pandemic([(Start,End) | Tail]) :- assert(ev_1950s_AND_ev_1957_1958_influenza_pandemic(Start,End)), generate_facts_ev_1950s_AND_ev_1957_1958_influenza_pandemic(Tail).

ev_1950s_AND_ev_1957_1958_influenza_pandemic_aux() :- findall((Start,End),ev_1950s(Start,End),Interval1), findall((Start,End),ev_1957_1958_influenza_pandemic(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ev_1950s_AND_ev_1957_1958_influenza_pandemic(Interval).

ev_1950s_AND_ev_1957_1958_influenza_pandemic_at_1900(Res) :- setof((Start,End),ev_1950s_AND_ev_1957_1958_influenza_pandemic(Start,End),AllINtervals), checkvalidity(1900,AllINtervals,Res).

check_query() :- write('Query = ev_1950s_AND_ev_1957_1958_influenza_pandemic_at_1900'), (ev_1950s_AND_ev_1957_1958_influenza_pandemic_at_1900(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_1950s_AND_ev_1957_1958_influenza_pandemic_aux().

