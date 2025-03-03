:- include('database.pl').
green_revolution(Start,End) :- begin('green_revolution',_,_,Start), end('green_revolution',_,_,End), Start=<End.

international_military_tribunal_for_the_far_east(Start,End) :- begin('international_military_tribunal_for_the_far_east',_,_,Start), end('international_military_tribunal_for_the_far_east',_,_,End), Start=<End.

green_revolution_last_till_4_12(Start,End) :- green_revolution(Start1,End1), (End1-Start1)>=4, Start is (Start1+4), End is (End1+1).

green_revolution_until_international_military_tribunal_for_the_far_east_during_4_12_overlap(Start,End) :- green_revolution_last_till_4_12(Start1,End1), international_military_tribunal_for_the_far_east(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

green_revolution_until_international_military_tribunal_for_the_far_east_during_4_12(Start,End) :- green_revolution(W1,_), green_revolution_until_international_military_tribunal_for_the_far_east_during_4_12_overlap(Start1,End1), Start is max((Start1-12),W1), End is (End1-4), Start=<End.

green_revolution_until_international_military_tribunal_for_the_far_east_during_4_12_at_1921(Res) :- setof((Start,End),green_revolution_until_international_military_tribunal_for_the_far_east_during_4_12(Start,End),AllINtervals), checkvalidity(1921,AllINtervals,Res).

check_query() :- write('Query = green_revolution_until_international_military_tribunal_for_the_far_east_during_4_12_at_1921'), (green_revolution_until_international_military_tribunal_for_the_far_east_during_4_12_at_1921(true) -> write('\nRes   = true');write('\nRes   = false')).

