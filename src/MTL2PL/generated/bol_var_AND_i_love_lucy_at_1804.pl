:- include('database.pl').
bol_var(Start,End) :- begin('bol_var',_,_,Start), end('bol_var',_,_,End), Start=<End.

i_love_lucy(Start,End) :- begin('i_love_lucy',_,_,Start), end('i_love_lucy',_,_,End), Start=<End.

generate_facts_bol_var_AND_i_love_lucy([]) :- assert(bol_var_AND_i_love_lucy(-1,-1)).

generate_facts_bol_var_AND_i_love_lucy([(Start,End) | Tail]) :- assert(bol_var_AND_i_love_lucy(Start,End)), generate_facts_bol_var_AND_i_love_lucy(Tail).

bol_var_AND_i_love_lucy_aux() :- findall((Start,End),bol_var(Start,End),Interval1), findall((Start,End),i_love_lucy(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_bol_var_AND_i_love_lucy(Interval).

bol_var_AND_i_love_lucy_at_1804(Res) :- setof((Start,End),bol_var_AND_i_love_lucy(Start,End),AllINtervals), checkvalidity(1804,AllINtervals,Res).

check_query() :- write('Query = bol_var_AND_i_love_lucy_at_1804'), (bol_var_AND_i_love_lucy_at_1804(true) -> write('\nRes   = true');write('\nRes   = false')).
?- bol_var_AND_i_love_lucy_aux().

