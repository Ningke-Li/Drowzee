:- include('database.pl').
the_flash(Start,End) :- begin('the_flash',_,_,Start), end('the_flash',_,_,End), Start=<End.

reign(Start,End) :- begin('reign',_,_,Start), end('reign',_,_,End), Start=<End.

generate_facts_the_flash_AND_reign([]) :- assert(the_flash_AND_reign(-1,-1)).

generate_facts_the_flash_AND_reign([(Start,End) | Tail]) :- assert(the_flash_AND_reign(Start,End)), generate_facts_the_flash_AND_reign(Tail).

the_flash_AND_reign_aux() :- findall((Start,End),the_flash(Start,End),Interval1), findall((Start,End),reign(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_the_flash_AND_reign(Interval).

the_flash_AND_reign_at_2014(Res) :- setof((Start,End),the_flash_AND_reign(Start,End),AllINtervals), checkvalidity(2014,AllINtervals,Res).

check_query() :- write('Query = the_flash_AND_reign_at_2014'), (the_flash_AND_reign_at_2014(true) -> write('\nRes   = true');write('\nRes   = false')).
?- the_flash_AND_reign_aux().

