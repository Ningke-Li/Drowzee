:- include('database.pl').
vostok_programme(Start,End) :- begin('vostok_programme',_,_,Start), end('vostok_programme',_,_,End), Start=<End.

danny_phantom(Start,End) :- begin('danny_phantom',_,_,Start), end('danny_phantom',_,_,End), Start=<End.

vostok_programme_last_till_38_39(Start,End) :- vostok_programme(Start1,End1), (End1-Start1)>=38, Start is (Start1+38), End is (End1+1).

vostok_programme_until_danny_phantom_during_38_39_overlap(Start,End) :- vostok_programme_last_till_38_39(Start1,End1), danny_phantom(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

vostok_programme_until_danny_phantom_during_38_39(Start,End) :- vostok_programme(W1,_), vostok_programme_until_danny_phantom_during_38_39_overlap(Start1,End1), Start is max((Start1-39),W1), End is (End1-38), Start=<End.

vostok_programme_until_danny_phantom_during_38_39_at_1956(Res) :- setof((Start,End),vostok_programme_until_danny_phantom_during_38_39(Start,End),AllINtervals), checkvalidity(1956,AllINtervals,Res).

check_query() :- write('Query = vostok_programme_until_danny_phantom_during_38_39_at_1956'), (vostok_programme_until_danny_phantom_during_38_39_at_1956(true) -> write('\nRes   = true');write('\nRes   = false')).

