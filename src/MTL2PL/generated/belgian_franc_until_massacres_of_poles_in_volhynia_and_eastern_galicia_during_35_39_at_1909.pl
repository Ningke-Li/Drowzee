:- include('database.pl').
belgian_franc(Start,End) :- begin('belgian_franc',_,_,Start), end('belgian_franc',_,_,End), Start=<End.

massacres_of_poles_in_volhynia_and_eastern_galicia(Start,End) :- begin('massacres_of_poles_in_volhynia_and_eastern_galicia',_,_,Start), end('massacres_of_poles_in_volhynia_and_eastern_galicia',_,_,End), Start=<End.

belgian_franc_last_till_35_39(Start,End) :- belgian_franc(Start1,End1), (End1-Start1)>=35, Start is (Start1+35), End is (End1+1).

belgian_franc_until_massacres_of_poles_in_volhynia_and_eastern_galicia_during_35_39_overlap(Start,End) :- belgian_franc_last_till_35_39(Start1,End1), massacres_of_poles_in_volhynia_and_eastern_galicia(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

belgian_franc_until_massacres_of_poles_in_volhynia_and_eastern_galicia_during_35_39(Start,End) :- belgian_franc(W1,_), belgian_franc_until_massacres_of_poles_in_volhynia_and_eastern_galicia_during_35_39_overlap(Start1,End1), Start is max((Start1-39),W1), End is (End1-35), Start=<End.

belgian_franc_until_massacres_of_poles_in_volhynia_and_eastern_galicia_during_35_39_at_1909(Res) :- setof((Start,End),belgian_franc_until_massacres_of_poles_in_volhynia_and_eastern_galicia_during_35_39(Start,End),AllINtervals), checkvalidity(1909,AllINtervals,Res).

check_query() :- write('Query = belgian_franc_until_massacres_of_poles_in_volhynia_and_eastern_galicia_during_35_39_at_1909'), (belgian_franc_until_massacres_of_poles_in_volhynia_and_eastern_galicia_during_35_39_at_1909(true) -> write('\nRes   = true');write('\nRes   = false')).

