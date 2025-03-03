:- include('database.pl').
soviet_japanese_border_conflicts(Start,End) :- begin('soviet_japanese_border_conflicts',_,_,Start), end('soviet_japanese_border_conflicts',_,_,End), Start=<End.

globally_soviet_japanese_border_conflicts_during_3_7(Start,End) :- soviet_japanese_border_conflicts(Start1,End1), Start is (Start1-3), End is (End1-7), Start=<End.

globally_soviet_japanese_border_conflicts_during_3_7_at_1929(Res) :- setof((Start,End),globally_soviet_japanese_border_conflicts_during_3_7(Start,End),AllINtervals), checkvalidity(1929,AllINtervals,Res).

check_query() :- write('Query = globally_soviet_japanese_border_conflicts_during_3_7_at_1929'), (globally_soviet_japanese_border_conflicts_during_3_7_at_1929(true) -> write('\nRes   = true');write('\nRes   = false')).

