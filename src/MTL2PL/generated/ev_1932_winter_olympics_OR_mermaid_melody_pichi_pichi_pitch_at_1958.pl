:- include('database.pl').
ev_1932_winter_olympics(Start,End) :- begin('ev_1932_winter_olympics',_,_,Start), end('ev_1932_winter_olympics',_,_,End), Start=<End.

mermaid_melody_pichi_pichi_pitch(Start,End) :- begin('mermaid_melody_pichi_pichi_pitch',_,_,Start), end('mermaid_melody_pichi_pichi_pitch',_,_,End), Start=<End.

generate_facts_ev_1932_winter_olympics_OR_mermaid_melody_pichi_pichi_pitch([]) :- assert(ev_1932_winter_olympics_OR_mermaid_melody_pichi_pichi_pitch(-1,-1)).

generate_facts_ev_1932_winter_olympics_OR_mermaid_melody_pichi_pichi_pitch([(Start,End) | Tail]) :- assert(ev_1932_winter_olympics_OR_mermaid_melody_pichi_pichi_pitch(Start,End)), generate_facts_ev_1932_winter_olympics_OR_mermaid_melody_pichi_pichi_pitch(Tail).

ev_1932_winter_olympics_OR_mermaid_melody_pichi_pichi_pitch_aux() :- findall((Start,End),ev_1932_winter_olympics(Start,End),Interval1), findall((Start,End),mermaid_melody_pichi_pichi_pitch(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_1932_winter_olympics_OR_mermaid_melody_pichi_pichi_pitch(Interval).

ev_1932_winter_olympics_OR_mermaid_melody_pichi_pichi_pitch_at_1958(Res) :- setof((Start,End),ev_1932_winter_olympics_OR_mermaid_melody_pichi_pichi_pitch(Start,End),AllINtervals), checkvalidity(1958,AllINtervals,Res).

check_query() :- write('Query = ev_1932_winter_olympics_OR_mermaid_melody_pichi_pichi_pitch_at_1958'), (ev_1932_winter_olympics_OR_mermaid_melody_pichi_pichi_pitch_at_1958(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_1932_winter_olympics_OR_mermaid_melody_pichi_pichi_pitch_aux().

