:- include('database.pl').
bol_var(Start,End) :- begin('bol_var',_,_,Start), end('bol_var',_,_,End), Start=<End.

camp_lazlo(Start,End) :- begin('camp_lazlo',_,_,Start), end('camp_lazlo',_,_,End), Start=<End.

generate_facts_bol_var_AND_camp_lazlo([]) :- assert(bol_var_AND_camp_lazlo(-1,-1)).

generate_facts_bol_var_AND_camp_lazlo([(Start,End) | Tail]) :- assert(bol_var_AND_camp_lazlo(Start,End)), generate_facts_bol_var_AND_camp_lazlo(Tail).

bol_var_AND_camp_lazlo_aux() :- findall((Start,End),bol_var(Start,End),Interval1), findall((Start,End),camp_lazlo(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_bol_var_AND_camp_lazlo(Interval).

bol_var_AND_camp_lazlo_at_2007(Res) :- setof((Start,End),bol_var_AND_camp_lazlo(Start,End),AllINtervals), checkvalidity(2007,AllINtervals,Res).

check_query() :- write('Query = bol_var_AND_camp_lazlo_at_2007'), (bol_var_AND_camp_lazlo_at_2007(true) -> write('\nRes   = true');write('\nRes   = false')).
?- bol_var_AND_camp_lazlo_aux().

