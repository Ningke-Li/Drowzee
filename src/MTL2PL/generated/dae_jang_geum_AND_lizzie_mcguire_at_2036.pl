:- include('database.pl').
dae_jang_geum(Start,End) :- begin('dae_jang_geum',_,_,Start), end('dae_jang_geum',_,_,End), Start=<End.

lizzie_mcguire(Start,End) :- begin('lizzie_mcguire',_,_,Start), end('lizzie_mcguire',_,_,End), Start=<End.

generate_facts_dae_jang_geum_AND_lizzie_mcguire([]) :- assert(dae_jang_geum_AND_lizzie_mcguire(-1,-1)).

generate_facts_dae_jang_geum_AND_lizzie_mcguire([(Start,End) | Tail]) :- assert(dae_jang_geum_AND_lizzie_mcguire(Start,End)), generate_facts_dae_jang_geum_AND_lizzie_mcguire(Tail).

dae_jang_geum_AND_lizzie_mcguire_aux() :- findall((Start,End),dae_jang_geum(Start,End),Interval1), findall((Start,End),lizzie_mcguire(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_dae_jang_geum_AND_lizzie_mcguire(Interval).

dae_jang_geum_AND_lizzie_mcguire_at_2036(Res) :- setof((Start,End),dae_jang_geum_AND_lizzie_mcguire(Start,End),AllINtervals), checkvalidity(2036,AllINtervals,Res).

check_query() :- write('Query = dae_jang_geum_AND_lizzie_mcguire_at_2036'), (dae_jang_geum_AND_lizzie_mcguire_at_2036(true) -> write('\nRes   = true');write('\nRes   = false')).
?- dae_jang_geum_AND_lizzie_mcguire_aux().

