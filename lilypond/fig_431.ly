\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    b2 d:7 g bes:7 es1:maj7 a2:m7 d:7
    g bes:7 es fis:7 b1 f2:m7 bes:7
    es1:maj7 a2:m7 d:7 g1:maj7 cis2:m7 fis:7
    b1:maj7 f2:m7 bes:7 es1:maj7 cis2:m7 fis:7
  }
  \new Staff \relative c' {
  \repeat volta 2 { 
    dis'4 fis8 gis a fis d c b4 d8 e f d bes aes g2. d'8 des c e g b a fis d c \break
    b4 d8 e f d bes aes g4 bes8 c cis ais fis e dis2. bes'8 a aes c es g f d bes aes \bar "||" \break
    g2. d'8 des c e g b a fis d c b2. fis8 f e gis b dis cis ais fis e \break
    dis2. bes'8 a aes c es g f d bes aes g2. f8 es e gis b dis cis ais fis e
  }
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
