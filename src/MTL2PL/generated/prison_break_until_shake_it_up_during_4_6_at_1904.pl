:- include('database.pl').
prison_break(Start,End) :- begin('prison_break',_,_,Start), end('prison_break',_,_,End), Start=<End.

shake_it_up(Start,End) :- begin('shake_it_up',_,_,Start), end('shake_it_up',_,_,End), Start=<End.

prison_break_last_till_4_6(Start,End) :- prison_break(Start1,End1), (End1-Start1)>=4, Start is (Start1+4), End is (End1+1).

prison_break_until_shake_it_up_during_4_6_overlap(Start,End) :- prison_break_last_till_4_6(Start1,End1), shake_it_up(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

prison_break_until_shake_it_up_during_4_6(Start,End) :- prison_break(W1,_), prison_break_until_shake_it_up_during_4_6_overlap(Start1,End1), Start is max((Start1-6),W1), End is (End1-4), Start=<End.

prison_break_until_shake_it_up_during_4_6_at_1904(Res) :- setof((Start,End),prison_break_until_shake_it_up_during_4_6(Start,End),AllINtervals), checkvalidity(1904,AllINtervals,Res).

check_query() :- write('Query = prison_break_until_shake_it_up_during_4_6_at_1904'), (prison_break_until_shake_it_up_during_4_6_at_1904(true) -> write('\nRes   = true');write('\nRes   = false')).

