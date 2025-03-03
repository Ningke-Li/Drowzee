:- include('database.pl').
desperate_housewives(Start,End) :- begin('desperate_housewives',_,_,Start), end('desperate_housewives',_,_,End), Start=<End.

next_desperate_housewives(Start,End) :- desperate_housewives(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_desperate_housewives_at_2008(Res) :- setof((Start,End),next_desperate_housewives(Start,End),AllINtervals), checkvalidity(2008,AllINtervals,Res).

check_query() :- write('Query = next_desperate_housewives_at_2008'), (next_desperate_housewives_at_2008(true) -> write('\nRes   = true');write('\nRes   = false')).

