:- include('database.pl').
the_penguins_of_madagascar(Start,End) :- begin('the_penguins_of_madagascar',_,_,Start), end('the_penguins_of_madagascar',_,_,End), Start=<End.

finally_the_penguins_of_madagascar_during_5_11(Start,End) :- the_penguins_of_madagascar(Start1,End1), (Start1-11)=<(End1-5), Start is (Start1-11), End is (End1-5), Start=<End.

globally_finally_the_penguins_of_madagascar_during_5_11_during_1_4(Start,End) :- finally_the_penguins_of_madagascar_during_5_11(Start1,End1), Start is (Start1-1), End is (End1-4), Start=<End.

globally_finally_the_penguins_of_madagascar_during_5_11_during_1_4_at_2001(Res) :- setof((Start,End),globally_finally_the_penguins_of_madagascar_during_5_11_during_1_4(Start,End),AllINtervals), checkvalidity(2001,AllINtervals,Res).

check_query() :- write('Query = globally_finally_the_penguins_of_madagascar_during_5_11_during_1_4_at_2001'), (globally_finally_the_penguins_of_madagascar_during_5_11_during_1_4_at_2001(true) -> write('\nRes   = true');write('\nRes   = false')).

