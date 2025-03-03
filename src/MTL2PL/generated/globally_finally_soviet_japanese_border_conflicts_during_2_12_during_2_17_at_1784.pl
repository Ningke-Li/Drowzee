:- include('database.pl').
soviet_japanese_border_conflicts(Start,End) :- begin('soviet_japanese_border_conflicts',_,_,Start), end('soviet_japanese_border_conflicts',_,_,End), Start=<End.

finally_soviet_japanese_border_conflicts_during_2_12(Start,End) :- soviet_japanese_border_conflicts(Start1,End1), (Start1-12)=<(End1-2), Start is (Start1-12), End is (End1-2), Start=<End.

globally_finally_soviet_japanese_border_conflicts_during_2_12_during_2_17(Start,End) :- finally_soviet_japanese_border_conflicts_during_2_12(Start1,End1), Start is (Start1-2), End is (End1-17), Start=<End.

globally_finally_soviet_japanese_border_conflicts_during_2_12_during_2_17_at_1784(Res) :- setof((Start,End),globally_finally_soviet_japanese_border_conflicts_during_2_12_during_2_17(Start,End),AllINtervals), checkvalidity(1784,AllINtervals,Res).

check_query() :- write('Query = globally_finally_soviet_japanese_border_conflicts_during_2_12_during_2_17_at_1784'), (globally_finally_soviet_japanese_border_conflicts_during_2_12_during_2_17_at_1784(true) -> write('\nRes   = true');write('\nRes   = false')).

