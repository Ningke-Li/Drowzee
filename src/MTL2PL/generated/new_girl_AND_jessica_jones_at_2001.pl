:- include('database.pl').
new_girl(Start,End) :- begin('new_girl',_,_,Start), end('new_girl',_,_,End), Start=<End.

jessica_jones(Start,End) :- begin('jessica_jones',_,_,Start), end('jessica_jones',_,_,End), Start=<End.

generate_facts_new_girl_AND_jessica_jones([]) :- assert(new_girl_AND_jessica_jones(-1,-1)).

generate_facts_new_girl_AND_jessica_jones([(Start,End) | Tail]) :- assert(new_girl_AND_jessica_jones(Start,End)), generate_facts_new_girl_AND_jessica_jones(Tail).

new_girl_AND_jessica_jones_aux() :- findall((Start,End),new_girl(Start,End),Interval1), findall((Start,End),jessica_jones(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_new_girl_AND_jessica_jones(Interval).

new_girl_AND_jessica_jones_at_2001(Res) :- setof((Start,End),new_girl_AND_jessica_jones(Start,End),AllINtervals), checkvalidity(2001,AllINtervals,Res).

check_query() :- write('Query = new_girl_AND_jessica_jones_at_2001'), (new_girl_AND_jessica_jones_at_2001(true) -> write('\nRes   = true');write('\nRes   = false')).
?- new_girl_AND_jessica_jones_aux().

