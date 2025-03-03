:- include('database.pl').
famine_in_kazakhstan_of_1932_33(Start,End) :- begin('famine_in_kazakhstan_of_1932_33',_,_,Start), end('famine_in_kazakhstan_of_1932_33',_,_,End), Start=<End.

globally_famine_in_kazakhstan_of_1932_33_during_1_3(Start,End) :- famine_in_kazakhstan_of_1932_33(Start1,End1), Start is (Start1-1), End is (End1-3), Start=<End.

finally_globally_famine_in_kazakhstan_of_1932_33_during_1_3_during_10_15(Start,End) :- globally_famine_in_kazakhstan_of_1932_33_during_1_3(Start1,End1), (Start1-15)=<(End1-10), Start is (Start1-15), End is (End1-10), Start=<End.

finally_globally_famine_in_kazakhstan_of_1932_33_during_1_3_during_10_15_at_1919(Res) :- setof((Start,End),finally_globally_famine_in_kazakhstan_of_1932_33_during_1_3_during_10_15(Start,End),AllINtervals), checkvalidity(1919,AllINtervals,Res).

check_query() :- write('Query = finally_globally_famine_in_kazakhstan_of_1932_33_during_1_3_during_10_15_at_1919'), (finally_globally_famine_in_kazakhstan_of_1932_33_during_1_3_during_10_15_at_1919(true) -> write('\nRes   = true');write('\nRes   = false')).

