:- include('database.pl').
nanjing_massacre(Start,End) :- begin('nanjing_massacre',_,_,Start), end('nanjing_massacre',_,_,End), Start=<End.

little_entente(Start,End) :- begin('little_entente',_,_,Start), end('little_entente',_,_,End), Start=<End.

generate_facts_nanjing_massacre_AND_little_entente([]) :- assert(nanjing_massacre_AND_little_entente(-1,-1)).

generate_facts_nanjing_massacre_AND_little_entente([(Start,End) | Tail]) :- assert(nanjing_massacre_AND_little_entente(Start,End)), generate_facts_nanjing_massacre_AND_little_entente(Tail).

nanjing_massacre_AND_little_entente_aux() :- findall((Start,End),nanjing_massacre(Start,End),Interval1), findall((Start,End),little_entente(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_nanjing_massacre_AND_little_entente(Interval).

nanjing_massacre_AND_little_entente_at_1964(Res) :- setof((Start,End),nanjing_massacre_AND_little_entente(Start,End),AllINtervals), checkvalidity(1964,AllINtervals,Res).

check_query() :- write('Query = nanjing_massacre_AND_little_entente_at_1964'), (nanjing_massacre_AND_little_entente_at_1964(true) -> write('\nRes   = true');write('\nRes   = false')).
?- nanjing_massacre_AND_little_entente_aux().

