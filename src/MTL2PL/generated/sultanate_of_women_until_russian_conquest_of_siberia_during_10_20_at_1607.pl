:- include('database.pl').
sultanate_of_women(Start,End) :- begin('sultanate_of_women',_,_,Start), end('sultanate_of_women',_,_,End), Start=<End.

russian_conquest_of_siberia(Start,End) :- begin('russian_conquest_of_siberia',_,_,Start), end('russian_conquest_of_siberia',_,_,End), Start=<End.

sultanate_of_women_last_till_10_20(Start,End) :- sultanate_of_women(Start1,End1), (End1-Start1)>=10, Start is (Start1+10), End is (End1+1).

sultanate_of_women_until_russian_conquest_of_siberia_during_10_20_overlap(Start,End) :- sultanate_of_women_last_till_10_20(Start1,End1), russian_conquest_of_siberia(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

sultanate_of_women_until_russian_conquest_of_siberia_during_10_20(Start,End) :- sultanate_of_women(W1,_), sultanate_of_women_until_russian_conquest_of_siberia_during_10_20_overlap(Start1,End1), Start is max((Start1-20),W1), End is (End1-10), Start=<End.

sultanate_of_women_until_russian_conquest_of_siberia_during_10_20_at_1607(Res) :- setof((Start,End),sultanate_of_women_until_russian_conquest_of_siberia_during_10_20(Start,End),AllINtervals), checkvalidity(1607,AllINtervals,Res).

check_query() :- write('Query = sultanate_of_women_until_russian_conquest_of_siberia_during_10_20_at_1607'), (sultanate_of_women_until_russian_conquest_of_siberia_during_10_20_at_1607(true) -> write('\nRes   = true');write('\nRes   = false')).

