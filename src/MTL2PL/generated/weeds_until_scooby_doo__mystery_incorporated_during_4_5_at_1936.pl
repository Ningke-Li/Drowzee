:- include('database.pl').
weeds(Start,End) :- begin('weeds',_,_,Start), end('weeds',_,_,End), Start=<End.

scooby_doo__mystery_incorporated(Start,End) :- begin('scooby_doo__mystery_incorporated',_,_,Start), end('scooby_doo__mystery_incorporated',_,_,End), Start=<End.

weeds_last_till_4_5(Start,End) :- weeds(Start1,End1), (End1-Start1)>=4, Start is (Start1+4), End is (End1+1).

weeds_until_scooby_doo__mystery_incorporated_during_4_5_overlap(Start,End) :- weeds_last_till_4_5(Start1,End1), scooby_doo__mystery_incorporated(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

weeds_until_scooby_doo__mystery_incorporated_during_4_5(Start,End) :- weeds(W1,_), weeds_until_scooby_doo__mystery_incorporated_during_4_5_overlap(Start1,End1), Start is max((Start1-5),W1), End is (End1-4), Start=<End.

weeds_until_scooby_doo__mystery_incorporated_during_4_5_at_1936(Res) :- setof((Start,End),weeds_until_scooby_doo__mystery_incorporated_during_4_5(Start,End),AllINtervals), checkvalidity(1936,AllINtervals,Res).

check_query() :- write('Query = weeds_until_scooby_doo__mystery_incorporated_during_4_5_at_1936'), (weeds_until_scooby_doo__mystery_incorporated_during_4_5_at_1936(true) -> write('\nRes   = true');write('\nRes   = false')).

