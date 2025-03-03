:- include('database.pl').
malcolm_in_the_middle(Start,End) :- begin('malcolm_in_the_middle',_,_,Start), end('malcolm_in_the_middle',_,_,End), Start=<End.

little_britain(Start,End) :- begin('little_britain',_,_,Start), end('little_britain',_,_,End), Start=<End.

malcolm_in_the_middle_last_till_2_10(Start,End) :- malcolm_in_the_middle(Start1,End1), (End1-Start1)>=2, Start is (Start1+2), End is (End1+1).

malcolm_in_the_middle_until_little_britain_during_2_10_overlap(Start,End) :- malcolm_in_the_middle_last_till_2_10(Start1,End1), little_britain(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

malcolm_in_the_middle_until_little_britain_during_2_10(Start,End) :- malcolm_in_the_middle(W1,_), malcolm_in_the_middle_until_little_britain_during_2_10_overlap(Start1,End1), Start is max((Start1-10),W1), End is (End1-2), Start=<End.

malcolm_in_the_middle_until_little_britain_during_2_10_at_2025(Res) :- setof((Start,End),malcolm_in_the_middle_until_little_britain_during_2_10(Start,End),AllINtervals), checkvalidity(2025,AllINtervals,Res).

check_query() :- write('Query = malcolm_in_the_middle_until_little_britain_during_2_10_at_2025'), (malcolm_in_the_middle_until_little_britain_during_2_10_at_2025(true) -> write('\nRes   = true');write('\nRes   = false')).

