:- include('database.pl').
how_to_get_away_with_murder(Start,End) :- begin('how_to_get_away_with_murder',_,_,Start), end('how_to_get_away_with_murder',_,_,End), Start=<End.

finally_how_to_get_away_with_murder_during_4_16(Start,End) :- how_to_get_away_with_murder(Start1,End1), (Start1-16)=<(End1-4), Start is (Start1-16), End is (End1-4), Start=<End.

finally_how_to_get_away_with_murder_during_4_16_at_1895(Res) :- setof((Start,End),finally_how_to_get_away_with_murder_during_4_16(Start,End),AllINtervals), checkvalidity(1895,AllINtervals,Res).

check_query() :- write('Query = finally_how_to_get_away_with_murder_during_4_16_at_1895'), (finally_how_to_get_away_with_murder_during_4_16_at_1895(true) -> write('\nRes   = true');write('\nRes   = false')).

