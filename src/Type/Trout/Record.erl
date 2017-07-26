-module(type_trout_record@foreign).
-export([unsafeGet/2, unsafeSet/3, unsafeDelete/2]).

unsafeGet(L,R) -> maps:get(L,R).
unsafeSet(L,X,R) -> R#{L := X}.
unsafeDelete(L,R) -> maps:without([L], R).
