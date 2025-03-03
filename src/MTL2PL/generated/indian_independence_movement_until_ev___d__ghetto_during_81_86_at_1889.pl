:- include('database.pl').
indian_independence_movement(Start,End) :- begin('indian_independence_movement',_,_,Start), end('indian_independence_movement',_,_,End), Start=<End.

ev___d__ghetto(Start,End) :- begin('ev___d__ghetto',_,_,Start), end('ev___d__ghetto',_,_,End), Start=<End.

indian_independence_movement_last_till_81_86(Start,End) :- indian_independence_movement(Start1,End1), (End1-Start1)>=81, Start is (Start1+81), End is (End1+1).

indian_independence_movement_until_ev___d__ghetto_during_81_86_overlap(Start,End) :- indian_independence_movement_last_till_81_86(Start1,End1), ev___d__ghetto(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

indian_independence_movement_until_ev___d__ghetto_during_81_86(Start,End) :- indian_independence_movement(W1,_), indian_independence_movement_until_ev___d__ghetto_during_81_86_overlap(Start1,End1), Start is max((Start1-86),W1), End is (End1-81), Start=<End.

indian_independence_movement_until_ev___d__ghetto_during_81_86_at_1889(Res) :- setof((Start,End),indian_independence_movement_until_ev___d__ghetto_during_81_86(Start,End),AllINtervals), checkvalidity(1889,AllINtervals,Res).

check_query() :- write('Query = indian_independence_movement_until_ev___d__ghetto_during_81_86_at_1889'), (indian_independence_movement_until_ev___d__ghetto_during_81_86_at_1889(true) -> write('\nRes   = true');write('\nRes   = false')).

