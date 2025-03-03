:- include('database.pl').
bol_var(Start,End) :- begin('bol_var',_,_,Start), end('bol_var',_,_,End), Start=<End.

ev_1910s(Start,End) :- begin('ev_1910s',_,_,Start), end('ev_1910s',_,_,End), Start=<End.

generate_facts_bol_var_AND_ev_1910s([]) :- assert(bol_var_AND_ev_1910s(-1,-1)).

generate_facts_bol_var_AND_ev_1910s([(Start,End) | Tail]) :- assert(bol_var_AND_ev_1910s(Start,End)), generate_facts_bol_var_AND_ev_1910s(Tail).

bol_var_AND_ev_1910s_aux() :- findall((Start,End),bol_var(Start,End),Interval1), findall((Start,End),ev_1910s(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_bol_var_AND_ev_1910s(Interval).

bol_var_AND_ev_1910s_at_1812(Res) :- setof((Start,End),bol_var_AND_ev_1910s(Start,End),AllINtervals), checkvalidity(1812,AllINtervals,Res).

check_query() :- write('Query = bol_var_AND_ev_1910s_at_1812'), (bol_var_AND_ev_1910s_at_1812(true) -> write('\nRes   = true');write('\nRes   = false')).
?- bol_var_AND_ev_1910s_aux().

