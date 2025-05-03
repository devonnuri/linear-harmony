\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    e1:m7.5- a:7 c:m7 f:7
    f:m7 bes:7 es:maj7 aes:7
    bes:maj7 e2:m7.5- a:7 d1:m7 r2 es:7
    f1:maj7 g:m7 a:m7.5- d:7
    g:7 r c:m7 r
    es:m7 aes:7 bes:maj7 r
    e:m7.5- a:7 d:m7.5- g:7
    c:m7.5- f:7 bes:maj7
  }
  \new Staff \relative c' {
    \key bes \major
    r8 g' a bes~ bes^\markup { \NWS-box \tiny "No.3" } g e d cis e g bes a4 g8 f~ f2. r4 r8 c^\markup { \NWS-box \tiny "No.2" } \tuplet 3/2 {es g bes} a g f g \break
    aes^\markup { \NWS-box \tiny "No.1" } c, es g f es c cis d4 r8 ces' bes aes f fis g4 r8 bes, d4 des8 c~ c2 r8 f bes c \bar "||" \break
    d4 bes8 f~ f4 r8 es e^\markup { \NWS-box \tiny "No.2" } g bes d cis bes g gis a4 f8 d~ d4 r8 c bes^\markup { \NWS-box \tiny "No.2" } des f aes g f gis a~ \break
    a4 bes8 b c f, r bes~ bes4 c8 d r4 r8 es~ es^\markup { \NWS-box \tiny "No.3" } b d des c a g f fis4 r r es'8 d~ \bar "||" \break
    d2. c8 bes b4^\markup { \NWS-box \tiny "No.1" } aes8 fis g4 f8 d es4. f8 g c, d es r2 r4 r8 f \break
    ges^\markup { \NWS-box \tiny "No.1" } bes des f es ges, bes des c es, ges bes aes bes, ges' f~ f4. es16 cis d8 f a c~ c2. r4 \bar "||" \break
    r4 a8 aes g^\markup { \NWS-box \tiny "No.1" } f e d cis e g bes a4 g8 f~ f4. es8 d^\markup { \NWS-box \tiny "No.2" } f aes c b g r4 r8 d' es f \break
    ges es f ges^\markup { \NWS-box \tiny "No.3" } es c bes gis a c ges e f4 es8 cis d4. f16 d es8 e g ges f4. c'8 r2 \fine
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
