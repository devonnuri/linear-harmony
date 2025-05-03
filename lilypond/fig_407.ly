\version "2.25.25"

\include "layout.ly"

\layout {
  \context {
    \ChordNames
    \override VerticalAxisGroup.nonstaff-relatedstaff-spacing =
        #'((basic-distance . 6) (minimum-distance . 6))
  }
}

\score {
<<
  \chords {
    d1:7 r g:7 r c:7 r f:7 r bes
  }
  \new Staff \relative c' {
    \key bes \major
    % c'4^\markup {"(A" \hspace #-0.5 \sub {"−7"}} b a g fis^\markup {"D" \hspace #-0.5 \sub {"7"} \hspace #-0.5 ")"} e d c b2 d f a \break
    fis1 a d,4^\markup {"(D" \hspace #-0.5 \sub {"−7"}} f a c b^\markup {"G" \hspace #-0.5 \sub {"7"} \hspace #-0.5 ")"} a g f \break
    e1 g c,4^\markup {"(C" \hspace #-0.5 \sub {"−7"}} es! g bes a^\markup {"F" \hspace #-0.5 \sub {"7"} \hspace #-0.5 ")"} g f es
    \bar "||"
    d2 r
    \bar "||"
  }
>>
\layout {}
\midi {\tempo 4 = 180}
}
