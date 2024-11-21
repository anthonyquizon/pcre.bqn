⟨Replace,Match⟩ ← •Import "pcre.bqn"

! "1a"‿"2b"‿"3c"≡"\d\w" Match "1a2b3c"

! "xyxy---xy"≡"\d+\w" Replace "11a2b---3c"‿"xy"

! "abcd"≡"\d" Replace "abcd"‿"xy" # no matches
