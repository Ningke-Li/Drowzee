:- include('database.pl').
geneva_international_motor_show(Start,End) :- begin('geneva_international_motor_show',_,_,Start), end('geneva_international_motor_show',_,_,End), Start=<End.

osiris_rex(Start,End) :- begin('osiris_rex',_,_,Start), end('osiris_rex',_,_,End), Start=<End.

generate_facts_geneva_international_motor_show_AND_osiris_rex([]) :- assert(geneva_international_motor_show_AND_osiris_rex(-1,-1)).

generate_facts_geneva_international_motor_show_AND_osiris_rex([(Start,End) | Tail]) :- assert(geneva_international_motor_show_AND_osiris_rex(Start,End)), generate_facts_geneva_international_motor_show_AND_osiris_rex(Tail).

geneva_international_motor_show_AND_osiris_rex_aux() :- findall((Start,End),geneva_international_motor_show(Start,End),Interval1), findall((Start,End),osiris_rex(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_geneva_international_motor_show_AND_osiris_rex(Interval).

geneva_international_motor_show_AND_osiris_rex_at_2061(Res) :- setof((Start,End),geneva_international_motor_show_AND_osiris_rex(Start,End),AllINtervals), checkvalidity(2061,AllINtervals,Res).

check_query() :- write('Query = geneva_international_motor_show_AND_osiris_rex_at_2061'), (geneva_international_motor_show_AND_osiris_rex_at_2061(true) -> write('\nRes   = true');write('\nRes   = false')).
?- geneva_international_motor_show_AND_osiris_rex_aux().

