:- include('database.pl').
everybody_hates_chris(Start,End) :- begin('everybody_hates_chris',_,_,Start), end('everybody_hates_chris',_,_,End), Start=<End.

next_everybody_hates_chris(Start,End) :- everybody_hates_chris(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_everybody_hates_chris_at_1876(Res) :- setof((Start,End),next_everybody_hates_chris(Start,End),AllINtervals), checkvalidity(1876,AllINtervals,Res).

check_query() :- write('Query = next_everybody_hates_chris_at_1876'), (next_everybody_hates_chris_at_1876(true) -> write('\nRes   = true');write('\nRes   = false')).

