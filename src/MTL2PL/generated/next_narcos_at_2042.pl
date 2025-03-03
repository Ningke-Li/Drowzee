:- include('database.pl').
narcos(Start,End) :- begin('narcos',_,_,Start), end('narcos',_,_,End), Start=<End.

next_narcos(Start,End) :- narcos(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_narcos_at_2042(Res) :- setof((Start,End),next_narcos(Start,End),AllINtervals), checkvalidity(2042,AllINtervals,Res).

check_query() :- write('Query = next_narcos_at_2042'), (next_narcos_at_2042(true) -> write('\nRes   = true');write('\nRes   = false')).

