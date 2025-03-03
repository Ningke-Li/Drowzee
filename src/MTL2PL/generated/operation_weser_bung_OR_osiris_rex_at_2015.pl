:- include('database.pl').
operation_weser_bung(Start,End) :- begin('operation_weser_bung',_,_,Start), end('operation_weser_bung',_,_,End), Start=<End.

osiris_rex(Start,End) :- begin('osiris_rex',_,_,Start), end('osiris_rex',_,_,End), Start=<End.

generate_facts_operation_weser_bung_OR_osiris_rex([]) :- assert(operation_weser_bung_OR_osiris_rex(-1,-1)).

generate_facts_operation_weser_bung_OR_osiris_rex([(Start,End) | Tail]) :- assert(operation_weser_bung_OR_osiris_rex(Start,End)), generate_facts_operation_weser_bung_OR_osiris_rex(Tail).

operation_weser_bung_OR_osiris_rex_aux() :- findall((Start,End),operation_weser_bung(Start,End),Interval1), findall((Start,End),osiris_rex(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_operation_weser_bung_OR_osiris_rex(Interval).

operation_weser_bung_OR_osiris_rex_at_2015(Res) :- setof((Start,End),operation_weser_bung_OR_osiris_rex(Start,End),AllINtervals), checkvalidity(2015,AllINtervals,Res).

check_query() :- write('Query = operation_weser_bung_OR_osiris_rex_at_2015'), (operation_weser_bung_OR_osiris_rex_at_2015(true) -> write('\nRes   = true');write('\nRes   = false')).
?- operation_weser_bung_OR_osiris_rex_aux().

