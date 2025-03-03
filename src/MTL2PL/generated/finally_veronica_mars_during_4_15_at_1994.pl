:- include('database.pl').
veronica_mars(Start,End) :- begin('veronica_mars',_,_,Start), end('veronica_mars',_,_,End), Start=<End.

finally_veronica_mars_during_4_15(Start,End) :- veronica_mars(Start1,End1), (Start1-15)=<(End1-4), Start is (Start1-15), End is (End1-4), Start=<End.

finally_veronica_mars_during_4_15_at_1994(Res) :- setof((Start,End),finally_veronica_mars_during_4_15(Start,End),AllINtervals), checkvalidity(1994,AllINtervals,Res).

check_query() :- write('Query = finally_veronica_mars_during_4_15_at_1994'), (finally_veronica_mars_during_4_15_at_1994(true) -> write('\nRes   = true');write('\nRes   = false')).

