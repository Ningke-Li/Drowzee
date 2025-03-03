:- include('database.pl').
foster_s_home_for_imaginary_friends(Start,End) :- begin('foster_s_home_for_imaginary_friends',_,_,Start), end('foster_s_home_for_imaginary_friends',_,_,End), Start=<End.

globally_foster_s_home_for_imaginary_friends_during_3_4(Start,End) :- foster_s_home_for_imaginary_friends(Start1,End1), Start is (Start1-3), End is (End1-4), Start=<End.

globally_foster_s_home_for_imaginary_friends_during_3_4_at_2002(Res) :- setof((Start,End),globally_foster_s_home_for_imaginary_friends_during_3_4(Start,End),AllINtervals), checkvalidity(2002,AllINtervals,Res).

check_query() :- write('Query = globally_foster_s_home_for_imaginary_friends_during_3_4_at_2002'), (globally_foster_s_home_for_imaginary_friends_during_3_4_at_2002(true) -> write('\nRes   = true');write('\nRes   = false')).

