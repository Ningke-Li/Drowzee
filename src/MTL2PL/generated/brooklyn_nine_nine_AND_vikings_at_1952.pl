:- include('database.pl').
brooklyn_nine_nine(Start,End) :- begin('brooklyn_nine_nine',_,_,Start), end('brooklyn_nine_nine',_,_,End), Start=<End.

vikings(Start,End) :- begin('vikings',_,_,Start), end('vikings',_,_,End), Start=<End.

generate_facts_brooklyn_nine_nine_AND_vikings([]) :- assert(brooklyn_nine_nine_AND_vikings(-1,-1)).

generate_facts_brooklyn_nine_nine_AND_vikings([(Start,End) | Tail]) :- assert(brooklyn_nine_nine_AND_vikings(Start,End)), generate_facts_brooklyn_nine_nine_AND_vikings(Tail).

brooklyn_nine_nine_AND_vikings_aux() :- findall((Start,End),brooklyn_nine_nine(Start,End),Interval1), findall((Start,End),vikings(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_brooklyn_nine_nine_AND_vikings(Interval).

brooklyn_nine_nine_AND_vikings_at_1952(Res) :- setof((Start,End),brooklyn_nine_nine_AND_vikings(Start,End),AllINtervals), checkvalidity(1952,AllINtervals,Res).

check_query() :- write('Query = brooklyn_nine_nine_AND_vikings_at_1952'), (brooklyn_nine_nine_AND_vikings_at_1952(true) -> write('\nRes   = true');write('\nRes   = false')).
?- brooklyn_nine_nine_AND_vikings_aux().

