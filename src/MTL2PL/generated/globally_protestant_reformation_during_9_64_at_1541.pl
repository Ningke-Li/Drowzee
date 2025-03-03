:- include('database.pl').
protestant_reformation(Start,End) :- begin('protestant_reformation',_,_,Start), end('protestant_reformation',_,_,End), Start=<End.

globally_protestant_reformation_during_9_64(Start,End) :- protestant_reformation(Start1,End1), Start is (Start1-9), End is (End1-64), Start=<End.

globally_protestant_reformation_during_9_64_at_1541(Res) :- setof((Start,End),globally_protestant_reformation_during_9_64(Start,End),AllINtervals), checkvalidity(1541,AllINtervals,Res).

check_query() :- write('Query = globally_protestant_reformation_during_9_64_at_1541'), (globally_protestant_reformation_during_9_64_at_1541(true) -> write('\nRes   = true');write('\nRes   = false')).

