:- include('database.pl').
supernatural(Start,End) :- begin('supernatural',_,_,Start), end('supernatural',_,_,End), Start=<End.

the_penguins_of_madagascar(Start,End) :- begin('the_penguins_of_madagascar',_,_,Start), end('the_penguins_of_madagascar',_,_,End), Start=<End.

supernatural_last_till_2_4(Start,End) :- supernatural(Start1,End1), (End1-Start1)>=2, Start is (Start1+2), End is (End1+1).

supernatural_until_the_penguins_of_madagascar_during_2_4_overlap(Start,End) :- supernatural_last_till_2_4(Start1,End1), the_penguins_of_madagascar(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

supernatural_until_the_penguins_of_madagascar_during_2_4(Start,End) :- supernatural(W1,_), supernatural_until_the_penguins_of_madagascar_during_2_4_overlap(Start1,End1), Start is max((Start1-4),W1), End is (End1-2), Start=<End.

supernatural_until_the_penguins_of_madagascar_during_2_4_at_2041(Res) :- setof((Start,End),supernatural_until_the_penguins_of_madagascar_during_2_4(Start,End),AllINtervals), checkvalidity(2041,AllINtervals,Res).

check_query() :- write('Query = supernatural_until_the_penguins_of_madagascar_during_2_4_at_2041'), (supernatural_until_the_penguins_of_madagascar_during_2_4_at_2041(true) -> write('\nRes   = true');write('\nRes   = false')).

