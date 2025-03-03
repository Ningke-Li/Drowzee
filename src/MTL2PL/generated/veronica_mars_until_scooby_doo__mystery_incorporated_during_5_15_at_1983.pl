:- include('database.pl').
veronica_mars(Start,End) :- begin('veronica_mars',_,_,Start), end('veronica_mars',_,_,End), Start=<End.

scooby_doo__mystery_incorporated(Start,End) :- begin('scooby_doo__mystery_incorporated',_,_,Start), end('scooby_doo__mystery_incorporated',_,_,End), Start=<End.

veronica_mars_last_till_5_15(Start,End) :- veronica_mars(Start1,End1), (End1-Start1)>=5, Start is (Start1+5), End is (End1+1).

veronica_mars_until_scooby_doo__mystery_incorporated_during_5_15_overlap(Start,End) :- veronica_mars_last_till_5_15(Start1,End1), scooby_doo__mystery_incorporated(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

veronica_mars_until_scooby_doo__mystery_incorporated_during_5_15(Start,End) :- veronica_mars(W1,_), veronica_mars_until_scooby_doo__mystery_incorporated_during_5_15_overlap(Start1,End1), Start is max((Start1-15),W1), End is (End1-5), Start=<End.

veronica_mars_until_scooby_doo__mystery_incorporated_during_5_15_at_1983(Res) :- setof((Start,End),veronica_mars_until_scooby_doo__mystery_incorporated_during_5_15(Start,End),AllINtervals), checkvalidity(1983,AllINtervals,Res).

check_query() :- write('Query = veronica_mars_until_scooby_doo__mystery_incorporated_during_5_15_at_1983'), (veronica_mars_until_scooby_doo__mystery_incorporated_during_5_15_at_1983(true) -> write('\nRes   = true');write('\nRes   = false')).

