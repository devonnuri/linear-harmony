\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    r1 d1:m7 g:7 c:maj7
  }
  \new Staff \relative c' {
    r2 r4 a'8 gis a4 f8 e f4 d8 c b d f aes r g r f e4 g8 fis g c, d e
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
