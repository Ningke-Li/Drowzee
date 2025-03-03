:- include('database.pl').
supernatural(Start,End) :- begin('supernatural',_,_,Start), end('supernatural',_,_,End), Start=<End.

globally_supernatural_during_7_10(Start,End) :- supernatural(Start1,End1), Start is (Start1-7), End is (End1-10), Start=<End.

globally_supernatural_during_7_10_at_1953(Res) :- setof((Start,End),globally_supernatural_during_7_10(Start,End),AllINtervals), checkvalidity(1953,AllINtervals,Res).

check_query() :- write('Query = globally_supernatural_during_7_10_at_1953'), (globally_supernatural_during_7_10_at_1953(true) -> write('\nRes   = true');write('\nRes   = false')).

