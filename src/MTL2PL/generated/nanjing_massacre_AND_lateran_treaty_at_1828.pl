:- include('database.pl').
nanjing_massacre(Start,End) :- begin('nanjing_massacre',_,_,Start), end('nanjing_massacre',_,_,End), Start=<End.

lateran_treaty(Start,End) :- begin('lateran_treaty',_,_,Start), end('lateran_treaty',_,_,End), Start=<End.

generate_facts_nanjing_massacre_AND_lateran_treaty([]) :- assert(nanjing_massacre_AND_lateran_treaty(-1,-1)).

generate_facts_nanjing_massacre_AND_lateran_treaty([(Start,End) | Tail]) :- assert(nanjing_massacre_AND_lateran_treaty(Start,End)), generate_facts_nanjing_massacre_AND_lateran_treaty(Tail).

nanjing_massacre_AND_lateran_treaty_aux() :- findall((Start,End),nanjing_massacre(Start,End),Interval1), findall((Start,End),lateran_treaty(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_nanjing_massacre_AND_lateran_treaty(Interval).

nanjing_massacre_AND_lateran_treaty_at_1828(Res) :- setof((Start,End),nanjing_massacre_AND_lateran_treaty(Start,End),AllINtervals), checkvalidity(1828,AllINtervals,Res).

check_query() :- write('Query = nanjing_massacre_AND_lateran_treaty_at_1828'), (nanjing_massacre_AND_lateran_treaty_at_1828(true) -> write('\nRes   = true');write('\nRes   = false')).
?- nanjing_massacre_AND_lateran_treaty_aux().

