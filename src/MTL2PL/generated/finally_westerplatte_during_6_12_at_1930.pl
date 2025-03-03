:- include('database.pl').
westerplatte(Start,End) :- begin('westerplatte',_,_,Start), end('westerplatte',_,_,End), Start=<End.

finally_westerplatte_during_6_12(Start,End) :- westerplatte(Start1,End1), (Start1-12)=<(End1-6), Start is (Start1-12), End is (End1-6), Start=<End.

finally_westerplatte_during_6_12_at_1930(Res) :- setof((Start,End),finally_westerplatte_during_6_12(Start,End),AllINtervals), checkvalidity(1930,AllINtervals,Res).

check_query() :- write('Query = finally_westerplatte_during_6_12_at_1930'), (finally_westerplatte_during_6_12_at_1930(true) -> write('\nRes   = true');write('\nRes   = false')).

