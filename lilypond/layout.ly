\version "2.25.25"

acMin = #(ly:wide-char->utf-8 #x2212)
acMaj = #(ly:wide-char->utf-8 #x25B3)
acEmptyset = #(ly:wide-char->utf-8 #x00f8)
acFlat = #(ly:wide-char->utf-8 #x266d)
acSharp = #(ly:wide-char->utf-8 #x266f)

chExceptionMusic = {
  <c es ges>1-\markup { \sub "dim." } % :dim
  <c es g>-\markup { \sub \acMin #"" } % :m

% minor third chords - 4 notes
  <c es ges beses>-\markup \sub { "7dim" } % :dim7
  <c es gis>-\markup \sub { \acMin #"aug" } % :m5+ (Ab/C)	
  <c es g a>-\markup \sub { \acMin #"6" } % :m6            
  <c es ges bes>-\markup \sub { \acEmptyset #"7" } % :m7.5-         
  <c es g bes>-\markup \sub { \acMin #"7" } % :m7            
  <c es gis bes>-\markup \sub { \acMin #"7" \acSharp "5" } % :m7.5+         
  <c es g b>-\markup \sub { \acMin #"M7" } % :m7+           
  <c es g d'>-\markup \sub { \acMin #"add9" } % :m5.9
	
% minor third chords - 5+ notes
  <c es g a d'>-\markup \sub { \acMin #"6/9" } % :m6.9
  <c es g bes des'>-\markup \sub { \acMin #"7" \acFlat #"9" } % :m7.9-
  <c es g bes d'>-\markup \sub { \acMin #"9" } % :m9
  <c es ges bes d'>-\markup \sub { \acMin #"9" \acFlat #"5" } % :m9.5-
  <c es g b d'>-\markup \sub { \acMin #"9(M7)" } % :m9.7+
  <c es g bes dis'>-\markup \sub { \acMin #"7" \acSharp #"9" } % :m7.9+
  <c es g bes f'>-\markup \sub { \acMin #"7(add 11)" } % :m7.11
  <c es g bes a'>-\markup \sub { \acMin #"7(add 13)" } % :m7.13
  <c es g bes d' f'>-\markup \sub { \acMin #"11" } % :m11
  <c es ges bes d' f'>-\markup \sub { \acMin #"11" \acFlat #"5" } % :m11.5-
  <c es g bes d' f' a'>-\markup \sub { \acMin #"13" } % :m13

% major third chords - 3 notes
  <c e ges>-\markup \sub { \acFlat "5" } % :5-
  <c e gis>-\markup \sub { "aug" } % :aug

% major third chords - 4 notes
  <c e g a d'>-\markup \sub {
	  "6"
	  \hspace #-0.5 \raise #0.7 \tiny "/"
	  \hspace #-0.5 \tiny "9"
	}	% :6.9
  <c e g bes>-\markup \sub { "7" } % :7
% special chords
  <c e g bes c'>-\markup \sub { "7(Alt)" } % :c:8
  <c e g b>-\markup \sub { \acMaj #"7" } % :maj
  <c e ges b>-\markup \sub { \acMaj #"7>5" } % :maj.5-
  <c e gis b>-\markup \sub { \acMaj #"7<5" } % :maj.5+
	
  <c e ges bes>-\markup \sub { "7(>5)" } % :7.5-
  <c e gis bes>-\markup \sub { "7(<5)" } % :7.5+
  <c e g d'>-\markup \sub { "add9" } % :5.9

% major third chords - 5+ notes
  <c e g b d'>-\markup \sub { \acMaj #"9" } % :maj9
  <c e g bes des'>-\markup \sub { #"7" \acFlat #"9" } % :9-
  <c e ges bes des'>-\markup \sub { "alt" #"7" #">9" #">5" } % :9-.5-
  <c e gis bes des'>-\markup \sub { "alt" #"7" #">9" #"<5" } % :9-.5+
  <c e g bes d' fis'>-\markup \sub { "9(<11)" } % :9.11+
  <c e g bes dis'>-\markup \sub { "7(<9)" } % :9+
  <c e ges bes dis'>-\markup \sub { "alt" #"7" #"<9" #">5" } % :9+.5-
  <c e gis bes dis'>-\markup \sub { "alt" #"7" #"<9" #"<5" } % :9+.5+
  <c e g bes fis'>-\markup \sub { "7(<11)" } % :7.11+
  <c e g bes aes'>-\markup \sub { "7(>13)" } % :7.13-
  <c e g b d' f'>-\markup \sub { \acMaj #"11" } % :maj11
  <c e g b d' a' >-\markup \sub { \acMaj #"13" } % :maj13 
  <c e g bes d' a' >-\markup \sub { "13" } % :13 
  <c e g bes des' a' >-\markup \sub { "13(>9)" } % :13.9-

% sustained chords
  <c d g>-\markup \sub { "sus2" } % :sus2
  <c f g>-\markup \sub { "sus" } % :sus4
  <c f g bes>-\markup \sub { "7sus" }  % :sus4.7
  <c f g bes d'>-\markup \sub { "9sus" }  % :sus4.7.9
  <c f g dis'>-\markup \sub { "<9sus" }  % :sus4.9+
}

chExceptions = #(sequential-music-to-chord-exceptions chExceptionMusic #t)

\header {
  tagline = #f
}

\paper {
  system-system-spacing.minimum-distance = 16
  property-defaults.fonts.serif = "NewComputerModern Math"
  indent = 0.0
}

\layout {
  \context {
    \ChordNames
    chordNameExceptions = #chExceptions
    majorSevenSymbol = \markup { \whiteTriangleMarkup "7" }
    minorChordModifier = \markup { \sub #(ly:wide-char->utf-8 #x8722) }
    noChordSymbol = ""
    \override ChordName.font-name = #"NewComputerModern Math"
    \override ChordName.font-size = 0.5
    \override VerticalAxisGroup.nonstaff-relatedstaff-spacing =
        #'((basic-distance . 5.5) (minimum-distance . 5))
    % \override ChordName.extra-offset = #'(0 . 1.7) % (X . Y)
  }
  \context {
    \Staff
    beamExceptions = #'()
    beatStructure = 1,1,1,1
  }
  \context {
    \Voice
    \consists Horizontal_bracket_engraver
    \override HorizontalBracket.bracket-flare = #'(0 . 0)
    \override HorizontalBracket.thickness=2
  }
}
