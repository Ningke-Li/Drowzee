:- include('database.pl').
hannah_montana(Start,End) :- begin('hannah_montana',_,_,Start), end('hannah_montana',_,_,End), Start=<End.

next_hannah_montana(Start,End) :- hannah_montana(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_hannah_montana_at_2006(Res) :- setof((Start,End),next_hannah_montana(Start,End),AllINtervals), checkvalidity(2006,AllINtervals,Res).

check_query() :- write('Query = next_hannah_montana_at_2006'), (next_hannah_montana_at_2006(true) -> write('\nRes   = true');write('\nRes   = false')).

