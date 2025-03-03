:- include('database.pl').
prison_break(Start,End) :- begin('prison_break',_,_,Start), end('prison_break',_,_,End), Start=<End.

the_originals(Start,End) :- begin('the_originals',_,_,Start), end('the_originals',_,_,End), Start=<End.

prison_break_last_till_5_13(Start,End) :- prison_break(Start1,End1), (End1-Start1)>=5, Start is (Start1+5), End is (End1+1).

prison_break_until_the_originals_during_5_13_overlap(Start,End) :- prison_break_last_till_5_13(Start1,End1), the_originals(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

prison_break_until_the_originals_during_5_13(Start,End) :- prison_break(W1,_), prison_break_until_the_originals_during_5_13_overlap(Start1,End1), Start is max((Start1-13),W1), End is (End1-5), Start=<End.

prison_break_until_the_originals_during_5_13_at_2005(Res) :- setof((Start,End),prison_break_until_the_originals_during_5_13(Start,End),AllINtervals), checkvalidity(2005,AllINtervals,Res).

check_query() :- write('Query = prison_break_until_the_originals_during_5_13_at_2005'), (prison_break_until_the_originals_during_5_13_at_2005(true) -> write('\nRes   = true');write('\nRes   = false')).

