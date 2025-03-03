:- include('database.pl').
how_to_get_away_with_murder(Start,End) :- begin('how_to_get_away_with_murder',_,_,Start), end('how_to_get_away_with_murder',_,_,End), Start=<End.

finally_how_to_get_away_with_murder_during_2_11(Start,End) :- how_to_get_away_with_murder(Start1,End1), (Start1-11)=<(End1-2), Start is (Start1-11), End is (End1-2), Start=<End.

globally_finally_how_to_get_away_with_murder_during_2_11_during_7_12(Start,End) :- finally_how_to_get_away_with_murder_during_2_11(Start1,End1), Start is (Start1-7), End is (End1-12), Start=<End.

globally_finally_how_to_get_away_with_murder_during_2_11_during_7_12_at_1999(Res) :- setof((Start,End),globally_finally_how_to_get_away_with_murder_during_2_11_during_7_12(Start,End),AllINtervals), checkvalidity(1999,AllINtervals,Res).

check_query() :- write('Query = globally_finally_how_to_get_away_with_murder_during_2_11_during_7_12_at_1999'), (globally_finally_how_to_get_away_with_murder_during_2_11_during_7_12_at_1999(true) -> write('\nRes   = true');write('\nRes   = false')).

