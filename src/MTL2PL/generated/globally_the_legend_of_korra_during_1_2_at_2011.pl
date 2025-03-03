:- include('database.pl').
the_legend_of_korra(Start,End) :- begin('the_legend_of_korra',_,_,Start), end('the_legend_of_korra',_,_,End), Start=<End.

globally_the_legend_of_korra_during_1_2(Start,End) :- the_legend_of_korra(Start1,End1), Start is (Start1-1), End is (End1-2), Start=<End.

globally_the_legend_of_korra_during_1_2_at_2011(Res) :- setof((Start,End),globally_the_legend_of_korra_during_1_2(Start,End),AllINtervals), checkvalidity(2011,AllINtervals,Res).

check_query() :- write('Query = globally_the_legend_of_korra_during_1_2_at_2011'), (globally_the_legend_of_korra_during_1_2_at_2011(true) -> write('\nRes   = true');write('\nRes   = false')).

