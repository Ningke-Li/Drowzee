:- include('database.pl').
the_flash(Start,End) :- begin('the_flash',_,_,Start), end('the_flash',_,_,End), Start=<End.

mickey_mouse_clubhouse(Start,End) :- begin('mickey_mouse_clubhouse',_,_,Start), end('mickey_mouse_clubhouse',_,_,End), Start=<End.

generate_facts_the_flash_AND_mickey_mouse_clubhouse([]) :- assert(the_flash_AND_mickey_mouse_clubhouse(-1,-1)).

generate_facts_the_flash_AND_mickey_mouse_clubhouse([(Start,End) | Tail]) :- assert(the_flash_AND_mickey_mouse_clubhouse(Start,End)), generate_facts_the_flash_AND_mickey_mouse_clubhouse(Tail).

the_flash_AND_mickey_mouse_clubhouse_aux() :- findall((Start,End),the_flash(Start,End),Interval1), findall((Start,End),mickey_mouse_clubhouse(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_the_flash_AND_mickey_mouse_clubhouse(Interval).

the_flash_AND_mickey_mouse_clubhouse_at_2003(Res) :- setof((Start,End),the_flash_AND_mickey_mouse_clubhouse(Start,End),AllINtervals), checkvalidity(2003,AllINtervals,Res).

check_query() :- write('Query = the_flash_AND_mickey_mouse_clubhouse_at_2003'), (the_flash_AND_mickey_mouse_clubhouse_at_2003(true) -> write('\nRes   = true');write('\nRes   = false')).
?- the_flash_AND_mickey_mouse_clubhouse_aux().

