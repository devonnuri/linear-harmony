\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    d2:m7.5- g:7.9- c1:m
    d2:m7.5- g:7.9- c1:m
    d2:m7.5- g:7.9- c1:m
    d2:m7.5- g:7.9- c1:m
  }
  \new Staff \relative c' {
    \key c \minor
    \repeat volta 2 {
      f'8 es d c b aes g f es1
      d8 f aes c b aes g f es1 \break
      aes8 f d c b d f aes g1
      f8 es' d c b aes' g f es1
    }
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
