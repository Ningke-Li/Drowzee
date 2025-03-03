:- include('database.pl').
operation_weser_bung(Start,End) :- begin('operation_weser_bung',_,_,Start), end('operation_weser_bung',_,_,End), Start=<End.

first_barbary_war(Start,End) :- begin('first_barbary_war',_,_,Start), end('first_barbary_war',_,_,End), Start=<End.

generate_facts_operation_weser_bung_OR_first_barbary_war([]) :- assert(operation_weser_bung_OR_first_barbary_war(-1,-1)).

generate_facts_operation_weser_bung_OR_first_barbary_war([(Start,End) | Tail]) :- assert(operation_weser_bung_OR_first_barbary_war(Start,End)), generate_facts_operation_weser_bung_OR_first_barbary_war(Tail).

operation_weser_bung_OR_first_barbary_war_aux() :- findall((Start,End),operation_weser_bung(Start,End),Interval1), findall((Start,End),first_barbary_war(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_operation_weser_bung_OR_first_barbary_war(Interval).

operation_weser_bung_OR_first_barbary_war_at_1767(Res) :- setof((Start,End),operation_weser_bung_OR_first_barbary_war(Start,End),AllINtervals), checkvalidity(1767,AllINtervals,Res).

check_query() :- write('Query = operation_weser_bung_OR_first_barbary_war_at_1767'), (operation_weser_bung_OR_first_barbary_war_at_1767(true) -> write('\nRes   = true');write('\nRes   = false')).
?- operation_weser_bung_OR_first_barbary_war_aux().

