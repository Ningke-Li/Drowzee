:- include('database.pl').
new_imperialism(Start,End) :- begin('new_imperialism',_,_,Start), end('new_imperialism',_,_,End), Start=<End.

globally_new_imperialism_during_14_36(Start,End) :- new_imperialism(Start1,End1), Start is (Start1-14), End is (End1-36), Start=<End.

globally_new_imperialism_during_14_36_at_1721(Res) :- setof((Start,End),globally_new_imperialism_during_14_36(Start,End),AllINtervals), checkvalidity(1721,AllINtervals,Res).

check_query() :- write('Query = globally_new_imperialism_during_14_36_at_1721'), (globally_new_imperialism_during_14_36_at_1721(true) -> write('\nRes   = true');write('\nRes   = false')).

