:- include('database.pl').
criminal_minds(Start,End) :- begin('criminal_minds',_,_,Start), end('criminal_minds',_,_,End), Start=<End.

globally_criminal_minds_during_2_15(Start,End) :- criminal_minds(Start1,End1), Start is (Start1-2), End is (End1-15), Start=<End.

next_globally_criminal_minds_during_2_15(Start,End) :- globally_criminal_minds_during_2_15(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_criminal_minds_during_2_15_at_1967(Res) :- setof((Start,End),next_globally_criminal_minds_during_2_15(Start,End),AllINtervals), checkvalidity(1967,AllINtervals,Res).

check_query() :- write('Query = next_globally_criminal_minds_during_2_15_at_1967'), (next_globally_criminal_minds_during_2_15_at_1967(true) -> write('\nRes   = true');write('\nRes   = false')).

