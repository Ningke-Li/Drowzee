:- include('database.pl').
the_x_factor(Start,End) :- begin('the_x_factor',_,_,Start), end('the_x_factor',_,_,End), Start=<End.

icarly(Start,End) :- begin('icarly',_,_,Start), end('icarly',_,_,End), Start=<End.

the_x_factor_last_till_2_12(Start,End) :- the_x_factor(Start1,End1), (End1-Start1)>=2, Start is (Start1+2), End is (End1+1).

the_x_factor_until_icarly_during_2_12_overlap(Start,End) :- the_x_factor_last_till_2_12(Start1,End1), icarly(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

the_x_factor_until_icarly_during_2_12(Start,End) :- the_x_factor(W1,_), the_x_factor_until_icarly_during_2_12_overlap(Start1,End1), Start is max((Start1-12),W1), End is (End1-2), Start=<End.

the_x_factor_until_icarly_during_2_12_at_1966(Res) :- setof((Start,End),the_x_factor_until_icarly_during_2_12(Start,End),AllINtervals), checkvalidity(1966,AllINtervals,Res).

check_query() :- write('Query = the_x_factor_until_icarly_during_2_12_at_1966'), (the_x_factor_until_icarly_during_2_12_at_1966(true) -> write('\nRes   = true');write('\nRes   = false')).

