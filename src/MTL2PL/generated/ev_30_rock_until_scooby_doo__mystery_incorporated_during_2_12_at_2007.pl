:- include('database.pl').
ev_30_rock(Start,End) :- begin('ev_30_rock',_,_,Start), end('ev_30_rock',_,_,End), Start=<End.

scooby_doo__mystery_incorporated(Start,End) :- begin('scooby_doo__mystery_incorporated',_,_,Start), end('scooby_doo__mystery_incorporated',_,_,End), Start=<End.

ev_30_rock_last_till_2_12(Start,End) :- ev_30_rock(Start1,End1), (End1-Start1)>=2, Start is (Start1+2), End is (End1+1).

ev_30_rock_until_scooby_doo__mystery_incorporated_during_2_12_overlap(Start,End) :- ev_30_rock_last_till_2_12(Start1,End1), scooby_doo__mystery_incorporated(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

ev_30_rock_until_scooby_doo__mystery_incorporated_during_2_12(Start,End) :- ev_30_rock(W1,_), ev_30_rock_until_scooby_doo__mystery_incorporated_during_2_12_overlap(Start1,End1), Start is max((Start1-12),W1), End is (End1-2), Start=<End.

ev_30_rock_until_scooby_doo__mystery_incorporated_during_2_12_at_2007(Res) :- setof((Start,End),ev_30_rock_until_scooby_doo__mystery_incorporated_during_2_12(Start,End),AllINtervals), checkvalidity(2007,AllINtervals,Res).

check_query() :- write('Query = ev_30_rock_until_scooby_doo__mystery_incorporated_during_2_12_at_2007'), (ev_30_rock_until_scooby_doo__mystery_incorporated_during_2_12_at_2007(true) -> write('\nRes   = true');write('\nRes   = false')).

