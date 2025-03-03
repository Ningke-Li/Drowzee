:- include('database.pl').
veronica_mars(Start,End) :- begin('veronica_mars',_,_,Start), end('veronica_mars',_,_,End), Start=<End.

wizards_of_waverly_place(Start,End) :- begin('wizards_of_waverly_place',_,_,Start), end('wizards_of_waverly_place',_,_,End), Start=<End.

veronica_mars_last_till_2_10(Start,End) :- veronica_mars(Start1,End1), (End1-Start1)>=2, Start is (Start1+2), End is (End1+1).

veronica_mars_until_wizards_of_waverly_place_during_2_10_overlap(Start,End) :- veronica_mars_last_till_2_10(Start1,End1), wizards_of_waverly_place(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

veronica_mars_until_wizards_of_waverly_place_during_2_10(Start,End) :- veronica_mars(W1,_), veronica_mars_until_wizards_of_waverly_place_during_2_10_overlap(Start1,End1), Start is max((Start1-10),W1), End is (End1-2), Start=<End.

veronica_mars_until_wizards_of_waverly_place_during_2_10_at_2008(Res) :- setof((Start,End),veronica_mars_until_wizards_of_waverly_place_during_2_10(Start,End),AllINtervals), checkvalidity(2008,AllINtervals,Res).

check_query() :- write('Query = veronica_mars_until_wizards_of_waverly_place_during_2_10_at_2008'), (veronica_mars_until_wizards_of_waverly_place_during_2_10_at_2008(true) -> write('\nRes   = true');write('\nRes   = false')).

