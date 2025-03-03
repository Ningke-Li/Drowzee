:- include('database.pl').
mau_mau_uprising(Start,End) :- begin('mau_mau_uprising',_,_,Start), end('mau_mau_uprising',_,_,End), Start=<End.

globally_mau_mau_uprising_during_2_7(Start,End) :- mau_mau_uprising(Start1,End1), Start is (Start1-2), End is (End1-7), Start=<End.

next_globally_mau_mau_uprising_during_2_7(Start,End) :- globally_mau_mau_uprising_during_2_7(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_mau_mau_uprising_during_2_7_at_1981(Res) :- setof((Start,End),next_globally_mau_mau_uprising_during_2_7(Start,End),AllINtervals), checkvalidity(1981,AllINtervals,Res).

check_query() :- write('Query = next_globally_mau_mau_uprising_during_2_7_at_1981'), (next_globally_mau_mau_uprising_during_2_7_at_1981(true) -> write('\nRes   = true');write('\nRes   = false')).

