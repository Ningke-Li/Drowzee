:- include('database.pl').
the_it_crowd(Start,End) :- begin('the_it_crowd',_,_,Start), end('the_it_crowd',_,_,End), Start=<End.

regular_show(Start,End) :- begin('regular_show',_,_,Start), end('regular_show',_,_,End), Start=<End.

the_it_crowd_last_till_2_8(Start,End) :- the_it_crowd(Start1,End1), (End1-Start1)>=2, Start is (Start1+2), End is (End1+1).

the_it_crowd_until_regular_show_during_2_8_overlap(Start,End) :- the_it_crowd_last_till_2_8(Start1,End1), regular_show(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

the_it_crowd_until_regular_show_during_2_8(Start,End) :- the_it_crowd(W1,_), the_it_crowd_until_regular_show_during_2_8_overlap(Start1,End1), Start is max((Start1-8),W1), End is (End1-2), Start=<End.

the_it_crowd_until_regular_show_during_2_8_at_1958(Res) :- setof((Start,End),the_it_crowd_until_regular_show_during_2_8(Start,End),AllINtervals), checkvalidity(1958,AllINtervals,Res).

check_query() :- write('Query = the_it_crowd_until_regular_show_during_2_8_at_1958'), (the_it_crowd_until_regular_show_during_2_8_at_1958(true) -> write('\nRes   = true');write('\nRes   = false')).

