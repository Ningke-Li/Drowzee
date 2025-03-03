:- include('database.pl').
veronica_mars(Start,End) :- begin('veronica_mars',_,_,Start), end('veronica_mars',_,_,End), Start=<End.

quantico(Start,End) :- begin('quantico',_,_,Start), end('quantico',_,_,End), Start=<End.

veronica_mars_last_till_3_4(Start,End) :- veronica_mars(Start1,End1), (End1-Start1)>=3, Start is (Start1+3), End is (End1+1).

veronica_mars_until_quantico_during_3_4_overlap(Start,End) :- veronica_mars_last_till_3_4(Start1,End1), quantico(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

veronica_mars_until_quantico_during_3_4(Start,End) :- veronica_mars(W1,_), veronica_mars_until_quantico_during_3_4_overlap(Start1,End1), Start is max((Start1-4),W1), End is (End1-3), Start=<End.

veronica_mars_until_quantico_during_3_4_at_2041(Res) :- setof((Start,End),veronica_mars_until_quantico_during_3_4(Start,End),AllINtervals), checkvalidity(2041,AllINtervals,Res).

check_query() :- write('Query = veronica_mars_until_quantico_during_3_4_at_2041'), (veronica_mars_until_quantico_during_3_4_at_2041(true) -> write('\nRes   = true');write('\nRes   = false')).

