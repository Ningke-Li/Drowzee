:- include('database.pl').
occupation_of_the_ruhr(Start,End) :- begin('occupation_of_the_ruhr',_,_,Start), end('occupation_of_the_ruhr',_,_,End), Start=<End.

next_occupation_of_the_ruhr(Start,End) :- occupation_of_the_ruhr(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_occupation_of_the_ruhr_at_1865(Res) :- setof((Start,End),next_occupation_of_the_ruhr(Start,End),AllINtervals), checkvalidity(1865,AllINtervals,Res).

check_query() :- write('Query = next_occupation_of_the_ruhr_at_1865'), (next_occupation_of_the_ruhr_at_1865(true) -> write('\nRes   = true');write('\nRes   = false')).

