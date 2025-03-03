:- include('database.pl').
boston_legal(Start,End) :- begin('boston_legal',_,_,Start), end('boston_legal',_,_,End), Start=<End.

globally_boston_legal_during_2_3(Start,End) :- boston_legal(Start1,End1), Start is (Start1-2), End is (End1-3), Start=<End.

next_globally_boston_legal_during_2_3(Start,End) :- globally_boston_legal_during_2_3(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_boston_legal_during_2_3_at_2001(Res) :- setof((Start,End),next_globally_boston_legal_during_2_3(Start,End),AllINtervals), checkvalidity(2001,AllINtervals,Res).

check_query() :- write('Query = next_globally_boston_legal_during_2_3_at_2001'), (next_globally_boston_legal_during_2_3_at_2001(true) -> write('\nRes   = true');write('\nRes   = false')).

