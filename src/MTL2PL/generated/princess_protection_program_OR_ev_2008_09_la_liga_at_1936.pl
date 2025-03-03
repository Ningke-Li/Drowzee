:- include('database.pl').
princess_protection_program(Start,End) :- begin('princess_protection_program',_,_,Start), end('princess_protection_program',_,_,End), Start=<End.

ev_2008_09_la_liga(Start,End) :- begin('ev_2008_09_la_liga',_,_,Start), end('ev_2008_09_la_liga',_,_,End), Start=<End.

generate_facts_princess_protection_program_OR_ev_2008_09_la_liga([]) :- assert(princess_protection_program_OR_ev_2008_09_la_liga(-1,-1)).

generate_facts_princess_protection_program_OR_ev_2008_09_la_liga([(Start,End) | Tail]) :- assert(princess_protection_program_OR_ev_2008_09_la_liga(Start,End)), generate_facts_princess_protection_program_OR_ev_2008_09_la_liga(Tail).

princess_protection_program_OR_ev_2008_09_la_liga_aux() :- findall((Start,End),princess_protection_program(Start,End),Interval1), findall((Start,End),ev_2008_09_la_liga(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_princess_protection_program_OR_ev_2008_09_la_liga(Interval).

princess_protection_program_OR_ev_2008_09_la_liga_at_1936(Res) :- setof((Start,End),princess_protection_program_OR_ev_2008_09_la_liga(Start,End),AllINtervals), checkvalidity(1936,AllINtervals,Res).

check_query() :- write('Query = princess_protection_program_OR_ev_2008_09_la_liga_at_1936'), (princess_protection_program_OR_ev_2008_09_la_liga_at_1936(true) -> write('\nRes   = true');write('\nRes   = false')).
?- princess_protection_program_OR_ev_2008_09_la_liga_aux().

