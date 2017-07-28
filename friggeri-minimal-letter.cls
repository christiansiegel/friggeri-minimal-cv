\ProvidesClass{friggeri-minimal-letter}[2017/07/28 letter class]
\NeedsTeXFormat{LaTeX2e}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrlttr2}}
\ProcessOptions\relax
\LoadClass[fontsize=11pt, version=last]{scrlttr2}

%%%%%%%%%%
% Colors %
%%%%%%%%%%

\RequirePackage{xcolor}

\definecolor{gray}{HTML}{4D4D4D}

\colorlet{textcolor}{gray}
\colorlet{headercolor}{black}

\AtBeginDocument{\color{textcolor}}

%%%%%%%%%
% Fonts %
%%%%%%%%%

\RequirePackage[quiet]{fontspec}

\newfontfamily\regularfont[]{HelveticaNeue.ttf}
\newfontfamily\thinfont[]{HelveticaNeue-UltraLight.ttf}
\newfontfamily\boldfont[]{HelveticaNeue-Bold.ttf}

\defaultfontfeatures{Mapping=tex-text}
\setmainfont[Mapping=tex-text,
  BoldFont=HelveticaNeue-Bold.ttf,
  ItalicFont=HelveticaNeue-LightItalic.ttf
]{HelveticaNeue-Light.ttf}
\setkomafont{backaddress}{\boldfont}

%%%%%%%%%%%%%%%%%%%%
% Sender data etc. %
%%%%%%%%%%%%%%%%%%%%

\def\firstname#1{\gdef\@firstname{#1}}
\def\lastname#1{\gdef\@lastname{#1}}
\def\addressline#1{\gdef\@addressline{#1}}
\def\phone#1{\gdef\@phone{#1}}
\def\email#1{\gdef\@email{#1}}
\def\date#1{\gdef\@date{#1}}
\def\place#1{\gdef\@place{#1}}

\setkomavar{fromname}{\@firstname~\@lastname}
\setkomavar{fromaddress}{\@addressline}
\setkomavar{fromphone}{\@phone}
\setkomavar{fromemail}{\@email}
\setkomavar{place}{\@place}
\setkomavar{date}{\@date}
\setkomavar{signature}{\@firstname~\@lastname}

%%%%%%%%%%
% Header %
%%%%%%%%%%

\RequirePackage{tikz}
\RequirePackage[hidelinks]{hyperref}

\setkomavar{firsthead}{
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, anchor=north, minimum width=\paperwidth, minimum height=4cm] (box) at (current page.north){};
    \node [anchor=center, text=headercolor] (name) at (box) {%
      \fontsize{30pt}{72pt}
      {\thinfont \@firstname}~~~{\regularfont \@lastname}
    };
    \node [anchor=north, align=center, text=headercolor] at (name.south) {%
      \thinfont \@addressline\\
      \thinfont \@phone~~|~~\href{mailto:\@email}{\@email}
    };
  \end{tikzpicture}
}

%%%%%%%%%%%%%%%%
% Other tweaks %
%%%%%%%%%%%%%%%%

\RequirePackage[english,ngerman]{babel}
\RequirePackage{blindtext}
\renewcommand*{\raggedsignature}{\raggedright}

