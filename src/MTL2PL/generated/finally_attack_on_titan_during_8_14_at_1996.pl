:- include('database.pl').
attack_on_titan(Start,End) :- begin('attack_on_titan',_,_,Start), end('attack_on_titan',_,_,End), Start=<End.

finally_attack_on_titan_during_8_14(Start,End) :- attack_on_titan(Start1,End1), (Start1-14)=<(End1-8), Start is (Start1-14), End is (End1-8), Start=<End.

finally_attack_on_titan_during_8_14_at_1996(Res) :- setof((Start,End),finally_attack_on_titan_during_8_14(Start,End),AllINtervals), checkvalidity(1996,AllINtervals,Res).

check_query() :- write('Query = finally_attack_on_titan_during_8_14_at_1996'), (finally_attack_on_titan_during_8_14_at_1996(true) -> write('\nRes   = true');write('\nRes   = false')).

