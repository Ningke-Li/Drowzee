:- include('database.pl').
maria_theresa_of_austria(Start,End) :- begin('maria_theresa_of_austria',_,_,Start), end('maria_theresa_of_austria',_,_,End), Start=<End.

finally_maria_theresa_of_austria_during_3_11(Start,End) :- maria_theresa_of_austria(Start1,End1), (Start1-11)=<(End1-3), Start is (Start1-11), End is (End1-3), Start=<End.

globally_finally_maria_theresa_of_austria_during_3_11_during_31_42(Start,End) :- finally_maria_theresa_of_austria_during_3_11(Start1,End1), Start is (Start1-31), End is (End1-42), Start=<End.

globally_finally_maria_theresa_of_austria_during_3_11_during_31_42_at_1745(Res) :- setof((Start,End),globally_finally_maria_theresa_of_austria_during_3_11_during_31_42(Start,End),AllINtervals), checkvalidity(1745,AllINtervals,Res).

check_query() :- write('Query = globally_finally_maria_theresa_of_austria_during_3_11_during_31_42_at_1745'), (globally_finally_maria_theresa_of_austria_during_3_11_during_31_42_at_1745(true) -> write('\nRes   = true');write('\nRes   = false')).

