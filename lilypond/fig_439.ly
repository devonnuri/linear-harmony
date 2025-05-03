\version "2.25.25"

\include "layout.ly"

\score {
<<
  \chords {
    f1:m7 bes:m7 es:7 aes:maj7
    des:maj7 d2:m7.5- g:7 c1:maj7 r
    c:m7 f:m7 bes:7 es:maj7
    aes:maj7 d:7 g:maj7 r
    a:m7 d:7 g:maj7 r
    fis:m7 b:7 e:maj7 c:7
    f:m7 bes:m7 es:7 aes:maj7
    des:maj7 des:m7.7+ c:m7 b:dim7
    bes:m7 es:7 aes:maj7 g2:m7.5- c:7
  }
  \new Staff \relative c' {
    \set Staff.explicitKeySignatureVisibility = #begin-of-line-visible
    \set Staff.printKeyCancellation = ##f
    \override Staff.KeySignature.break-visibility = #begin-of-line-visible
    % f^\markup { \NWS-box \tiny "No.3" } d bes a aes f' r e es g, r ges~ ges4 es'8 cis d f, g bes des bes c bes R1 \fine
    \key aes \major
    r8 g' aes^\markup { \NWS-box \tiny "No.1" } c, g' f es d des^\markup { \NWS-box \tiny "No.1" } f aes c bes aes f fis g4^\markup { \NWS-box \tiny "No.1" } r8 fes es bes des c^\markup { \NWS-box \tiny "No.1" } r2 r8 bes' aes g \break
    f g aes f~ f4 r r8 f16 es d8^\markup { \NWS-box \tiny "No.2" } f aes c b aes g f d dis e g r4 r2 r4 g8 es'~ \bar "||" \break
    \key es \major
    es^\markup { \NWS-box \tiny "No.1" } g, d' des c g bes aes~ aes g f^\markup { \NWS-box \tiny "No.2" } aes c es c cis d dis e f^\markup { \NWS-box \tiny "No.3" } d bes aes fis g bes r4 r8 es c es~ \break
    es2~ es8^\markup { \NWS-box \tiny "No.3" } c aes g fis a c es d a c b~ b d, fis a~ a4 g8 fis~ fis4 r r d'8 des \bar "||" \break
    \key g \major
    c^\markup { \NWS-box \tiny "No.1" } e, g b a g e f fis a c d es f d c b4. fis8~ fis a g e R1 \break
    r8 gis b gis a f fis^\markup { \NWS-box \tiny "No.2" } a cis e cis d dis c b a gis b r4 r fis8 dis e^\markup { \NWS-box \tiny "No.1" } g bes des c g bes aes \bar "||" \break
    \key aes \major
    r4 r8 b c^\markup { \NWS-box \tiny "No.3" } aes f es des4. c'8~ c4 b8 bes r4 r8 a bes^\markup { \NWS-box \tiny "No.3" } g es des c es g bes~ bes4 a8 aes \break
    r2 r8 f aes c es d des c aes fes r es~ es f g bes g aes bes b d g r4 r8 es e f~ \break
    f^\markup { \NWS-box \tiny "No.3" } des bes f a f' r des bes f aes fis g e' es des c es, r4 r es'8 d des^\markup { \NWS-box \tiny "No.3" } bes g f e c' bes aes \fine
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
