:- include('database.pl').
romanticism(Start,End) :- begin('romanticism',_,_,Start), end('romanticism',_,_,End), Start=<End.

finally_romanticism_during_5_19(Start,End) :- romanticism(Start1,End1), (Start1-19)=<(End1-5), Start is (Start1-19), End is (End1-5), Start=<End.

globally_finally_romanticism_during_5_19_during_4_21(Start,End) :- finally_romanticism_during_5_19(Start1,End1), Start is (Start1-4), End is (End1-21), Start=<End.

globally_finally_romanticism_during_5_19_during_4_21_at_1860(Res) :- setof((Start,End),globally_finally_romanticism_during_5_19_during_4_21(Start,End),AllINtervals), checkvalidity(1860,AllINtervals,Res).

check_query() :- write('Query = globally_finally_romanticism_during_5_19_during_4_21_at_1860'), (globally_finally_romanticism_during_5_19_during_4_21_at_1860(true) -> write('\nRes   = true');write('\nRes   = false')).

