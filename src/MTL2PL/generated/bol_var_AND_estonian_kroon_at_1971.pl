:- include('database.pl').
bol_var(Start,End) :- begin('bol_var',_,_,Start), end('bol_var',_,_,End), Start=<End.

estonian_kroon(Start,End) :- begin('estonian_kroon',_,_,Start), end('estonian_kroon',_,_,End), Start=<End.

generate_facts_bol_var_AND_estonian_kroon([]) :- assert(bol_var_AND_estonian_kroon(-1,-1)).

generate_facts_bol_var_AND_estonian_kroon([(Start,End) | Tail]) :- assert(bol_var_AND_estonian_kroon(Start,End)), generate_facts_bol_var_AND_estonian_kroon(Tail).

bol_var_AND_estonian_kroon_aux() :- findall((Start,End),bol_var(Start,End),Interval1), findall((Start,End),estonian_kroon(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_bol_var_AND_estonian_kroon(Interval).

bol_var_AND_estonian_kroon_at_1971(Res) :- setof((Start,End),bol_var_AND_estonian_kroon(Start,End),AllINtervals), checkvalidity(1971,AllINtervals,Res).

check_query() :- write('Query = bol_var_AND_estonian_kroon_at_1971'), (bol_var_AND_estonian_kroon_at_1971(true) -> write('\nRes   = true');write('\nRes   = false')).
?- bol_var_AND_estonian_kroon_aux().

