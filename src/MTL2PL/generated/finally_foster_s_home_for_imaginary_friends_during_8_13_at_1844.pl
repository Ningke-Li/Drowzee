:- include('database.pl').
foster_s_home_for_imaginary_friends(Start,End) :- begin('foster_s_home_for_imaginary_friends',_,_,Start), end('foster_s_home_for_imaginary_friends',_,_,End), Start=<End.

finally_foster_s_home_for_imaginary_friends_during_8_13(Start,End) :- foster_s_home_for_imaginary_friends(Start1,End1), (Start1-13)=<(End1-8), Start is (Start1-13), End is (End1-8), Start=<End.

finally_foster_s_home_for_imaginary_friends_during_8_13_at_1844(Res) :- setof((Start,End),finally_foster_s_home_for_imaginary_friends_during_8_13(Start,End),AllINtervals), checkvalidity(1844,AllINtervals,Res).

check_query() :- write('Query = finally_foster_s_home_for_imaginary_friends_during_8_13_at_1844'), (finally_foster_s_home_for_imaginary_friends_during_8_13_at_1844(true) -> write('\nRes   = true');write('\nRes   = false')).

