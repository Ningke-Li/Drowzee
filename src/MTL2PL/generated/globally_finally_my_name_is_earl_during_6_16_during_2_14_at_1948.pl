:- include('database.pl').
my_name_is_earl(Start,End) :- begin('my_name_is_earl',_,_,Start), end('my_name_is_earl',_,_,End), Start=<End.

finally_my_name_is_earl_during_6_16(Start,End) :- my_name_is_earl(Start1,End1), (Start1-16)=<(End1-6), Start is (Start1-16), End is (End1-6), Start=<End.

globally_finally_my_name_is_earl_during_6_16_during_2_14(Start,End) :- finally_my_name_is_earl_during_6_16(Start1,End1), Start is (Start1-2), End is (End1-14), Start=<End.

globally_finally_my_name_is_earl_during_6_16_during_2_14_at_1948(Res) :- setof((Start,End),globally_finally_my_name_is_earl_during_6_16_during_2_14(Start,End),AllINtervals), checkvalidity(1948,AllINtervals,Res).

check_query() :- write('Query = globally_finally_my_name_is_earl_during_6_16_during_2_14_at_1948'), (globally_finally_my_name_is_earl_during_6_16_during_2_14_at_1948(true) -> write('\nRes   = true');write('\nRes   = false')).

