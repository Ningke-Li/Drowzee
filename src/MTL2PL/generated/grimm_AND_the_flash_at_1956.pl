:- include('database.pl').
grimm(Start,End) :- begin('grimm',_,_,Start), end('grimm',_,_,End), Start=<End.

the_flash(Start,End) :- begin('the_flash',_,_,Start), end('the_flash',_,_,End), Start=<End.

generate_facts_grimm_AND_the_flash([]) :- assert(grimm_AND_the_flash(-1,-1)).

generate_facts_grimm_AND_the_flash([(Start,End) | Tail]) :- assert(grimm_AND_the_flash(Start,End)), generate_facts_grimm_AND_the_flash(Tail).

grimm_AND_the_flash_aux() :- findall((Start,End),grimm(Start,End),Interval1), findall((Start,End),the_flash(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_grimm_AND_the_flash(Interval).

grimm_AND_the_flash_at_1956(Res) :- setof((Start,End),grimm_AND_the_flash(Start,End),AllINtervals), checkvalidity(1956,AllINtervals,Res).

check_query() :- write('Query = grimm_AND_the_flash_at_1956'), (grimm_AND_the_flash_at_1956(true) -> write('\nRes   = true');write('\nRes   = false')).
?- grimm_AND_the_flash_aux().

