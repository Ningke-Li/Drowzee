:- include('database.pl').
the_emperor_s_new_school(Start,End) :- begin('the_emperor_s_new_school',_,_,Start), end('the_emperor_s_new_school',_,_,End), Start=<End.

beer_hall_putsch(Start,End) :- begin('beer_hall_putsch',_,_,Start), end('beer_hall_putsch',_,_,End), Start=<End.

generate_facts_the_emperor_s_new_school_OR_beer_hall_putsch([]) :- assert(the_emperor_s_new_school_OR_beer_hall_putsch(-1,-1)).

generate_facts_the_emperor_s_new_school_OR_beer_hall_putsch([(Start,End) | Tail]) :- assert(the_emperor_s_new_school_OR_beer_hall_putsch(Start,End)), generate_facts_the_emperor_s_new_school_OR_beer_hall_putsch(Tail).

the_emperor_s_new_school_OR_beer_hall_putsch_aux() :- findall((Start,End),the_emperor_s_new_school(Start,End),Interval1), findall((Start,End),beer_hall_putsch(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_the_emperor_s_new_school_OR_beer_hall_putsch(Interval).

the_emperor_s_new_school_OR_beer_hall_putsch_at_1943(Res) :- setof((Start,End),the_emperor_s_new_school_OR_beer_hall_putsch(Start,End),AllINtervals), checkvalidity(1943,AllINtervals,Res).

check_query() :- write('Query = the_emperor_s_new_school_OR_beer_hall_putsch_at_1943'), (the_emperor_s_new_school_OR_beer_hall_putsch_at_1943(true) -> write('\nRes   = true');write('\nRes   = false')).
?- the_emperor_s_new_school_OR_beer_hall_putsch_aux().

