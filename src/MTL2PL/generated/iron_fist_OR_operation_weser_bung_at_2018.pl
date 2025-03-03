:- include('database.pl').
iron_fist(Start,End) :- begin('iron_fist',_,_,Start), end('iron_fist',_,_,End), Start=<End.

operation_weser_bung(Start,End) :- begin('operation_weser_bung',_,_,Start), end('operation_weser_bung',_,_,End), Start=<End.

generate_facts_iron_fist_OR_operation_weser_bung([]) :- assert(iron_fist_OR_operation_weser_bung(-1,-1)).

generate_facts_iron_fist_OR_operation_weser_bung([(Start,End) | Tail]) :- assert(iron_fist_OR_operation_weser_bung(Start,End)), generate_facts_iron_fist_OR_operation_weser_bung(Tail).

iron_fist_OR_operation_weser_bung_aux() :- findall((Start,End),iron_fist(Start,End),Interval1), findall((Start,End),operation_weser_bung(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_iron_fist_OR_operation_weser_bung(Interval).

iron_fist_OR_operation_weser_bung_at_2018(Res) :- setof((Start,End),iron_fist_OR_operation_weser_bung(Start,End),AllINtervals), checkvalidity(2018,AllINtervals,Res).

check_query() :- write('Query = iron_fist_OR_operation_weser_bung_at_2018'), (iron_fist_OR_operation_weser_bung_at_2018(true) -> write('\nRes   = true');write('\nRes   = false')).
?- iron_fist_OR_operation_weser_bung_aux().

