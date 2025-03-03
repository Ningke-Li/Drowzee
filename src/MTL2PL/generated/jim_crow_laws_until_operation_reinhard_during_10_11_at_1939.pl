:- include('database.pl').
jim_crow_laws(Start,End) :- begin('jim_crow_laws',_,_,Start), end('jim_crow_laws',_,_,End), Start=<End.

operation_reinhard(Start,End) :- begin('operation_reinhard',_,_,Start), end('operation_reinhard',_,_,End), Start=<End.

jim_crow_laws_last_till_10_11(Start,End) :- jim_crow_laws(Start1,End1), (End1-Start1)>=10, Start is (Start1+10), End is (End1+1).

jim_crow_laws_until_operation_reinhard_during_10_11_overlap(Start,End) :- jim_crow_laws_last_till_10_11(Start1,End1), operation_reinhard(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

jim_crow_laws_until_operation_reinhard_during_10_11(Start,End) :- jim_crow_laws(W1,_), jim_crow_laws_until_operation_reinhard_during_10_11_overlap(Start1,End1), Start is max((Start1-11),W1), End is (End1-10), Start=<End.

jim_crow_laws_until_operation_reinhard_during_10_11_at_1939(Res) :- setof((Start,End),jim_crow_laws_until_operation_reinhard_during_10_11(Start,End),AllINtervals), checkvalidity(1939,AllINtervals,Res).

check_query() :- write('Query = jim_crow_laws_until_operation_reinhard_during_10_11_at_1939'), (jim_crow_laws_until_operation_reinhard_during_10_11_at_1939(true) -> write('\nRes   = true');write('\nRes   = false')).

