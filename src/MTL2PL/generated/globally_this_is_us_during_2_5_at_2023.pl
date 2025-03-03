:- include('database.pl').
this_is_us(Start,End) :- begin('this_is_us',_,_,Start), end('this_is_us',_,_,End), Start=<End.

globally_this_is_us_during_2_5(Start,End) :- this_is_us(Start1,End1), Start is (Start1-2), End is (End1-5), Start=<End.

globally_this_is_us_during_2_5_at_2023(Res) :- setof((Start,End),globally_this_is_us_during_2_5(Start,End),AllINtervals), checkvalidity(2023,AllINtervals,Res).

check_query() :- write('Query = globally_this_is_us_during_2_5_at_2023'), (globally_this_is_us_during_2_5_at_2023(true) -> write('\nRes   = true');write('\nRes   = false')).

