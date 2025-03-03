:- include('database.pl').
everybody_hates_chris(Start,End) :- begin('everybody_hates_chris',_,_,Start), end('everybody_hates_chris',_,_,End), Start=<End.

globally_everybody_hates_chris_during_1_4(Start,End) :- everybody_hates_chris(Start1,End1), Start is (Start1-1), End is (End1-4), Start=<End.

globally_everybody_hates_chris_during_1_4_at_2033(Res) :- setof((Start,End),globally_everybody_hates_chris_during_1_4(Start,End),AllINtervals), checkvalidity(2033,AllINtervals,Res).

check_query() :- write('Query = globally_everybody_hates_chris_during_1_4_at_2033'), (globally_everybody_hates_chris_during_1_4_at_2033(true) -> write('\nRes   = true');write('\nRes   = false')).

