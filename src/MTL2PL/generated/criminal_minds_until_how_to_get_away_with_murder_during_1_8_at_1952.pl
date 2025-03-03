:- include('database.pl').
criminal_minds(Start,End) :- begin('criminal_minds',_,_,Start), end('criminal_minds',_,_,End), Start=<End.

how_to_get_away_with_murder(Start,End) :- begin('how_to_get_away_with_murder',_,_,Start), end('how_to_get_away_with_murder',_,_,End), Start=<End.

criminal_minds_last_till_1_8(Start,End) :- criminal_minds(Start1,End1), (End1-Start1)>=1, Start is (Start1+1), End is (End1+1).

criminal_minds_until_how_to_get_away_with_murder_during_1_8_overlap(Start,End) :- criminal_minds_last_till_1_8(Start1,End1), how_to_get_away_with_murder(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

criminal_minds_until_how_to_get_away_with_murder_during_1_8(Start,End) :- criminal_minds(W1,_), criminal_minds_until_how_to_get_away_with_murder_during_1_8_overlap(Start1,End1), Start is max((Start1-8),W1), End is (End1-1), Start=<End.

criminal_minds_until_how_to_get_away_with_murder_during_1_8_at_1952(Res) :- setof((Start,End),criminal_minds_until_how_to_get_away_with_murder_during_1_8(Start,End),AllINtervals), checkvalidity(1952,AllINtervals,Res).

check_query() :- write('Query = criminal_minds_until_how_to_get_away_with_murder_during_1_8_at_1952'), (criminal_minds_until_how_to_get_away_with_murder_during_1_8_at_1952(true) -> write('\nRes   = true');write('\nRes   = false')).

