\version "2.25.25"

\include "layout.ly"

% Define top margin for subsequent pages via \paper
\paper {
  top-margin = 5\mm
}

% Insert vertical space before the first system only
firstPageSpacer = \markup {
  \vspace #15 % Adjust this value as needed
}

\markup \firstPageSpacer

chordA = \chordmode {
  f2:maj7 d:7 g:m7 c:7 a:m7 d:7 g:m7 c:7
  f1:7 bes2:maj7 es:9 a:m7 d:7 g:m7 c:7
}

chordB = \chordmode {
  e1:m7 a:7 a:m7 d:7
  d:m7 g:7 g:m7 c:7
}

chordC = \chordmode {
  f2:maj7 d:7 g:m7 c:7 a:m7 d:7 g:m7 c:7
  f1:7 bes2:maj7 b:dim7 f1 g2:m7 c:7
}

\score {
<<
  \chords {
    \chordA \chordA \chordB \chordC
    \chordA \chordA \chordB \chordC
    f2:maj7 d:7 R1*31
    \chordA \chordA \chordB \chordC
    f2:maj7 d:7 R1*15
    a1:7 r d:7 r
    g:7 r g:m7 c:7
    \chordC
    f1:maj7 R1*7
    \chordA
    a1:7 R1*7
    \chordC
    f1:maj7 R1*3
    f1:7 bes2:maj7 es:9 a:m7 d:7 g:m7 c:7
    f2:maj7 d:7 R1*3
    f1:7 bes2:maj7 es:9 a:m7 d:7 g:m7 c:7
    a1:7 r d:7 r
    d:m7 g:7 g:m7 c:7
    f2:maj7 d:7 g:m7 c:7 a:m7 d:7 r1
    c2:m7 f:7 bes:maj7 b:dim7 f1 g2:m7 c:7
    f1
  }
  \new Staff \relative c' \compressMMRests {
    \override MultiMeasureRest.expand-limit = 2
    \key f \major
    R1 r2 g'8 e f g gis a d des c d e g f d bes a gis b e d \break
    c d es f g bes d r c bes a g f des c bes a c g e f c a f d' r r4 r2 \bar"||" \break
  g8 e f g a c aes bes c es des es f aes g f e d c bes a g fis a g a bes c \tuplet 3/2 {cis16 d cis} b8 c bes \break
a g f e es4 r r2 \tuplet 3/2 {d8 f a} c4 r2 c8 d e g f e d des c bes r4 \bar"||" \break
r2 b8 d cis b a g^\markup { \NWS-box \tiny "No.1" } fis f e d cis e g b a^\markup { \NWS-box \tiny "No.2" } b c d e g gis b a g fis e d des \break
c d16 c a8^\markup { \NWS-box \tiny "No.3" } f e d cis a c! a b d f a dis, e g e f d bes g^\markup { \NWS-box \tiny "No.2" } c a bes c d f e g bes d \bar"||"\break
c a bes g a f c a d4 r r2 r4 g'8 e f g a bes fis a g f e^\markup { \NWS-box \tiny "No.1" } d c bes \break
a g f e es f g bes c a bes c d e f g gis a bes gis a f c a bes4 r r2 \bar"||"\break
r4 g'2.~ g4 d8 des c d f4 r2 g8 e f g gis a bes a bes cis d b \break
c bes a g f es d f g a c bes a g f d c^\markup { \NWS-box \tiny "No.1" } bes a g fis a c es d^\markup { \NWS-box \tiny "No.3" } bes g f e g bes des \bar"||"\break
c a bes gis a g aes bes c es des es f aes g f e d c^\markup { \NWS-box \tiny "No.1" } bes a g fis d g2 r \break
r4 r8 f'16 e es8 g f es d f g a c bes a g f des c bes a f c a bes c \tuplet 3/2 {d e g} f4 r \bar"||"\break
r4 r8 a16 aes g8^\markup { \NWS-box \tiny "No.1" } fis e d cis e g a^\markup { \NWS-box \tiny "No.2" } b gis a b c d e g gis b a g fis e d des c e b a \break
d4 r r a8 c b gis a f e d g ges f d bes g^\markup { \NWS-box \tiny "No.2" } c a \tuplet 3/2 {bes d f} a f g a bes c des b \bar"||"\break
c c, d g e f a c e d e d es des es des c a d gis, a g aes g fis a g f d f des b \break
c d es f ges aes f es \tuplet 3/2 {d f a} c a bes c d f e4 c a2 d4^\markup { \NWS-box \tiny "No.3" } \tuplet 3/2 {bes8 g f} e des c bes \bar"||"\break
a4 r r2 R1*7 \bar"||" R1*8 \bar"||" R1*8 \bar"||" R1*8 \bar"||" \break
r2 r4 r8 c' bes c d f a e r g r f d d c ces bes^\markup { \NWS-box \tiny "No.1" } a g f \tuplet 3/2 {e g bes} des b c^\markup { \NWS-box \tiny "No.2" } d \break
es f g bes d4 a8 c bes a g ges f des c bes a g f d g4 r r2 r8 g' f g~ \bar"||"\break
g4. e8 f c a f d'^\markup { \NWS-box \tiny "No.3" } bes g f e g bes d c^\markup { \NWS-box \tiny "No.1" } g bes g \tuplet 3/2 {a16 bes a} g8 fis a g a bes c des es g4 \break
r2 r4 r8 f aes bes ces bes aes f es c ces bes r4 r d8 b c d e g f c a f \bar"||"\break
b^\markup { \NWS-box \tiny "No.3" } g e b dis4. b8 d b cis e g a b gis a^\markup { \NWS-box \tiny "No.2" } b c d e fis g b a g fis e d des c d16 c \break
a8 g f d^\markup { \NWS-box \tiny "No.2" } g e \tuplet 3/2 {f a c} e4. d16 c b8 d f a g f e d c b bes^\markup { \NWS-box \tiny "No.1" } d, a'4 g8 f e g bes d \bar"||" \break
c a e c d4 r r2 r4 r8 e' g4 f8 c r a d4~^\markup { \NWS-box \tiny "No.3" } d bes8 g f dis e g \break
bes d c d es f aes ges f es d f des b c bes a c g e f c a f d'^\markup { \NWS-box \tiny "No.3" } bes g f e g bes d \bar"||" \break
c4 r4 r2 R1*7 \bar"||" R1*8 \bar"||" \break
r2 r4 fis' a fis8 e r2 r4 r8 a16 g fis8 e d des c e, dis e b' a fis d \break
g a b d des es f aes g ges f e d c b a bes^\markup { \NWS-box \tiny "No.1" } c \tuplet 3/2 {d f a} c ces bes a g f e aes es4 des8 b \bar"||" \break
c4 a8 f bes4 g8 e a4 f8 d bes'4 g8 e c'4 a8 f d'4 bes8 g e'4 c8 a e' f e d \break
c4 r r r8 f aes bes ces bes aes f es4 g8 e f g e d c ces bes a aes bes16 aes e8 d des b \bar"||"\break
c2 r R1*7 \bar"||" \break
r8 c' f e es bes r es r d des aes r des r c b fis b bes a e a aes g e g ges f des c bes \break
a c f e es ges aes g fis4 b8 bes a f d' des c d e g f e d des c a bes g a f c a \bar"||" \break
b4 r r2 R1*7 \bar"||" \break
r4 g''8 e f g a c bes a aes e es d des r r2 g8 e f g aes bes aes f es aes f es \break
c f es c bes es des bes aes des ces ges e g a4 r g8 e f g a c bes c, d f a g e c \bar"||"\break
f4 r r2 R1*3 \break
r2 f'8 es f bes aes f es fis e cis b e d a g c bes f es aes fis cis b e d a g c~ \bar"||"\break
c4 r r2 R1*3 \break
g''8 f g f e d e d c bes c bes a g a g f g a c e4 g8 e f c a bes c a g f \bar"||" \break
e4 r r f8 fis bes b c d e fis e4 r2 r4 g8 e fis e d des c e b a \break
r2 d8^\markup { \NWS-box \tiny "No.2" } e f g a c b a g ges f e d des c ces bes c a bes c d e f e d c bes \bar"||" \break
a4 c r2 c4 a8 f g a bes d c4 a8 f g a bes4 R1 \break
c8^\markup { \NWS-box \tiny "No.2" } es g bes a g f e es4 a8 a c4 bes8 r a4 g8 e f4 e8 d c b bes d, e g bes d \bar"||" \break
c4 r r2 \fine
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
