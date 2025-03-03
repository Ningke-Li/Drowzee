:- include('database.pl').
ev_2000_afc_asian_cup(Start,End) :- begin('ev_2000_afc_asian_cup',_,_,Start), end('ev_2000_afc_asian_cup',_,_,End), Start=<End.

prohibition_in_the_united_states(Start,End) :- begin('prohibition_in_the_united_states',_,_,Start), end('prohibition_in_the_united_states',_,_,End), Start=<End.

generate_facts_ev_2000_afc_asian_cup_OR_prohibition_in_the_united_states([]) :- assert(ev_2000_afc_asian_cup_OR_prohibition_in_the_united_states(-1,-1)).

generate_facts_ev_2000_afc_asian_cup_OR_prohibition_in_the_united_states([(Start,End) | Tail]) :- assert(ev_2000_afc_asian_cup_OR_prohibition_in_the_united_states(Start,End)), generate_facts_ev_2000_afc_asian_cup_OR_prohibition_in_the_united_states(Tail).

ev_2000_afc_asian_cup_OR_prohibition_in_the_united_states_aux() :- findall((Start,End),ev_2000_afc_asian_cup(Start,End),Interval1), findall((Start,End),prohibition_in_the_united_states(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2000_afc_asian_cup_OR_prohibition_in_the_united_states(Interval).

ev_2000_afc_asian_cup_OR_prohibition_in_the_united_states_at_1931(Res) :- setof((Start,End),ev_2000_afc_asian_cup_OR_prohibition_in_the_united_states(Start,End),AllINtervals), checkvalidity(1931,AllINtervals,Res).

check_query() :- write('Query = ev_2000_afc_asian_cup_OR_prohibition_in_the_united_states_at_1931'), (ev_2000_afc_asian_cup_OR_prohibition_in_the_united_states_at_1931(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2000_afc_asian_cup_OR_prohibition_in_the_united_states_aux().

