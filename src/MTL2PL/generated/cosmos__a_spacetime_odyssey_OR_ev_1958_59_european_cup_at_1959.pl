:- include('database.pl').
cosmos__a_spacetime_odyssey(Start,End) :- begin('cosmos__a_spacetime_odyssey',_,_,Start), end('cosmos__a_spacetime_odyssey',_,_,End), Start=<End.

ev_1958_59_european_cup(Start,End) :- begin('ev_1958_59_european_cup',_,_,Start), end('ev_1958_59_european_cup',_,_,End), Start=<End.

generate_facts_cosmos__a_spacetime_odyssey_OR_ev_1958_59_european_cup([]) :- assert(cosmos__a_spacetime_odyssey_OR_ev_1958_59_european_cup(-1,-1)).

generate_facts_cosmos__a_spacetime_odyssey_OR_ev_1958_59_european_cup([(Start,End) | Tail]) :- assert(cosmos__a_spacetime_odyssey_OR_ev_1958_59_european_cup(Start,End)), generate_facts_cosmos__a_spacetime_odyssey_OR_ev_1958_59_european_cup(Tail).

cosmos__a_spacetime_odyssey_OR_ev_1958_59_european_cup_aux() :- findall((Start,End),cosmos__a_spacetime_odyssey(Start,End),Interval1), findall((Start,End),ev_1958_59_european_cup(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_cosmos__a_spacetime_odyssey_OR_ev_1958_59_european_cup(Interval).

cosmos__a_spacetime_odyssey_OR_ev_1958_59_european_cup_at_1959(Res) :- setof((Start,End),cosmos__a_spacetime_odyssey_OR_ev_1958_59_european_cup(Start,End),AllINtervals), checkvalidity(1959,AllINtervals,Res).

check_query() :- write('Query = cosmos__a_spacetime_odyssey_OR_ev_1958_59_european_cup_at_1959'), (cosmos__a_spacetime_odyssey_OR_ev_1958_59_european_cup_at_1959(true) -> write('\nRes   = true');write('\nRes   = false')).
?- cosmos__a_spacetime_odyssey_OR_ev_1958_59_european_cup_aux().

