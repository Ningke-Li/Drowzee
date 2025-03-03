:- include('database.pl').
portuguese_escudo(Start,End) :- begin('portuguese_escudo',_,_,Start), end('portuguese_escudo',_,_,End), Start=<End.

second_boer_war(Start,End) :- begin('second_boer_war',_,_,Start), end('second_boer_war',_,_,End), Start=<End.

generate_facts_portuguese_escudo_OR_second_boer_war([]) :- assert(portuguese_escudo_OR_second_boer_war(-1,-1)).

generate_facts_portuguese_escudo_OR_second_boer_war([(Start,End) | Tail]) :- assert(portuguese_escudo_OR_second_boer_war(Start,End)), generate_facts_portuguese_escudo_OR_second_boer_war(Tail).

portuguese_escudo_OR_second_boer_war_aux() :- findall((Start,End),portuguese_escudo(Start,End),Interval1), findall((Start,End),second_boer_war(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_portuguese_escudo_OR_second_boer_war(Interval).

portuguese_escudo_OR_second_boer_war_at_2008(Res) :- setof((Start,End),portuguese_escudo_OR_second_boer_war(Start,End),AllINtervals), checkvalidity(2008,AllINtervals,Res).

check_query() :- write('Query = portuguese_escudo_OR_second_boer_war_at_2008'), (portuguese_escudo_OR_second_boer_war_at_2008(true) -> write('\nRes   = true');write('\nRes   = false')).
?- portuguese_escudo_OR_second_boer_war_aux().

