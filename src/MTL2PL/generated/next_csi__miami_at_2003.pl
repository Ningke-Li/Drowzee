:- include('database.pl').
csi__miami(Start,End) :- begin('csi__miami',_,_,Start), end('csi__miami',_,_,End), Start=<End.

next_csi__miami(Start,End) :- csi__miami(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_csi__miami_at_2003(Res) :- setof((Start,End),next_csi__miami(Start,End),AllINtervals), checkvalidity(2003,AllINtervals,Res).

check_query() :- write('Query = next_csi__miami_at_2003'), (next_csi__miami_at_2003(true) -> write('\nRes   = true');write('\nRes   = false')).

