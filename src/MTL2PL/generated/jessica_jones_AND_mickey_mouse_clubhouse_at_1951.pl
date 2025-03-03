:- include('database.pl').
jessica_jones(Start,End) :- begin('jessica_jones',_,_,Start), end('jessica_jones',_,_,End), Start=<End.

mickey_mouse_clubhouse(Start,End) :- begin('mickey_mouse_clubhouse',_,_,Start), end('mickey_mouse_clubhouse',_,_,End), Start=<End.

generate_facts_jessica_jones_AND_mickey_mouse_clubhouse([]) :- assert(jessica_jones_AND_mickey_mouse_clubhouse(-1,-1)).

generate_facts_jessica_jones_AND_mickey_mouse_clubhouse([(Start,End) | Tail]) :- assert(jessica_jones_AND_mickey_mouse_clubhouse(Start,End)), generate_facts_jessica_jones_AND_mickey_mouse_clubhouse(Tail).

jessica_jones_AND_mickey_mouse_clubhouse_aux() :- findall((Start,End),jessica_jones(Start,End),Interval1), findall((Start,End),mickey_mouse_clubhouse(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_jessica_jones_AND_mickey_mouse_clubhouse(Interval).

jessica_jones_AND_mickey_mouse_clubhouse_at_1951(Res) :- setof((Start,End),jessica_jones_AND_mickey_mouse_clubhouse(Start,End),AllINtervals), checkvalidity(1951,AllINtervals,Res).

check_query() :- write('Query = jessica_jones_AND_mickey_mouse_clubhouse_at_1951'), (jessica_jones_AND_mickey_mouse_clubhouse_at_1951(true) -> write('\nRes   = true');write('\nRes   = false')).
?- jessica_jones_AND_mickey_mouse_clubhouse_aux().

