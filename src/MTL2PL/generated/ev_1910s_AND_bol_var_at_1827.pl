:- include('database.pl').
ev_1910s(Start,End) :- begin('ev_1910s',_,_,Start), end('ev_1910s',_,_,End), Start=<End.

bol_var(Start,End) :- begin('bol_var',_,_,Start), end('bol_var',_,_,End), Start=<End.

generate_facts_ev_1910s_AND_bol_var([]) :- assert(ev_1910s_AND_bol_var(-1,-1)).

generate_facts_ev_1910s_AND_bol_var([(Start,End) | Tail]) :- assert(ev_1910s_AND_bol_var(Start,End)), generate_facts_ev_1910s_AND_bol_var(Tail).

ev_1910s_AND_bol_var_aux() :- findall((Start,End),ev_1910s(Start,End),Interval1), findall((Start,End),bol_var(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ev_1910s_AND_bol_var(Interval).

ev_1910s_AND_bol_var_at_1827(Res) :- setof((Start,End),ev_1910s_AND_bol_var(Start,End),AllINtervals), checkvalidity(1827,AllINtervals,Res).

check_query() :- write('Query = ev_1910s_AND_bol_var_at_1827'), (ev_1910s_AND_bol_var_at_1827(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_1910s_AND_bol_var_aux().

