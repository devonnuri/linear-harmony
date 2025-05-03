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
    dis'4. e8 fis e d c b4. c8 d c bes aes g2. d'8 des c b a g fis e' d c \break
    b4. c8 d c bes aes g4. aes8 ais gis fis e dis2. bes'8 a aes g f es d c' bes aes \bar "||" \break
    g2. d'8 des c b a g fis e' d c b2. fis'8 f e dis cis b ais gis fis e \break
    dis2. bes'8 a aes g' f es d c bes aes g2. r8 es' e dis cis b ais gis' fis e
  }
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
