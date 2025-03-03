:- include('database.pl').
gurren_lagann(Start,End) :- begin('gurren_lagann',_,_,Start), end('gurren_lagann',_,_,End), Start=<End.

finally_gurren_lagann_during_7_19(Start,End) :- gurren_lagann(Start1,End1), (Start1-19)=<(End1-7), Start is (Start1-19), End is (End1-7), Start=<End.

finally_gurren_lagann_during_7_19_at_1993(Res) :- setof((Start,End),finally_gurren_lagann_during_7_19(Start,End),AllINtervals), checkvalidity(1993,AllINtervals,Res).

check_query() :- write('Query = finally_gurren_lagann_during_7_19_at_1993'), (finally_gurren_lagann_during_7_19_at_1993(true) -> write('\nRes   = true');write('\nRes   = false')).

