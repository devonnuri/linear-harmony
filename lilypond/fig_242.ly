\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    fis2:m7 fis2:m7.7+ fis:m7 b:7 e:maj7
  }
  \new Staff \relative c' {
    e'8 cis,16 fis~ fis a cis8 f! cis16 a f8. cis'16
    e8 cis,16 fis~ fis^"↓" a^"↓" cis^"↓" e^"↓" dis8^"↓" c16 g dis8 c'16 b~ b r8. r4 r2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 160}
}
