\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    bes2:m7 es:7 aes1:maj7
  }
  \new Staff \relative c' {
    e'!16 f aes bes32 aes^"↓" f16^"↓" des^"↓" bes^"↓" f a f aes^"↓" f g^"↓" f^"↓" es^"↓" des^"↓" c^"↓" es f g bes g aes c r2
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 140}
}
