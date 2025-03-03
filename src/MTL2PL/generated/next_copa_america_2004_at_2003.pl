:- include('database.pl').
copa_america_2004(Start,End) :- begin('copa_america_2004',_,_,Start), end('copa_america_2004',_,_,End), Start=<End.

next_copa_america_2004(Start,End) :- copa_america_2004(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_copa_america_2004_at_2003(Res) :- setof((Start,End),next_copa_america_2004(Start,End),AllINtervals), checkvalidity(2003,AllINtervals,Res).

check_query() :- write('Query = next_copa_america_2004_at_2003'), (next_copa_america_2004_at_2003(true) -> write('\nRes   = true');write('\nRes   = false')).

