\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    d1:7 r g:7 r c:7 r f:7 r bes
  }
  \new Staff \relative c' {
    \key bes \major
    fis2 a c e d b g f \break
    e g bes d c a f es
    \bar "||"
    d r
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
