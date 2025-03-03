:- include('database.pl').
veronica_mars(Start,End) :- begin('veronica_mars',_,_,Start), end('veronica_mars',_,_,End), Start=<End.

finally_veronica_mars_during_6_16(Start,End) :- veronica_mars(Start1,End1), (Start1-16)=<(End1-6), Start is (Start1-16), End is (End1-6), Start=<End.

finally_veronica_mars_during_6_16_at_1989(Res) :- setof((Start,End),finally_veronica_mars_during_6_16(Start,End),AllINtervals), checkvalidity(1989,AllINtervals,Res).

check_query() :- write('Query = finally_veronica_mars_during_6_16_at_1989'), (finally_veronica_mars_during_6_16_at_1989(true) -> write('\nRes   = true');write('\nRes   = false')).

