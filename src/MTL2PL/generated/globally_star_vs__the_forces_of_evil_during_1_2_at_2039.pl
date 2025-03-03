:- include('database.pl').
star_vs__the_forces_of_evil(Start,End) :- begin('star_vs__the_forces_of_evil',_,_,Start), end('star_vs__the_forces_of_evil',_,_,End), Start=<End.

globally_star_vs__the_forces_of_evil_during_1_2(Start,End) :- star_vs__the_forces_of_evil(Start1,End1), Start is (Start1-1), End is (End1-2), Start=<End.

globally_star_vs__the_forces_of_evil_during_1_2_at_2039(Res) :- setof((Start,End),globally_star_vs__the_forces_of_evil_during_1_2(Start,End),AllINtervals), checkvalidity(2039,AllINtervals,Res).

check_query() :- write('Query = globally_star_vs__the_forces_of_evil_during_1_2_at_2039'), (globally_star_vs__the_forces_of_evil_during_1_2_at_2039(true) -> write('\nRes   = true');write('\nRes   = false')).

