:- include('database.pl').
spanish_conquest_of_the_inca_empire(Start,End) :- begin('spanish_conquest_of_the_inca_empire',_,_,Start), end('spanish_conquest_of_the_inca_empire',_,_,End), Start=<End.

dutch_guilder(Start,End) :- begin('dutch_guilder',_,_,Start), end('dutch_guilder',_,_,End), Start=<End.

generate_facts_spanish_conquest_of_the_inca_empire_AND_dutch_guilder([]) :- assert(spanish_conquest_of_the_inca_empire_AND_dutch_guilder(-1,-1)).

generate_facts_spanish_conquest_of_the_inca_empire_AND_dutch_guilder([(Start,End) | Tail]) :- assert(spanish_conquest_of_the_inca_empire_AND_dutch_guilder(Start,End)), generate_facts_spanish_conquest_of_the_inca_empire_AND_dutch_guilder(Tail).

spanish_conquest_of_the_inca_empire_AND_dutch_guilder_aux() :- findall((Start,End),spanish_conquest_of_the_inca_empire(Start,End),Interval1), findall((Start,End),dutch_guilder(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_spanish_conquest_of_the_inca_empire_AND_dutch_guilder(Interval).

spanish_conquest_of_the_inca_empire_AND_dutch_guilder_at_1541(Res) :- setof((Start,End),spanish_conquest_of_the_inca_empire_AND_dutch_guilder(Start,End),AllINtervals), checkvalidity(1541,AllINtervals,Res).

check_query() :- write('Query = spanish_conquest_of_the_inca_empire_AND_dutch_guilder_at_1541'), (spanish_conquest_of_the_inca_empire_AND_dutch_guilder_at_1541(true) -> write('\nRes   = true');write('\nRes   = false')).
?- spanish_conquest_of_the_inca_empire_AND_dutch_guilder_aux().

