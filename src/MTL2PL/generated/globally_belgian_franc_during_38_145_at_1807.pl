:- include('database.pl').
belgian_franc(Start,End) :- begin('belgian_franc',_,_,Start), end('belgian_franc',_,_,End), Start=<End.

globally_belgian_franc_during_38_145(Start,End) :- belgian_franc(Start1,End1), Start is (Start1-38), End is (End1-145), Start=<End.

globally_belgian_franc_during_38_145_at_1807(Res) :- setof((Start,End),globally_belgian_franc_during_38_145(Start,End),AllINtervals), checkvalidity(1807,AllINtervals,Res).

check_query() :- write('Query = globally_belgian_franc_during_38_145_at_1807'), (globally_belgian_franc_during_38_145_at_1807(true) -> write('\nRes   = true');write('\nRes   = false')).

