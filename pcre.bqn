match_c ← "lib.so" •FFI "a"‿"match"‿"*u8:c8"‿"*u8:c8"

Match⇐{ ⊑¨Match_c ⟨𝕨∾@+0,𝕩∾@+0⟩ }

Replace⇐{ 
  p 𝕊 src‿r:
    m←Match_c ⟨p∾@+0,src∾@+0⟩
    i←↕≠src ⋄ s←(0¨i)∨´i⊸=¨1⊑¨m ⋄ e←(0¨i)∨´i⊸=¨2⊑¨m ⋄ g←+`s∨e
    ∾r¨⌾((g/˜s)⊸⊏) g⊔src
}
