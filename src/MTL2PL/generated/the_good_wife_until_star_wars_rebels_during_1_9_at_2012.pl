:- include('database.pl').
the_good_wife(Start,End) :- begin('the_good_wife',_,_,Start), end('the_good_wife',_,_,End), Start=<End.

star_wars_rebels(Start,End) :- begin('star_wars_rebels',_,_,Start), end('star_wars_rebels',_,_,End), Start=<End.

the_good_wife_last_till_1_9(Start,End) :- the_good_wife(Start1,End1), (End1-Start1)>=1, Start is (Start1+1), End is (End1+1).

the_good_wife_until_star_wars_rebels_during_1_9_overlap(Start,End) :- the_good_wife_last_till_1_9(Start1,End1), star_wars_rebels(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

the_good_wife_until_star_wars_rebels_during_1_9(Start,End) :- the_good_wife(W1,_), the_good_wife_until_star_wars_rebels_during_1_9_overlap(Start1,End1), Start is max((Start1-9),W1), End is (End1-1), Start=<End.

the_good_wife_until_star_wars_rebels_during_1_9_at_2012(Res) :- setof((Start,End),the_good_wife_until_star_wars_rebels_during_1_9(Start,End),AllINtervals), checkvalidity(2012,AllINtervals,Res).

check_query() :- write('Query = the_good_wife_until_star_wars_rebels_during_1_9_at_2012'), (the_good_wife_until_star_wars_rebels_during_1_9_at_2012(true) -> write('\nRes   = true');write('\nRes   = false')).

