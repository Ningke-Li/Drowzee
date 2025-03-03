:- include('database.pl').
glee(Start,End) :- begin('glee',_,_,Start), end('glee',_,_,End), Start=<End.

supernatural(Start,End) :- begin('supernatural',_,_,Start), end('supernatural',_,_,End), Start=<End.

generate_facts_glee_AND_supernatural([]) :- assert(glee_AND_supernatural(-1,-1)).

generate_facts_glee_AND_supernatural([(Start,End) | Tail]) :- assert(glee_AND_supernatural(Start,End)), generate_facts_glee_AND_supernatural(Tail).

glee_AND_supernatural_aux() :- findall((Start,End),glee(Start,End),Interval1), findall((Start,End),supernatural(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_glee_AND_supernatural(Interval).

glee_AND_supernatural_at_2010(Res) :- setof((Start,End),glee_AND_supernatural(Start,End),AllINtervals), checkvalidity(2010,AllINtervals,Res).

check_query() :- write('Query = glee_AND_supernatural_at_2010'), (glee_AND_supernatural_at_2010(true) -> write('\nRes   = true');write('\nRes   = false')).
?- glee_AND_supernatural_aux().

