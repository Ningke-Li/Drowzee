:- include('database.pl').
ducktales(Start,End) :- begin('ducktales',_,_,Start), end('ducktales',_,_,End), Start=<End.

finally_ducktales_during_9_11(Start,End) :- ducktales(Start1,End1), (Start1-11)=<(End1-9), Start is (Start1-11), End is (End1-9), Start=<End.

globally_finally_ducktales_during_9_11_during_5_6(Start,End) :- finally_ducktales_during_9_11(Start1,End1), Start is (Start1-5), End is (End1-6), Start=<End.

globally_finally_ducktales_during_9_11_during_5_6_at_2019(Res) :- setof((Start,End),globally_finally_ducktales_during_9_11_during_5_6(Start,End),AllINtervals), checkvalidity(2019,AllINtervals,Res).

check_query() :- write('Query = globally_finally_ducktales_during_9_11_during_5_6_at_2019'), (globally_finally_ducktales_during_9_11_during_5_6_at_2019(true) -> write('\nRes   = true');write('\nRes   = false')).

