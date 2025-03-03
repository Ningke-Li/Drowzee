:- include('database.pl').
operation_bernhard(Start,End) :- begin('operation_bernhard',_,_,Start), end('operation_bernhard',_,_,End), Start=<End.

polish_lithuanian_teutonic_war(Start,End) :- begin('polish_lithuanian_teutonic_war',_,_,Start), end('polish_lithuanian_teutonic_war',_,_,End), Start=<End.

generate_facts_operation_bernhard_OR_polish_lithuanian_teutonic_war([]) :- assert(operation_bernhard_OR_polish_lithuanian_teutonic_war(-1,-1)).

generate_facts_operation_bernhard_OR_polish_lithuanian_teutonic_war([(Start,End) | Tail]) :- assert(operation_bernhard_OR_polish_lithuanian_teutonic_war(Start,End)), generate_facts_operation_bernhard_OR_polish_lithuanian_teutonic_war(Tail).

operation_bernhard_OR_polish_lithuanian_teutonic_war_aux() :- findall((Start,End),operation_bernhard(Start,End),Interval1), findall((Start,End),polish_lithuanian_teutonic_war(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_operation_bernhard_OR_polish_lithuanian_teutonic_war(Interval).

operation_bernhard_OR_polish_lithuanian_teutonic_war_at_1875(Res) :- setof((Start,End),operation_bernhard_OR_polish_lithuanian_teutonic_war(Start,End),AllINtervals), checkvalidity(1875,AllINtervals,Res).

check_query() :- write('Query = operation_bernhard_OR_polish_lithuanian_teutonic_war_at_1875'), (operation_bernhard_OR_polish_lithuanian_teutonic_war_at_1875(true) -> write('\nRes   = true');write('\nRes   = false')).
?- operation_bernhard_OR_polish_lithuanian_teutonic_war_aux().

