:- include('database.pl').
jean_antoine_watteau(Start,End) :- begin('jean_antoine_watteau',_,_,Start), end('jean_antoine_watteau',_,_,End), Start=<End.

finally_jean_antoine_watteau_during_4_18(Start,End) :- jean_antoine_watteau(Start1,End1), (Start1-18)=<(End1-4), Start is (Start1-18), End is (End1-4), Start=<End.

globally_finally_jean_antoine_watteau_during_4_18_during_16_39(Start,End) :- finally_jean_antoine_watteau_during_4_18(Start1,End1), Start is (Start1-16), End is (End1-39), Start=<End.

globally_finally_jean_antoine_watteau_during_4_18_during_16_39_at_1675(Res) :- setof((Start,End),globally_finally_jean_antoine_watteau_during_4_18_during_16_39(Start,End),AllINtervals), checkvalidity(1675,AllINtervals,Res).

check_query() :- write('Query = globally_finally_jean_antoine_watteau_during_4_18_during_16_39_at_1675'), (globally_finally_jean_antoine_watteau_during_4_18_during_16_39_at_1675(true) -> write('\nRes   = true');write('\nRes   = false')).

