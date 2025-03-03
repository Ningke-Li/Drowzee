:- include('database.pl').
a_n_t__farm(Start,End) :- begin('a_n_t__farm',_,_,Start), end('a_n_t__farm',_,_,End), Start=<End.

next_a_n_t__farm(Start,End) :- a_n_t__farm(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_a_n_t__farm_at_2012(Res) :- setof((Start,End),next_a_n_t__farm(Start,End),AllINtervals), checkvalidity(2012,AllINtervals,Res).

check_query() :- write('Query = next_a_n_t__farm_at_2012'), (next_a_n_t__farm_at_2012(true) -> write('\nRes   = true');write('\nRes   = false')).

