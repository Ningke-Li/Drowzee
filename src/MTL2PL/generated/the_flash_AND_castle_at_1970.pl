:- include('database.pl').
the_flash(Start,End) :- begin('the_flash',_,_,Start), end('the_flash',_,_,End), Start=<End.

castle(Start,End) :- begin('castle',_,_,Start), end('castle',_,_,End), Start=<End.

generate_facts_the_flash_AND_castle([]) :- assert(the_flash_AND_castle(-1,-1)).

generate_facts_the_flash_AND_castle([(Start,End) | Tail]) :- assert(the_flash_AND_castle(Start,End)), generate_facts_the_flash_AND_castle(Tail).

the_flash_AND_castle_aux() :- findall((Start,End),the_flash(Start,End),Interval1), findall((Start,End),castle(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_the_flash_AND_castle(Interval).

the_flash_AND_castle_at_1970(Res) :- setof((Start,End),the_flash_AND_castle(Start,End),AllINtervals), checkvalidity(1970,AllINtervals,Res).

check_query() :- write('Query = the_flash_AND_castle_at_1970'), (the_flash_AND_castle_at_1970(true) -> write('\nRes   = true');write('\nRes   = false')).
?- the_flash_AND_castle_aux().

