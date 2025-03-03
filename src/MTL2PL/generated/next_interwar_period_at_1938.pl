:- include('database.pl').
interwar_period(Start,End) :- begin('interwar_period',_,_,Start), end('interwar_period',_,_,End), Start=<End.

next_interwar_period(Start,End) :- interwar_period(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_interwar_period_at_1938(Res) :- setof((Start,End),next_interwar_period(Start,End),AllINtervals), checkvalidity(1938,AllINtervals,Res).

check_query() :- write('Query = next_interwar_period_at_1938'), (next_interwar_period_at_1938(true) -> write('\nRes   = true');write('\nRes   = false')).

