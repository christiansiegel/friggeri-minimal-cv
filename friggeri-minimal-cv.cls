\ProvidesClass{friggeri-minimal-cv}[2017/07/27 CV class]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
\LoadClass[a4paper]{article}

%%%%%%%%%%
% Colors %
%%%%%%%%%%

\RequirePackage{xcolor}

\definecolor{gray}{HTML}{4D4D4D}
\definecolor{lightgray}{HTML}{999999}
\definecolor{orange}{HTML}{FDA333}

\colorlet{textcolor}{gray}
\colorlet{headercolor}{black}
\colorlet{sectionheadercolor}{black}
\colorlet{bulletcolor}{orange}

%%%%%%%%%
% Fonts %
%%%%%%%%%

\RequirePackage[quiet]{fontspec}
\RequirePackage[math-style=TeX,vargreek-shape=unicode]{unicode-math}
 
\newfontfamily\bodyfont[]{HelveticaNeue.ttf}
\newfontfamily\lightfont[]{HelveticaNeue-Light.ttf}
\newfontfamily\thinfont[]{HelveticaNeue-UltraLight.ttf}
\newfontfamily\headingfont[]{HelveticaNeue-CondensedBold.ttf}
 
\defaultfontfeatures{Mapping=tex-text}
\setmainfont[Mapping=tex-text,
  BoldFont=HelveticaNeue-Bold.ttf,
  ItalicFont=HelveticaNeue-LightItalic.ttf
]{HelveticaNeue-Light.ttf}

\AtBeginDocument{\color{textcolor}}

%%%%%%%%%
% Stars %
%%%%%%%%%

\RequirePackage{xifthen}

\newcommand{\blackstar}[1]{%
  \ifthenelse{\equal{#1}{1}}%
    {\includegraphics[height=\fontcharht\font`\B]{icons/black-star.pdf}}%
    {\includegraphics[height=\fontcharht\font`\B]{icons/black-star-empty.pdf}}}

\newcommand{\orangestar}[1]{%
  \ifthenelse{\equal{#1}{1}}%
    {\includegraphics[height=\fontcharht\font`\B]{icons/orange-star.pdf}}%
    {\includegraphics[height=\fontcharht\font`\B]{icons/orange-star-empty.pdf}}}

\newcommand{\starkern}{\kern.05em}

\newcommand{\ratingOutOfThree}[1]{%
  \ifthenelse{\equal{#1}{0}}{\orangestar{0}\starkern\orangestar{0}\starkern\orangestar{0}}{}%
  \ifthenelse{\equal{#1}{1}}{\orangestar{1}\starkern\orangestar{0}\starkern\orangestar{0}}{}%
  \ifthenelse{\equal{#1}{2}}{\orangestar{1}\starkern\orangestar{1}\starkern\orangestar{0}}{}%
  \ifthenelse{\equal{#1}{3}}{\orangestar{1}\starkern\orangestar{1}\starkern\orangestar{1}}{}}

\newcommand{\ratingUpToThree}[1]{%
  \ifthenelse{\equal{#1}{0}}{}{}%
  \ifthenelse{\equal{#1}{1}}{\orangestar{1}}{}%
  \ifthenelse{\equal{#1}{2}}{\orangestar{1}\starkern\orangestar{1}}{}%
  \ifthenelse{\equal{#1}{3}}{\orangestar{1}\starkern\orangestar{1}\starkern\orangestar{1}}{}}
 
%%%%%%%%%%
% Header %
%%%%%%%%%%

\RequirePackage{tikz}

\newcommand{\header}[3]{%
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, anchor=north, minimum width=\paperwidth, minimum height=4cm] (box) at (current page.north){};
    \node [anchor=center, text=headercolor] (name) at (box) {%
      \fontsize{40pt}{72pt}
      {{\thinfont #1}~~~{\bodyfont  #2}}
    };
    \node [anchor=north, align=center, text=textcolor] at (name.south) {%
      \fontsize{11pt}{11pt}%
      {\lightfont #3}
    };
  \end{tikzpicture}
  \vspace{2.5cm}
  \vspace{-2\parskip}
}

%%%%%%%%%%%%%
% Structure %
%%%%%%%%%%%%%

\RequirePackage{parskip}

\renewcommand{\section}[1]{
  \par\vspace{\parskip}
  {%
    \LARGE\headingfont\color{sectionheadercolor}%
    #1
  }
  \par\vspace{\parskip}
}

\pagestyle{empty}

%%%%%%%%%%%%%%%%%%%%
% List environment %
%%%%%%%%%%%%%%%%%%%%

\setlength{\tabcolsep}{0pt}
\renewcommand{\bfseries}{\headingfont\color{textcolor}}

\newcommand{\cbullet}{%
  \textcolor{bulletcolor}{\bullet}}

\newenvironment{entrylist}{%
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}rl}
}{%
  \end{tabular*}
}

\newcommand{\yearentry}[4]{%
  #1&\parbox[t]{12.0cm}{%
    \textbf{#2}%
    \hfill%
    {\addfontfeature{Color=lightgray} #3}\\%
    #4\vspace{\parsep}%
  }\\}

\newcommand{\monthentry}[4]{%
  #1&\parbox[t]{11.0cm}{%
    \textbf{#2}%
    \hfill%
    {\addfontfeature{Color=lightgray} #3}\\%
    #4\vspace{\parsep}%
  }\\}

\newcommand{\shortmonthentry}[3]{%
  #1&\parbox[t]{11.0cm}{%
    \textbf{#2}%
    \hfill%
    {\addfontfeature{Color=lightgray} #3}\vspace{\parsep}
  }\\}


\newenvironment{undatedentrylist}{%
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}l}
}{%
  \end{tabular*}
}

\newcommand{\undatedentry}[3]{%
  \parbox[t]{\textwidth}{%
    \textbf{#1}%
    \hfill%
    {\addfontfeature{Color=lightgray} #2}\\%
    #3\vspace{\parsep}%
  }\\}

\newcommand{\subheader}[1]{%
  {\normalfont{|}} \textcolor{lightgray}{#1}}

\newcommand{\gpa}[1]{%
  {\normalfont{|}} \normalfont{\textcolor{lightgray}{#1}}}

%%%%%%%%%%%%%%
% Side block %
%%%%%%%%%%%%%%

\RequirePackage[absolute,overlay]{textpos}

\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}

\newenvironment{aside}{%
  \let\oldsection\section
  \renewcommand{\section}[1]{
    \par\vspace{\baselineskip}{\Large\headingfont\color{sectionheadercolor} ##1}
  }
  \begin{textblock}{3.6}(1.5, 4.33)
  \begin{flushleft}
  \obeycr
}{%
  \restorecr
  \end{flushleft}
  \end{textblock}
  \let\section\oldsection
}

\newcommand{\sideblockspace}{%
  \vspace*{0.5ex}}

\newcommand{\leftheader}[2]{%
  \textcolor{lightgray}{#1}\enspace#2}

\newcommand{\levelheader}[1]{%
  \sideblockspace\textcolor{lightgray}{#1}}

\newcommand{\levelheaderrated}[2]{%
  \sideblockspace\ratingUpToThree{#2}~\textcolor{lightgray}{#1}}

%%%%%%%%%%%%%%%%
% Other tweaks %
%%%%%%%%%%%%%%%%

\RequirePackage[left=5.35cm,top=2cm,right=1.5cm,bottom=2.4cm,nohead,nofoot]{geometry}
\RequirePackage[hidelinks]{hyperref}
