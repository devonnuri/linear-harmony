\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    bes2 g:7 c:m7 f:7 bes1 c2:m7 f:7
    f:m7 bes:7 es:maj7 e4.:dim7 bes8 r1 c2:m7 f:7
    bes g:7 c:m7 f:7 d:m7 cis:m7 c:m7 f:7
    bes1 es2:m7 aes:7 bes1 r
    a:m7 d:7 g:7 r
    g:m7 c:7 c:m7 f:7
    bes c2.:m7 f4:7 d2:m7.5- g:7 c:m7 f:7
    bes bes:7/d es aes:7 bes c4:7 f8:7 bes r1
  }
  \new Staff \relative c' {
    \key bes \major
    f8^\markup { \NWS-box \tiny "No.1" } es d c b aes' g f es d' c bes a g f es d4. bes'8 r4 r8 d, c^\markup { \NWS-box \tiny "No.2" } es g bes a f r b \break
    c^\markup { \NWS-box \tiny "No.3" } aes f es d f aes ces bes^\markup { \NWS-box \tiny "No.3" } g es d cis a' g f R1 r2 r4 r8 f \bar "||" \break
    bes4 c8 cis d^\markup { \NWS-box \tiny "No.3" } b g f es4 d'8 des c^\markup { \NWS-box \tiny "No.3" } a f es d4 c'8 a b gis e cis c^\markup { \NWS-box \tiny "No.2" } es g bes a c es g \break
    f bes, r4 bes r es,8^\markup { \NWS-box \tiny "No.2" } ges bes des c bes aes ges f4 es8 cis d f g bes r2 r4 r8 d \bar "||" \break
    e^\markup { \NWS-box \tiny "No.3" } c a e gis4. e8 g a16 g e8 f fis es d c b d f a e d r e16 es d8^\markup { \NWS-box \tiny "No.2" } f a c b g^\markup { \NWS-box \tiny "No.2" } a bes \break
    r4 r8 d f d dis e r c cis d r a c b bes g es d c4^\markup { \NWS-box \tiny "No.2" } es8 g bes d c bes a c es g \bar "||" \break
    f4. bes8 r4 e,8 es~ es2. f8 g aes^\markup { \NWS-box \tiny "No.3" } f d c b aes' f fis g^\markup { \NWS-box \tiny "No.3" } es c bes a ges' es e \break
    f^\markup { \NWS-box \tiny "No.3" } d bes a aes f' r e es g, r ges~ ges4 es'8 cis d f, g bes des bes c bes R1 \fine
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
