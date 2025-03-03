:- include('database.pl').
bol_var(Start,End) :- begin('bol_var',_,_,Start), end('bol_var',_,_,End), Start=<End.

jericho(Start,End) :- begin('jericho',_,_,Start), end('jericho',_,_,End), Start=<End.

generate_facts_bol_var_AND_jericho([]) :- assert(bol_var_AND_jericho(-1,-1)).

generate_facts_bol_var_AND_jericho([(Start,End) | Tail]) :- assert(bol_var_AND_jericho(Start,End)), generate_facts_bol_var_AND_jericho(Tail).

bol_var_AND_jericho_aux() :- findall((Start,End),bol_var(Start,End),Interval1), findall((Start,End),jericho(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_bol_var_AND_jericho(Interval).

bol_var_AND_jericho_at_2011(Res) :- setof((Start,End),bol_var_AND_jericho(Start,End),AllINtervals), checkvalidity(2011,AllINtervals,Res).

check_query() :- write('Query = bol_var_AND_jericho_at_2011'), (bol_var_AND_jericho_at_2011(true) -> write('\nRes   = true');write('\nRes   = false')).
?- bol_var_AND_jericho_aux().

