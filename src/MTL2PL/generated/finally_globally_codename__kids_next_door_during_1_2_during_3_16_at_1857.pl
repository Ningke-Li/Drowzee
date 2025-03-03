:- include('database.pl').
codename__kids_next_door(Start,End) :- begin('codename__kids_next_door',_,_,Start), end('codename__kids_next_door',_,_,End), Start=<End.

globally_codename__kids_next_door_during_1_2(Start,End) :- codename__kids_next_door(Start1,End1), Start is (Start1-1), End is (End1-2), Start=<End.

finally_globally_codename__kids_next_door_during_1_2_during_3_16(Start,End) :- globally_codename__kids_next_door_during_1_2(Start1,End1), (Start1-16)=<(End1-3), Start is (Start1-16), End is (End1-3), Start=<End.

finally_globally_codename__kids_next_door_during_1_2_during_3_16_at_1857(Res) :- setof((Start,End),finally_globally_codename__kids_next_door_during_1_2_during_3_16(Start,End),AllINtervals), checkvalidity(1857,AllINtervals,Res).

check_query() :- write('Query = finally_globally_codename__kids_next_door_during_1_2_during_3_16_at_1857'), (finally_globally_codename__kids_next_door_during_1_2_during_3_16_at_1857(true) -> write('\nRes   = true');write('\nRes   = false')).

