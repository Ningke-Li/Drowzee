:- include('database.pl').
uefa_euro_2004(Start,End) :- begin('uefa_euro_2004',_,_,Start), end('uefa_euro_2004',_,_,End), Start=<End.

finally_uefa_euro_2004_during_10_18(Start,End) :- uefa_euro_2004(Start1,End1), (Start1-18)=<(End1-10), Start is (Start1-18), End is (End1-10), Start=<End.

finally_uefa_euro_2004_during_10_18_at_1991(Res) :- setof((Start,End),finally_uefa_euro_2004_during_10_18(Start,End),AllINtervals), checkvalidity(1991,AllINtervals,Res).

check_query() :- write('Query = finally_uefa_euro_2004_during_10_18_at_1991'), (finally_uefa_euro_2004_during_10_18_at_1991(true) -> write('\nRes   = true');write('\nRes   = false')).

