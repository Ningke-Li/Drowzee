:- include('database.pl').
baby_boomers(Start,End) :- begin('baby_boomers',_,_,Start), end('baby_boomers',_,_,End), Start=<End.

finally_baby_boomers_during_2_18(Start,End) :- baby_boomers(Start1,End1), (Start1-18)=<(End1-2), Start is (Start1-18), End is (End1-2), Start=<End.

globally_finally_baby_boomers_during_2_18_during_6_32(Start,End) :- finally_baby_boomers_during_2_18(Start1,End1), Start is (Start1-6), End is (End1-32), Start=<End.

globally_finally_baby_boomers_during_2_18_during_6_32_at_1891(Res) :- setof((Start,End),globally_finally_baby_boomers_during_2_18_during_6_32(Start,End),AllINtervals), checkvalidity(1891,AllINtervals,Res).

check_query() :- write('Query = globally_finally_baby_boomers_during_2_18_during_6_32_at_1891'), (globally_finally_baby_boomers_during_2_18_during_6_32_at_1891(true) -> write('\nRes   = true');write('\nRes   = false')).

