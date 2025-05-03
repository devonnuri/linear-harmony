\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    d1:7 r g:7 r c:7 r f:7 r bes
  }
  \new Staff \relative c' {
    \key bes \major
    d2 fis a c b a g f \break
    e c4 e g2 bes a g f es
    \bar "||"
    d r
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
