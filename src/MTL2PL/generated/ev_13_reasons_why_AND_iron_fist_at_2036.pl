:- include('database.pl').
ev_13_reasons_why(Start,End) :- begin('ev_13_reasons_why',_,_,Start), end('ev_13_reasons_why',_,_,End), Start=<End.

iron_fist(Start,End) :- begin('iron_fist',_,_,Start), end('iron_fist',_,_,End), Start=<End.

generate_facts_ev_13_reasons_why_AND_iron_fist([]) :- assert(ev_13_reasons_why_AND_iron_fist(-1,-1)).

generate_facts_ev_13_reasons_why_AND_iron_fist([(Start,End) | Tail]) :- assert(ev_13_reasons_why_AND_iron_fist(Start,End)), generate_facts_ev_13_reasons_why_AND_iron_fist(Tail).

ev_13_reasons_why_AND_iron_fist_aux() :- findall((Start,End),ev_13_reasons_why(Start,End),Interval1), findall((Start,End),iron_fist(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ev_13_reasons_why_AND_iron_fist(Interval).

ev_13_reasons_why_AND_iron_fist_at_2036(Res) :- setof((Start,End),ev_13_reasons_why_AND_iron_fist(Start,End),AllINtervals), checkvalidity(2036,AllINtervals,Res).

check_query() :- write('Query = ev_13_reasons_why_AND_iron_fist_at_2036'), (ev_13_reasons_why_AND_iron_fist_at_2036(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_13_reasons_why_AND_iron_fist_aux().

