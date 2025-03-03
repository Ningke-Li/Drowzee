:- include('database.pl').
the_flash(Start,End) :- begin('the_flash',_,_,Start), end('the_flash',_,_,End), Start=<End.

the_good_place(Start,End) :- begin('the_good_place',_,_,Start), end('the_good_place',_,_,End), Start=<End.

generate_facts_the_flash_AND_the_good_place([]) :- assert(the_flash_AND_the_good_place(-1,-1)).

generate_facts_the_flash_AND_the_good_place([(Start,End) | Tail]) :- assert(the_flash_AND_the_good_place(Start,End)), generate_facts_the_flash_AND_the_good_place(Tail).

the_flash_AND_the_good_place_aux() :- findall((Start,End),the_flash(Start,End),Interval1), findall((Start,End),the_good_place(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_the_flash_AND_the_good_place(Interval).

the_flash_AND_the_good_place_at_2016(Res) :- setof((Start,End),the_flash_AND_the_good_place(Start,End),AllINtervals), checkvalidity(2016,AllINtervals,Res).

check_query() :- write('Query = the_flash_AND_the_good_place_at_2016'), (the_flash_AND_the_good_place_at_2016(true) -> write('\nRes   = true');write('\nRes   = false')).
?- the_flash_AND_the_good_place_aux().

