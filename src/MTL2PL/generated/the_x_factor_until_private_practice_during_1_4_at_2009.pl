:- include('database.pl').
the_x_factor(Start,End) :- begin('the_x_factor',_,_,Start), end('the_x_factor',_,_,End), Start=<End.

private_practice(Start,End) :- begin('private_practice',_,_,Start), end('private_practice',_,_,End), Start=<End.

the_x_factor_last_till_1_4(Start,End) :- the_x_factor(Start1,End1), (End1-Start1)>=1, Start is (Start1+1), End is (End1+1).

the_x_factor_until_private_practice_during_1_4_overlap(Start,End) :- the_x_factor_last_till_1_4(Start1,End1), private_practice(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

the_x_factor_until_private_practice_during_1_4(Start,End) :- the_x_factor(W1,_), the_x_factor_until_private_practice_during_1_4_overlap(Start1,End1), Start is max((Start1-4),W1), End is (End1-1), Start=<End.

the_x_factor_until_private_practice_during_1_4_at_2009(Res) :- setof((Start,End),the_x_factor_until_private_practice_during_1_4(Start,End),AllINtervals), checkvalidity(2009,AllINtervals,Res).

check_query() :- write('Query = the_x_factor_until_private_practice_during_1_4_at_2009'), (the_x_factor_until_private_practice_during_1_4_at_2009(true) -> write('\nRes   = true');write('\nRes   = false')).

