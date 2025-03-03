:- include('database.pl').
pale_of_settlement(Start,End) :- begin('pale_of_settlement',_,_,Start), end('pale_of_settlement',_,_,End), Start=<End.

ev_1910s(Start,End) :- begin('ev_1910s',_,_,Start), end('ev_1910s',_,_,End), Start=<End.

generate_facts_pale_of_settlement_AND_ev_1910s([]) :- assert(pale_of_settlement_AND_ev_1910s(-1,-1)).

generate_facts_pale_of_settlement_AND_ev_1910s([(Start,End) | Tail]) :- assert(pale_of_settlement_AND_ev_1910s(Start,End)), generate_facts_pale_of_settlement_AND_ev_1910s(Tail).

pale_of_settlement_AND_ev_1910s_aux() :- findall((Start,End),pale_of_settlement(Start,End),Interval1), findall((Start,End),ev_1910s(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_pale_of_settlement_AND_ev_1910s(Interval).

pale_of_settlement_AND_ev_1910s_at_1946(Res) :- setof((Start,End),pale_of_settlement_AND_ev_1910s(Start,End),AllINtervals), checkvalidity(1946,AllINtervals,Res).

check_query() :- write('Query = pale_of_settlement_AND_ev_1910s_at_1946'), (pale_of_settlement_AND_ev_1910s_at_1946(true) -> write('\nRes   = true');write('\nRes   = false')).
?- pale_of_settlement_AND_ev_1910s_aux().

