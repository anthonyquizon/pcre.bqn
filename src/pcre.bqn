match_c ← "lib.so" •FFI "a"‿"match"‿"*u8:c8"‿"*u8:c8"

Match⇐{ ⊑¨Match_c ⟨𝕨∾@+0,𝕩∾@+0⟩ }

Replace⇐{ 
  pat 𝕊 src‿r:
    m←Match_c ⟨pat∾@+0,src∾@+0⟩
    •Show s←1⊑¨m
    •Show e←2⊑¨m

    i←↕≠src
    p←i⊸=¨s
    q←i⊸=¨e

    •Show src
    •Show p
    •Show q
    •SHow g←+`∨´p∨q
    •Show z←g/˜∨´p
    •Show ∾r¨⌾(z⊸⊏) g⊔src
}

•Show "\d\w" Match "1a2b3c"
"\d+\w" Replace "11a2b---3c"‿"xy"
