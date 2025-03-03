:- include('database.pl').
scrubs(Start,End) :- begin('scrubs',_,_,Start), end('scrubs',_,_,End), Start=<End.

numbers(Start,End) :- begin('numbers',_,_,Start), end('numbers',_,_,End), Start=<End.

scrubs_last_till_3_10(Start,End) :- scrubs(Start1,End1), (End1-Start1)>=3, Start is (Start1+3), End is (End1+1).

scrubs_until_numbers_during_3_10_overlap(Start,End) :- scrubs_last_till_3_10(Start1,End1), numbers(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

scrubs_until_numbers_during_3_10(Start,End) :- scrubs(W1,_), scrubs_until_numbers_during_3_10_overlap(Start1,End1), Start is max((Start1-10),W1), End is (End1-3), Start=<End.

scrubs_until_numbers_during_3_10_at_2002(Res) :- setof((Start,End),scrubs_until_numbers_during_3_10(Start,End),AllINtervals), checkvalidity(2002,AllINtervals,Res).

check_query() :- write('Query = scrubs_until_numbers_during_3_10_at_2002'), (scrubs_until_numbers_during_3_10_at_2002(true) -> write('\nRes   = true');write('\nRes   = false')).

