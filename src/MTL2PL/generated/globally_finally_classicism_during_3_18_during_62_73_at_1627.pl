:- include('database.pl').
classicism(Start,End) :- begin('classicism',_,_,Start), end('classicism',_,_,End), Start=<End.

finally_classicism_during_3_18(Start,End) :- classicism(Start1,End1), (Start1-18)=<(End1-3), Start is (Start1-18), End is (End1-3), Start=<End.

globally_finally_classicism_during_3_18_during_62_73(Start,End) :- finally_classicism_during_3_18(Start1,End1), Start is (Start1-62), End is (End1-73), Start=<End.

globally_finally_classicism_during_3_18_during_62_73_at_1627(Res) :- setof((Start,End),globally_finally_classicism_during_3_18_during_62_73(Start,End),AllINtervals), checkvalidity(1627,AllINtervals,Res).

check_query() :- write('Query = globally_finally_classicism_during_3_18_during_62_73_at_1627'), (globally_finally_classicism_during_3_18_during_62_73_at_1627(true) -> write('\nRes   = true');write('\nRes   = false')).

