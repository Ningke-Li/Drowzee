:- include('database.pl').
veronica_mars(Start,End) :- begin('veronica_mars',_,_,Start), end('veronica_mars',_,_,End), Start=<End.

globally_veronica_mars_during_3_8(Start,End) :- veronica_mars(Start1,End1), Start is (Start1-3), End is (End1-8), Start=<End.

finally_globally_veronica_mars_during_3_8_during_1_17(Start,End) :- globally_veronica_mars_during_3_8(Start1,End1), (Start1-17)=<(End1-1), Start is (Start1-17), End is (End1-1), Start=<End.

finally_globally_veronica_mars_during_3_8_during_1_17_at_2001(Res) :- setof((Start,End),finally_globally_veronica_mars_during_3_8_during_1_17(Start,End),AllINtervals), checkvalidity(2001,AllINtervals,Res).

check_query() :- write('Query = finally_globally_veronica_mars_during_3_8_during_1_17_at_2001'), (finally_globally_veronica_mars_during_3_8_during_1_17_at_2001(true) -> write('\nRes   = true');write('\nRes   = false')).

