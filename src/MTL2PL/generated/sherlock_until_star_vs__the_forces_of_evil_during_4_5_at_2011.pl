:- include('database.pl').
sherlock(Start,End) :- begin('sherlock',_,_,Start), end('sherlock',_,_,End), Start=<End.

star_vs__the_forces_of_evil(Start,End) :- begin('star_vs__the_forces_of_evil',_,_,Start), end('star_vs__the_forces_of_evil',_,_,End), Start=<End.

sherlock_last_till_4_5(Start,End) :- sherlock(Start1,End1), (End1-Start1)>=4, Start is (Start1+4), End is (End1+1).

sherlock_until_star_vs__the_forces_of_evil_during_4_5_overlap(Start,End) :- sherlock_last_till_4_5(Start1,End1), star_vs__the_forces_of_evil(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

sherlock_until_star_vs__the_forces_of_evil_during_4_5(Start,End) :- sherlock(W1,_), sherlock_until_star_vs__the_forces_of_evil_during_4_5_overlap(Start1,End1), Start is max((Start1-5),W1), End is (End1-4), Start=<End.

sherlock_until_star_vs__the_forces_of_evil_during_4_5_at_2011(Res) :- setof((Start,End),sherlock_until_star_vs__the_forces_of_evil_during_4_5(Start,End),AllINtervals), checkvalidity(2011,AllINtervals,Res).

check_query() :- write('Query = sherlock_until_star_vs__the_forces_of_evil_during_4_5_at_2011'), (sherlock_until_star_vs__the_forces_of_evil_during_4_5_at_2011(true) -> write('\nRes   = true');write('\nRes   = false')).

