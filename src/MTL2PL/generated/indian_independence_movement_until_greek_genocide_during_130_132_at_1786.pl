:- include('database.pl').
indian_independence_movement(Start,End) :- begin('indian_independence_movement',_,_,Start), end('indian_independence_movement',_,_,End), Start=<End.

greek_genocide(Start,End) :- begin('greek_genocide',_,_,Start), end('greek_genocide',_,_,End), Start=<End.

indian_independence_movement_last_till_130_132(Start,End) :- indian_independence_movement(Start1,End1), (End1-Start1)>=130, Start is (Start1+130), End is (End1+1).

indian_independence_movement_until_greek_genocide_during_130_132_overlap(Start,End) :- indian_independence_movement_last_till_130_132(Start1,End1), greek_genocide(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

indian_independence_movement_until_greek_genocide_during_130_132(Start,End) :- indian_independence_movement(W1,_), indian_independence_movement_until_greek_genocide_during_130_132_overlap(Start1,End1), Start is max((Start1-132),W1), End is (End1-130), Start=<End.

indian_independence_movement_until_greek_genocide_during_130_132_at_1786(Res) :- setof((Start,End),indian_independence_movement_until_greek_genocide_during_130_132(Start,End),AllINtervals), checkvalidity(1786,AllINtervals,Res).

check_query() :- write('Query = indian_independence_movement_until_greek_genocide_during_130_132_at_1786'), (indian_independence_movement_until_greek_genocide_during_130_132_at_1786(true) -> write('\nRes   = true');write('\nRes   = false')).

