:- include('database.pl').
the_it_crowd(Start,End) :- begin('the_it_crowd',_,_,Start), end('the_it_crowd',_,_,End), Start=<End.

modern_family(Start,End) :- begin('modern_family',_,_,Start), end('modern_family',_,_,End), Start=<End.

the_it_crowd_last_till_2_9(Start,End) :- the_it_crowd(Start1,End1), (End1-Start1)>=2, Start is (Start1+2), End is (End1+1).

the_it_crowd_until_modern_family_during_2_9_overlap(Start,End) :- the_it_crowd_last_till_2_9(Start1,End1), modern_family(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

the_it_crowd_until_modern_family_during_2_9(Start,End) :- the_it_crowd(W1,_), the_it_crowd_until_modern_family_during_2_9_overlap(Start1,End1), Start is max((Start1-9),W1), End is (End1-2), Start=<End.

the_it_crowd_until_modern_family_during_2_9_at_2023(Res) :- setof((Start,End),the_it_crowd_until_modern_family_during_2_9(Start,End),AllINtervals), checkvalidity(2023,AllINtervals,Res).

check_query() :- write('Query = the_it_crowd_until_modern_family_during_2_9_at_2023'), (the_it_crowd_until_modern_family_during_2_9_at_2023(true) -> write('\nRes   = true');write('\nRes   = false')).

