:- include('database.pl').
reign(Start,End) :- begin('reign',_,_,Start), end('reign',_,_,End), Start=<End.

next_reign(Start,End) :- reign(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_reign_at_2012(Res) :- setof((Start,End),next_reign(Start,End),AllINtervals), checkvalidity(2012,AllINtervals,Res).

check_query() :- write('Query = next_reign_at_2012'), (next_reign_at_2012(true) -> write('\nRes   = true');write('\nRes   = false')).

