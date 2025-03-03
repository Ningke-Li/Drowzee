:- include('database.pl').
italian_invasion_of_albania(Start,End) :- begin('italian_invasion_of_albania',_,_,Start), end('italian_invasion_of_albania',_,_,End), Start=<End.

finally_italian_invasion_of_albania_during_5_13(Start,End) :- italian_invasion_of_albania(Start1,End1), (Start1-13)=<(End1-5), Start is (Start1-13), End is (End1-5), Start=<End.

finally_italian_invasion_of_albania_during_5_13_at_1930(Res) :- setof((Start,End),finally_italian_invasion_of_albania_during_5_13(Start,End),AllINtervals), checkvalidity(1930,AllINtervals,Res).

check_query() :- write('Query = finally_italian_invasion_of_albania_during_5_13_at_1930'), (finally_italian_invasion_of_albania_during_5_13_at_1930(true) -> write('\nRes   = true');write('\nRes   = false')).

