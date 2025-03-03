:- include('database.pl').
fullmetal_alchemist(Start,End) :- begin('fullmetal_alchemist',_,_,Start), end('fullmetal_alchemist',_,_,End), Start=<End.

geneva_international_motor_show(Start,End) :- begin('geneva_international_motor_show',_,_,Start), end('geneva_international_motor_show',_,_,End), Start=<End.

generate_facts_fullmetal_alchemist_AND_geneva_international_motor_show([]) :- assert(fullmetal_alchemist_AND_geneva_international_motor_show(-1,-1)).

generate_facts_fullmetal_alchemist_AND_geneva_international_motor_show([(Start,End) | Tail]) :- assert(fullmetal_alchemist_AND_geneva_international_motor_show(Start,End)), generate_facts_fullmetal_alchemist_AND_geneva_international_motor_show(Tail).

fullmetal_alchemist_AND_geneva_international_motor_show_aux() :- findall((Start,End),fullmetal_alchemist(Start,End),Interval1), findall((Start,End),geneva_international_motor_show(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_fullmetal_alchemist_AND_geneva_international_motor_show(Interval).

fullmetal_alchemist_AND_geneva_international_motor_show_at_1871(Res) :- setof((Start,End),fullmetal_alchemist_AND_geneva_international_motor_show(Start,End),AllINtervals), checkvalidity(1871,AllINtervals,Res).

check_query() :- write('Query = fullmetal_alchemist_AND_geneva_international_motor_show_at_1871'), (fullmetal_alchemist_AND_geneva_international_motor_show_at_1871(true) -> write('\nRes   = true');write('\nRes   = false')).
?- fullmetal_alchemist_AND_geneva_international_motor_show_aux().

