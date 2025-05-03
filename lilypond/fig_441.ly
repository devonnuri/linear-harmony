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

\score {
<<
  \chords {
    es1:maj7 r d:m7.5- g:7.9-
    c:m7 r bes:m7 es:7
    aes:maj7 des:9 es:maj7 r
    f:9 r f:m7 bes:7
    es:maj7 r d:m7.5- g:7.9-
    c:m7 r bes:m7 es:7
    aes:maj7 des:9 es:maj7 f2:9
    e:9 r1 r f2:m7 bes:7 r1
   % r1 r r r
   % r r r r
   % r r r r
   % r r r r
    es1:maj7 r d:m7.5- g:7.9-
    c:m7 r bes:m7 es:7
    aes:maj7 des:9 es:maj7 r
    f:9 r f:m7 bes:7
    es:maj7 r d:m7.5- g:7.9-
    c:m7 r bes:m7 es:7
    aes:maj7 des:9 es:maj7 f2:9 e:9
    es1:maj7 g2:m7.5- c:7 f:m7 bes:7 es1:maj7
    es:maj7 r d:m7.5- g:7.9-
    c:m7 r bes:m7 es:7
    aes:maj7 des:9 es:maj7 r
    f:9 r f:m7 bes:7
    es:maj7 r d:m7.5- g:7.9-
    c:m7 r bes:m7 es:7
    aes:maj7 des:9 es:maj7 f2:9 e:9
    es1:maj7 g2:m7.5- c:7 f:m7 bes:7 es1:maj7
    es1:maj7
  }
  \new Staff \relative c' {
    \set Score.rehearsalMarkFormatter = #(format-mark-generic
                                        '(roman uppercase box bold))
    \key es \major
    \mark \default
    es8 f es c es f es c es f es c~ c4 r4 r4 r8 d16 c b8 d f g aes fis\turn g des'~ des\turn b c aes~ \break
    aes fis\turn g des~ des\turn b c aes~ aes\turn fis g a b c d cis d4 r bes8^\markup { \NWS-box \tiny "No.2" } c des es f aes g f e4 es8 des \break
  \tuplet 3/2 {c es g} bes g aes bes c des es4 \tuplet 3/2 {des8 es des} c b4 a8 bes g \tuplet 3/2 {aes bes aes} g es4 bes8 f' d \tuplet 3/2 {es^\markup { \NWS-box \tiny "No.1" } g bes} d c bes g \break
a bes a g f es \tuplet 3/2 {g bes d} c a bes gis a f r4 r4 r8 c f aes^\markup { \NWS-box \tiny "No.1" } g f e c es cis d f, aes ces \break
    bes aes g d' f d es f g bes c es~ es2 r2 r8 d4 c8 \tuplet 7/4 {b16 aes f d b g aes} f4 r2 \break
    r8 g r b d b c d es f d es c4 bes8^\markup { \NWS-box \tiny "No.2" } c des es f aes g4 f8^\markup { \NWS-box \tiny "No.3" } des bes f aes fis g f' e d \bar "||" \break
  es b \tuplet 3/2 {c es g} aes bes16 aes g8 aes bes16 aes g8 aes bes16 aes g8 f es ces bes aes \tuplet 3/2 {g bes d} f d \tuplet 3/2 {es g bes} d c d des~ des4 c8 ces \break
  bes g \tuplet 3/2 {aes bes aes} g bes c g des'4 g,8 c~ c4 r R1 es~ \bar "||" \break
  \mark \default
  es a,8 bes es bes a ges es4 g r aes8 g f^\markup { \NWS-box \tiny "No.1" } es d c b d g aes g f \break
es g b c d b c d f4 d8 es c2 r8 \tuplet 3/2 {des16^\markup { \NWS-box \tiny "No.1" } c bes} a8 c bes f aes fis g aes bes g aes bes16 aes g8 f \bar "||" \break
es b \tuplet 3/2 {c es g} bes aes r4 r8 g16 aes g8 f es ces bes aes g bes g bes f' es r4 r2 r4 r8 c \break
f c g' gis a f bes b c a \tuplet 3/2 {bes c bes} a f d c f4^\markup { \NWS-box \tiny "No.3" } \tuplet 3/2 {aes8 c f} e c aes f r4 r8 es~ es cis d cis \bar "||" \break
c b bes aes g bes c d f d es f g bes c4 r r8 d16 c b4. aes8 g ges f^\markup { \NWS-box \tiny "No.1" } es d c b d \break
f aes g f es4. g16 b d8 b c g~ g2 r bes,^\markup { \NWS-box \tiny "No.2" } bes4 c8 des es f aes g \break
r f e d es c \tuplet 3/2 {es g bes} \bar "||" aes bes16 aes g8 f es ces bes aes g bes c d f d \tuplet 3/2 {es g bes} d4 r8 des~ des4 c8 a \break
bes4 r g8 aes bes c des4 g,8 c~ c4. g8 aes e c' aes g4 bes8 f r bes, c d es f g aes \bar"||" \break
\mark \default
bes g aes fis g4 bes,8 c~ c4 r r2 r g'8 aes g f^\markup { \NWS-box \tiny "No.1" } es d c bes b aes' g f \break
es g a b d4. b8 c g~ g4 r2 \tuplet 3/2 {des'8^\markup { \NWS-box \tiny "No.1" } c bes} a c bes4 r8 des~ \tuplet 3/2 {des c bes} a c bes f aes fis \break
g aes bes g aes bes16 aes g8 f es ces bes aes g bes c d f d es f g bes~ bes4 r2 r8 d es e \break
f a, bes b c f, g gis \tuplet 3/2 {a g e} \xNotesOn \tuplet 3/2 {c a g} \xNotesOff r2 r8 c f g aes bes16 aes g8 f bes a aes bes g f d bes \break
f' \xNotesOn c' \xNotesOff es, f g bes c es~ es4 d8 c bes g es c f4 r r2 r2 r4 r8 g \break
c2 g8 c~ c4~ c4. g8 c4. f,8 bes2. r4 aes8 bes16 aes g8 ges r f' e d \break
es c des b c a bes g \tuplet 3/2 {aes bes aes} g f es ces bes aes g bes c d f d \tuplet 3/2 {es g bes} d4 r r8 des4 ces8 \break
bes g aes bes16 aes g4 r \tuplet 3/2 {g8 aes g} f es e4 r8 c f aes g f bes4 g8 es r f g \acciaccatura aes bes~ bes g \tuplet 3/2 {aes16 bes aes} fis8 \break
g4 bes,8 c~ c2 \fine
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
