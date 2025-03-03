:- include('database.pl').
bol_var(Start,End) :- begin('bol_var',_,_,Start), end('bol_var',_,_,End), Start=<End.

berlin_conference(Start,End) :- begin('berlin_conference',_,_,Start), end('berlin_conference',_,_,End), Start=<End.

generate_facts_bol_var_AND_berlin_conference([]) :- assert(bol_var_AND_berlin_conference(-1,-1)).

generate_facts_bol_var_AND_berlin_conference([(Start,End) | Tail]) :- assert(bol_var_AND_berlin_conference(Start,End)), generate_facts_bol_var_AND_berlin_conference(Tail).

bol_var_AND_berlin_conference_aux() :- findall((Start,End),bol_var(Start,End),Interval1), findall((Start,End),berlin_conference(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_bol_var_AND_berlin_conference(Interval).

bol_var_AND_berlin_conference_at_1884(Res) :- setof((Start,End),bol_var_AND_berlin_conference(Start,End),AllINtervals), checkvalidity(1884,AllINtervals,Res).

check_query() :- write('Query = bol_var_AND_berlin_conference_at_1884'), (bol_var_AND_berlin_conference_at_1884(true) -> write('\nRes   = true');write('\nRes   = false')).
?- bol_var_AND_berlin_conference_aux().

