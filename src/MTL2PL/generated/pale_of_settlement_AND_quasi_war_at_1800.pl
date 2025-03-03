:- include('database.pl').
pale_of_settlement(Start,End) :- begin('pale_of_settlement',_,_,Start), end('pale_of_settlement',_,_,End), Start=<End.

quasi_war(Start,End) :- begin('quasi_war',_,_,Start), end('quasi_war',_,_,End), Start=<End.

generate_facts_pale_of_settlement_AND_quasi_war([]) :- assert(pale_of_settlement_AND_quasi_war(-1,-1)).

generate_facts_pale_of_settlement_AND_quasi_war([(Start,End) | Tail]) :- assert(pale_of_settlement_AND_quasi_war(Start,End)), generate_facts_pale_of_settlement_AND_quasi_war(Tail).

pale_of_settlement_AND_quasi_war_aux() :- findall((Start,End),pale_of_settlement(Start,End),Interval1), findall((Start,End),quasi_war(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_pale_of_settlement_AND_quasi_war(Interval).

pale_of_settlement_AND_quasi_war_at_1800(Res) :- setof((Start,End),pale_of_settlement_AND_quasi_war(Start,End),AllINtervals), checkvalidity(1800,AllINtervals,Res).

check_query() :- write('Query = pale_of_settlement_AND_quasi_war_at_1800'), (pale_of_settlement_AND_quasi_war_at_1800(true) -> write('\nRes   = true');write('\nRes   = false')).
?- pale_of_settlement_AND_quasi_war_aux().

