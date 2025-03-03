:- include('database.pl').
cyclone_nargis(Start,End) :- begin('cyclone_nargis',_,_,Start), end('cyclone_nargis',_,_,End), Start=<End.

finally_cyclone_nargis_during_10_14(Start,End) :- cyclone_nargis(Start1,End1), (Start1-14)=<(End1-10), Start is (Start1-14), End is (End1-10), Start=<End.

finally_cyclone_nargis_during_10_14_at_1995(Res) :- setof((Start,End),finally_cyclone_nargis_during_10_14(Start,End),AllINtervals), checkvalidity(1995,AllINtervals,Res).

check_query() :- write('Query = finally_cyclone_nargis_during_10_14_at_1995'), (finally_cyclone_nargis_during_10_14_at_1995(true) -> write('\nRes   = true');write('\nRes   = false')).

