:- include('database.pl').
reign(Start,End) :- begin('reign',_,_,Start), end('reign',_,_,End), Start=<End.

globally_reign_during_3_4(Start,End) :- reign(Start1,End1), Start is (Start1-3), End is (End1-4), Start=<End.

globally_reign_during_3_4_at_1984(Res) :- setof((Start,End),globally_reign_during_3_4(Start,End),AllINtervals), checkvalidity(1984,AllINtervals,Res).

check_query() :- write('Query = globally_reign_during_3_4_at_1984'), (globally_reign_during_3_4_at_1984(true) -> write('\nRes   = true');write('\nRes   = false')).

