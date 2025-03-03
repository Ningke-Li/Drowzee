:- include('database.pl').
kim_possible(Start,End) :- begin('kim_possible',_,_,Start), end('kim_possible',_,_,End), Start=<End.

globally_kim_possible_during_3_5(Start,End) :- kim_possible(Start1,End1), Start is (Start1-3), End is (End1-5), Start=<End.

globally_kim_possible_during_3_5_at_2028(Res) :- setof((Start,End),globally_kim_possible_during_3_5(Start,End),AllINtervals), checkvalidity(2028,AllINtervals,Res).

check_query() :- write('Query = globally_kim_possible_during_3_5_at_2028'), (globally_kim_possible_during_3_5_at_2028(true) -> write('\nRes   = true');write('\nRes   = false')).

