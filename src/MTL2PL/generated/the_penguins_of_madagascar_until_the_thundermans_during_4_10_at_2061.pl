:- include('database.pl').
the_penguins_of_madagascar(Start,End) :- begin('the_penguins_of_madagascar',_,_,Start), end('the_penguins_of_madagascar',_,_,End), Start=<End.

the_thundermans(Start,End) :- begin('the_thundermans',_,_,Start), end('the_thundermans',_,_,End), Start=<End.

the_penguins_of_madagascar_last_till_4_10(Start,End) :- the_penguins_of_madagascar(Start1,End1), (End1-Start1)>=4, Start is (Start1+4), End is (End1+1).

the_penguins_of_madagascar_until_the_thundermans_during_4_10_overlap(Start,End) :- the_penguins_of_madagascar_last_till_4_10(Start1,End1), the_thundermans(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

the_penguins_of_madagascar_until_the_thundermans_during_4_10(Start,End) :- the_penguins_of_madagascar(W1,_), the_penguins_of_madagascar_until_the_thundermans_during_4_10_overlap(Start1,End1), Start is max((Start1-10),W1), End is (End1-4), Start=<End.

the_penguins_of_madagascar_until_the_thundermans_during_4_10_at_2061(Res) :- setof((Start,End),the_penguins_of_madagascar_until_the_thundermans_during_4_10(Start,End),AllINtervals), checkvalidity(2061,AllINtervals,Res).

check_query() :- write('Query = the_penguins_of_madagascar_until_the_thundermans_during_4_10_at_2061'), (the_penguins_of_madagascar_until_the_thundermans_during_4_10_at_2061(true) -> write('\nRes   = true');write('\nRes   = false')).

