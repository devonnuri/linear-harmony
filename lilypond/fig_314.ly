\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    d1:m7.5- g:7 c:m r
    d1:m7.5- g:7 c:m r
    d1:m7.5- g:7 c:m r
    d1:m7.5- g:7 c:m r
  }
  \new Staff \relative c' {
    \key c \minor
    \repeat volta 2 {
      f'4 es d c b aes g f es1~ es \break
      d4 f aes c b aes g f es1~ es \break
      aes4 f d c b d f aes g1~ g \break
      f4 es' d c b aes' g f es1~ es
    }
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
