%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                  %%
%%                        CLASS DECLARATIONS                        %%
%%                                                                  %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}

\ProvidesClass{mcs}

\def\currentsemester{spring14}

\newif\ifshowproblems
\showproblemstrue

\newif\ifshowsolutions
\showsolutionsfalse

\newif\ifshowstaffnotes
\showstaffnotesfalse

\newif\ifshoweditingnotes
\showeditingnotesfalse

\newif\ifproblemsinbook
\problemsinbookfalse

\let\@class@option@file\@empty

\DeclareOption{book}{%
    \PassOptionsToClass{oneside,11pt}{book}%
}

\DeclareOption{ftl}{%
    \AtBeginDocument{%
        \hidesolutions
        \renewcommand{\@pinput}[2][]{\endgroup}%
        \renewcommand{\baselinestretch}{3}%
%        \normalbaselineskip=\baselinestretch\normalbaselineskip
        \baselineskip=\baselinestretch\baselineskip
        \showproblemsfalse
    }%    
}

\newif\ifftlbranch
\ftlbranchfalse

\DeclareOption{ftlbranch}{%
    \ftlbranchtrue
    \showproblemsfalse
}

\renewcommand{\normalbaselines}{%
    \renewcommand{\baselinestretch}{1}%
%    \normalbaselineskip=\baselinestretch\normalbaselineskip
    \baselineskip=\normalbaselineskip
}

\newif\if@usecolor@
\@usecolor@true

\DeclareOption{usecolor}{%
    \@usecolor@true
}

\DeclareOption{nocolor}{%
    \@usecolor@false
}

\DeclareOption{handout}{%
    \PassOptionsToClass{11pt}{book}
    \def\@class@option@file{handout}%
}

\DeclareOption{quiz}{%
    \ExecuteOptions{handout}%
    \def\@class@option@file{quiz}%
}

\DeclareOption{problem}{%
    \def\@class@option@file{problem}%
}

\DeclareOption{problems}{%
    \def\@class@option@file{problems}%
}

\DeclareOption{debug}{%
    \tracingoutput=1
    \showboxbreadth=2147483647
    \showboxdepth=\showboxbreadth
}

\newif\if@figuredraft@
\@figuredraft@false

\DeclareOption{figuredraft}{%
    \@figuredraft@true
}

\newif\if@show@figure@fname@
\@show@figure@fname@false

\DeclareOption{figurefnames}{%
    \@show@figure@fname@true
}

\DeclareOption{exolinks}{%
    \AtBeginDocument{%
        \ClassInfo{mcs}{External document links enabled}%
        \let\Hy@setref@link\mcs@Hy@setref@link
    }%
}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}

\ExecuteOptions{book}

\ProcessOptions\relax

\LoadClass{book}[2005/09/16]

% We don't want to use the twoside option because that affects the
% margins in a way we don't want, but we do want \@twosidetrue for the
% rest of the book.

\@twosidetrue

%% Suppress page headings on blank pages

\def\cleardoublepage{%
    \clearpage
    \if@twoside
        \ifodd\c@page\else
            \thispagestyle{empty}%
            \hbox{}\newpage
            \if@twocolumn\hbox{}\newpage\fi
        \fi
    \fi
}

% %% Like \cleardoublepage but forces an even page.  Used by \part.
% 
% \def\cleardoublepageeven{%
%     \clearpage
%     \if@twoside
%         \ifodd\c@page
%             \thispagestyle{empty}%
%             \hbox{}\newpage
%             \if@twocolumn\hbox{}\newpage\fi
%         \fi
%     \fi
% }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                  %%
%%                        STANDARD PACKAGES                         %%
%%                                                                  %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\RequirePackage{enumerate}  %added by ARM 2/20/14

\RequirePackage{datetime}
\RequirePackage{ifthen}
\RequirePackage{calc}
\RequirePackage{amsmath}
\RequirePackage{amsthm}
\RequirePackage{amssymb}
\RequirePackage{xspace}
\RequirePackage{graphicx}
\RequirePackage{epsfig}
\RequirePackage{psfrag}
\RequirePackage{keyval}
\RequirePackage[usenames,dvipsnames]{color}
\RequirePackage{subfig}
\RequirePackage{textcomp}
\RequirePackage{verbatim}
\RequirePackage{index}
%\RequirePackage{makeidx}

\RequirePackage{times}

\IfFileExists{mtpro2.sty}{%
    \let\Bbbk\relax
    \RequirePackage{mtpro2}%
}{%
    \ClassWarning{mcs}{Can't find MathTime fonts -- using CMR for math}%
}

\RequirePackage{xr-mcs}

\RequirePackage[
    bookmarksopen, 
    bookmarksnumbered,
    backref, 
    pagebackref,
    pdfpagemode=UseOutlines,
    % \if@usecolor@
        colorlinks=true,
        linktocpage=true,
        linkcolor=blue,
        citecolor=blue,
        urlcolor=blue,
    % \else
    %     colorlinks=false,
    %     linktocpage=true,
    %     linkcolor=black,
    %     citecolor=black,
    %     urlcolor=black,
    % \fi
]{hyperref}

% \RequirePackage{breakurl}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                  %%
%%                         LOW-LEVEL MACROS                         %%
%%                                                                  %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Normally LaTeX will complain if it encounters another
%% \documentclass command after the \begin{document}, but that
%% interferes with the special processing of problems.  The following
%% code removes \documentclass from the list of commands that can only
%% appear in the preamble.

\begingroup
    \def\do#1{%
        \ifx\documentclass#1\else\@onlypreamble#1\fi
    }
    
    \let\@tempa\@preamblecmds
    
    \global\let\@preamblecmds\@empty
    
    \@tempa
\endgroup

%% Now redefine \documentclass as a no-op.

\renewcommand{\documentclass}[2][]{}

%% Keyword processing: We want to disable certain special characters
%% inside the argument of \pkeywords and related macros.  This is
%% similar to LaTeX's \@sanitize, except that (a) We don't want the
%% space character to be touched and (b) we want some characters to
%% print as themselves so they can be used in keywords.

\def\@sanitize@keywords{%
    \@makeother\\%
    \@makeother\$%
    \@makeother\&%
    \@makeother\^%
    \@makeother\~%
    \catcode`\_=\active
    \catcode`\#=\active
    \catcode`\%=\active
}

\begingroup
    \catcode`\_=\active
    \catcode`\#=\active
    \catcode`\%=\active
    \gdef_{\_}
    \gdef%{\%}
    \gdef#{\#}
\endgroup

%% \gobble@text eats its argument in a safe way; \@bsphack and
%% \@esphack keep a use of the macro from inserting extra horizontal
%% space in certain contexts.

\newcommand{\gobble@text}{%
    \@bsphack
    \begingroup
        \@sanitize@keywords
        \@gobble@text
}

\newcommand{\@gobble@text}[1]{%
        \endgroup
    \@esphack
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                  %%
%%                       EDITING ANNOTATIONS                        %%
%%                                                                  %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\illegible}{%
    \textcolor{red}{\textbf{[Illegible]}}%
}

\newcommand{\cutoff}{%
    \textcolor{red}{\textbf{[bottom line cut off]}}%
}

\newcommand{\highlight}[1]{\textcolor{red}{#1}}

\newcommand{\dmj}[1]{%
    \@bsphack
    \begingroup
        \normalbaselines
        \if@figuredraft@
            \marginpar{\textcolor{orange}{\textup{[#1---dmj]}}}%
        \fi
    \endgroup
    \@esphack
}

\newcommand{\dmjadd}{\textcolor{orange}}

\newcommand{\ftl}[1]{%
    \@bsphack
    \begingroup
        \normalbaselines
        \if@figuredraft@
            \marginpar{\textcolor{blue}{\textup{[#1---ftl]}}}%
        \fi
    \endgroup
    \@esphack
}

\newcommand{\arm}[1]{}

% \newcommand{\arm}[1]{%
%     \if@figuredraft@
%         \textcolor{Maroon}{#1---ARM}%
%     \fi
% }

% \newcommand{\arm}[1]{%
%     \@bsphack
%     \begingroup
%         \normalbaselines
%         \marginpar{\normalbaselines\textcolor{red}{\textup{[#1---arm]}}}%
%     \endgroup
%     \@esphack
% }

\reversemarginpar

\def\@marginparreset{%
    \reset@font
    \normalsize
    \raggedright
    \@setminipage
}

\marginparsep15pt
\marginparwidth 2in
\advance\marginparwidth by -2\marginparsep

\let\restore@saved@counters\@empty

\def\savesomecounters{%
    \begingroup
        \xdef\restore@saved@counters{%
            \global\c@part\the\c@part\relax
            \global\c@chapter\the\c@chapter\relax
            \global\c@section\the\c@section\relax
            \global\c@subsection\the\c@subsection\relax
            \global\c@subsubsection\the\c@subsubsection\relax
            \global\c@paragraph\the\c@paragraph\relax
        }%
    \endgroup
}

\def\restoresomecounters{%
    \restore@saved@counters
    \global\let\restore@saved@counters\@empty
}

\def\beginhighlighteddiffs#1{%
    \color{#1}%
}

\def\endhighlighteddiffs{%
    \color{black}%
}

\newwrite\@chapprobs

%% Add a .probs file for each included file.

\def\@include#1 {%
    \clearpage
    \if@filesw
        \immediate\write\@mainaux{\string\@input{#1.aux}}%
    \fi
    \@tempswatrue
    \if@partsw
        \@tempswafalse
        \edef\reserved@b{#1}%
        \@for\reserved@a:=\@partlist\do
            {\ifx\reserved@a\reserved@b\@tempswatrue\fi}%
    \fi
    \if@tempswa
        \let\@auxout\@partaux
        \if@filesw
            \immediate\openout\@partaux #1.aux
            \immediate\write\@partaux{\relax}%
            \immediate\openout\@chapprobs #1.probs
            \immediate\write\@chapprobs{\relax}%
        \fi
        \@input@{#1.tex}%
        \if@filesw
            \immediate\closeout\@chapprobs
        \fi
        \ifftlbranch\else
            \@input@{#1.probs}%
            \clearpage
        \fi
        \@writeckpt{#1}%
        \if@filesw
            \immediate\closeout\@partaux
            \immediate\closeout\@chapprobs
        \fi
    \else
        \deadcycles\z@
        \@nameuse{cp@#1}%
    \fi
    \let\@auxout\@mainaux
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                  %%
%%                    CONDITIONAL TEXT INCLUSION                    %%
%%                                                                  %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Originally \inbook was defined as \@firstofone, but that causes
%% problems if a comment environment is put inside an \inbook, so I
%% changed \inbook to \@empty.  This means the braces surrounding the
%% argument are left in, so an extra level of grouping is introduced,
%% but that shouldn't be a problem.

\let\inbook\@empty
\let\inhandout\gobble@text
\let\inmcsprob\gobble@text

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                  %%
%%                       EXTERNAL REFERENCES                        %%
%%                                                                  %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Can't use \let here because of hyperref.

\def\bref{\ref}
%\def\bcite{\cite}

\newcount\ref@chapter

\def\get@ref@chapter#1{%
    \afterassignment\remove@to@nnil
    \ref@chapter=0#1 \@nnil
}

\def\mcs@Hy@setref@link#1#2#3#4#5#6\@nil#7{%
  \begingroup
    \get@ref@chapter{#1}%
    \ifnum\c@chapter = \ref@chapter
        \toks0={\hyper@@link{#5}{#4}}%
        \toks1=\expandafter{#7{#1}{#2}{#3}{#4}{#5}}%
    \else
        \toks0={\hyper@@link{\courseurl/mcs.pdf}{#4}}%
        \toks1=\expandafter{#7{#1}{#2}{#3}{#4}{\courseurl/mcs.pdf}}%
    \fi
    \edef\x{\endgroup
      \the\toks0 {\the\toks1 }%
    }%
  \x
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                  %%
%%                             INDEXING                             %%
%%                                                                  %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\idx}[1]{\index{#1}#1}

\ifftlbranch
    \newcommand{\printchapindex}[1]{}
\else
    \newcommand{\printchapindex}[1]{%
        \begingroup
            \def\@indextype{default}%
            \let\index@prologue\@empty
            \@input@{#1.ind}%
        \endgroup
    }
\fi

\newcommand*\seealso[2]{\emph{see also} #1}

\newcommand{\printchapglossary}[1]{%
    \begingroup
        \def\@indextype{glo}%
        \let\index@prologue\@empty
        \@input@{#1.gnd}%
    \endgroup
}

\renewenvironment{theindex}{%
    \edef\indexname{\the\@nameuse{idxtitle@\@indextype}}%
    \if@twocolumn
        \@restonecolfalse
    \else
        \@restonecoltrue
    \fi
    \columnseprule \z@
    \columnsep 35\p@
    \twocolumn[%
        \phantomsection
        \addcontentsline{toc}{chapter}{\indexname}%
        \@makeschapterhead{\indexname}%
        \ifx\index@prologue\@empty\else
            \index@prologue
            \bigskip
        \fi
    ]%
    \@mkboth{\MakeUppercase\indexname}%
            {\MakeUppercase\indexname}%
    \thispagestyle{plain}%
    \parindent\z@
    \parskip\z@ \@plus .3\p@\relax
    \let\item\@idxitem
}{%
    \if@restonecol
        \onecolumn
    \else
        \clearpage
    \fi
}

\newcommand{\glossaryname}{Glossary}%

\newindex{glo}{gdx}{gnd}{\glossaryname}

\renewcommand{\glossary}{\index[glo]}

\newenvironment{theglossary}{%
    \cleardoublepage
    \thispagestyle{plain}%
    \phantomsection
    \addcontentsline{toc}{chapter}{\glossaryname}%
    \@makeschapterhead{\glossaryname}%
    \@mkboth{\MakeUppercase\glossaryname}%
            {\MakeUppercase\glossaryname}%
    \parindent\z@
}{%
    \clearpage
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                  %%
%%                           BIBLIOGRAPHY                           %%
%%                                                                  %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewenvironment{thebibliography}[1]{
        \phantomsection
        \addcontentsline{toc}{chapter}{\bibname}%
        \@makeschapterhead{\bibname}%
        \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m
}{%
    \def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
     \endlist
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                  %%
%%                         SECTION HEADINGS                         %%
%%                                                                  %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\@sect#1#2#3#4#5#6[#7]#8{%
    \ifnum#2>\c@secnumdepth
        \let\@svsec\@empty
    \else
        \refstepcounter{#1}%
        \protected@edef\@svsec{\@seccntformat{#1}\relax}%
    \fi
    \@tempskipa #5\relax
    \ifdim\@tempskipa>\z@
        \begingroup
            \ifnum#2 = 1
                \parindent-\titlehang
                \parskip\z@
                \rule{\titlewidth}{0.5\p@}\par
                \nobreak
            \else
                \parindent\z@
            \fi
            \leavevmode
            #6{{\hskip #3\relax\@svsec}%
                \interlinepenalty\@M
                {#8\vphantom{y}}\@@par
               }%
        \endgroup
        \csname #1mark\endcsname{#7}%
        \addcontentsline{toc}{#1}{%
            \ifnum#2>\c@secnumdepth\else
                \protect\numberline{\csname the#1\endcsname}%
            \fi%
            #8%
        }%
    \else
        \def\@svsechd{%
            #6{\hskip #3\relax\@svsec #8}%
            \csname #1mark\endcsname{#7}%
            \addcontentsline{toc}{#1}{%
                \ifnum#2>\c@secnumdepth\else
                    \protect\numberline{\csname the#1\endcsname}%
                \fi
                #8%
            }%
        }%
    \fi
    \@xsect{#5}%
}

\def\@ssect#1#2#3#4#5{%
    \@tempskipa #3\relax
    \ifdim \@tempskipa>\z@
        \begingroup
            #4{\@hangfrom{\hskip #1}%
            \interlinepenalty \@M #5\@@par}%
        \endgroup
    \else
        \def\@svsechd{#4{\hskip #1\relax #5}}%
    \fi
    \@xsect{#3}%
}

%% Based on Cormen.cls

\def\section{%
    \@startsection{section}{1}{\z@}%
        {-22\p@}{12\p@}%
        {\normalfont\Large\bfseries\raggedright\mathversion{bold}}%
}

\def\subsection{%
    \@startsection{subsection}{2}{\z@}
        {-12\p@}{6\p@}
        {\normalfont\large\bfseries\raggedright\mathversion{bold}}%
}

\def\subsubsection{%
    \@startsection{subsubsection}
        {3}{\z@}{-10\p@}{6\p@}%
        {\normalfont\normalsize\bfseries\raggedright\mathversion{bold}}%
}

\def\paragraph{%
    \@startsection{paragraph}
        {4}{\z@}{-7\p@}{0.0001\p@}%
        {\reset@font\fontsize{10}{13}\selectfont\bfseries\itshape\raggedright\mathversion{bold}}%
}

\def\subparagraph{%
    \@startsection{subparagraph}
        {5}{\z@}{7\p@}{-0.5em}
        {\reset@font\normalsize\selectfont\bfseries\mathversion{bold}}%
}

\def\chapter{%
    \cleardoublepage
    \thispagestyle{plain}%
    \global\@topnum\z@
    \secdef\@chapter\@schapter
}

\def\@chapter[#1]#2{%
    \pagestyle{headings}%
    \ifnum\c@secnumdepth>\m@ne
        \refstepcounter{chapter}%
        \typeout{^^J\@chapapp\space\arabic{chapter}:}%
        \addcontentsline{toc}{chapter}{\protect\chapternumberline{\thechapter}#1}%
    \else
        \addcontentsline{toc}{chapter}{#1}%
    \fi
    \chaptermark{#1}%
    \@makechapterhead{#2}%
    \@afterindentfalse
    \@afterheading
}

\def\@schapter#1{%
%    \addcontentsline{toc}{prelims}{#1}%
    \chaptermark{#1}%
    \pagestyle{pet}%
    \thispagestyle{plain}%
    \@makeschapterhead{#1}%
    \@afterindentfalse
    \@afterheading
}

\def\@makechapterhead#1{%
    \chaptermark{#1}%
    \begingroup
        \raggedright
        \parindent-\titlehang
        \fontsize{18}{22}\bfseries\selectfont
        \rule{\titlewidth}{6pt}\par
        \vspace*{2pt}%
        \leavevmode
        \hb@xt@\titlehang{\thechapter\hfill}%
        #1\par
        \vspace*{11.49pt}%
    \endgroup
}

\def\@makeschapterhead#1{%
    \chaptermark{#1}%
    \pagestyle{pet}%
    \begingroup
        \raggedright
        \parindent-\titlehang
        \fontsize{18}{22}\bfseries\selectfont
        #1\par
        \vspace*{12.55pt}%
    \endgroup}

\def\part{%
    \cleardoublepage
    \thispagestyle{empty}\secdef\@part\@spart}

\def\@part[#1]#2{%
    \ifnum\c@secnumdepth>-2
        \refstepcounter{part}%
        \addcontentsline{toc}{part}{\protect\partnumberline{\thepart}#1}%
    \else
        \addcontentsline{toc}{part}{#1}%
    \fi
    \partmark{#1}%
    \begingroup
        \raggedright
        \parindent-\titlehang
        \vspace*{-13.8pt}\par
        \noindent\hspace*{-\titlehang}%
        \rule{\titlewidth}{6pt}\par
        \vspace*{130.78pt}%
        \rule{\titlewidth}{0.5pt}\par
%        \vspace*{11pt}\par
        \fontsize{18}{22}\selectfont\bfseries\itshape
        \thepart\hspace*{18pt}\ignorespaces#2\par
        \vspace*{12\p@}%
    \endgroup
    \@afterindentfalse
    \@afterheading
}

\def\@spart#1{%
    \addcontentsline{toc}{part}{#1}%
    \partmark{#1}
    \begingroup
        \parindent\z@
        \vspace*{16pt}
        {\fontsize{21}{23}\selectfont\hspace*{7pc}#1\par}
        %\cleardoublepage
    \endgroup
}

\def\partintro{%
    \cleardoublepage
    \thispagestyle{empty}
    \begingroup
        \vspace*{126pt}%
        \raggedright
        \parindent-\titlehang
        \Large\bfseries\selectfont
        \parskip\z@
        \rule{\titlewidth}{0.5\p@}\par
        \nobreak
        \leavevmode
        Introduction\par
        \vspace*{12.55pt}%
    \endgroup
    \@afterindentfalse
    \@afterheading
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                  %%
%%                        TABLE OF CONTENTS                         %%
%%                                                                  %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Sections, but not subsections

\setcounter{tocdepth}{1}

\def\tableofcontents{%
    \chapter*{\contentsname}%
    \thispagestyle{empty}%
    \markboth{Contents}{Contents}%
    \@starttoc{toc}%
}

\def\@dottedtocline#1#2#3#4#5{%
    \ifnum #1>\c@tocdepth \else
        \vskip \z@ \@plus.2\p@
        \begingroup
            \leftskip #2\relax
            \rightskip \@tocrmarg
            \parfillskip -\rightskip
            \parindent #2\relax
            \@afterindenttrue
            \interlinepenalty\@M
            \leavevmode
            \@tempdima #3\relax
            \advance\leftskip \@tempdima
            \null
            \nobreak
            \raggedright
            \hskip -\leftskip
            {#4}\nobreak
            \quad
            % \leaders\hbox{%
            %     $\m@th \mkern \@dotsep mu\hbox{.}\mkern \@dotsep mu$%
            % }\hfill
            % \nobreak
            \hb@xt@\@pnumwidth{\hfil\normalfont \normalcolor #5}%
            \par
        \endgroup
    \fi
}

\def\l@part{\@partdottedtocline{-2}{-\titlehang}{2em}}
\def\l@chapter{\@chapterdottedtocline{\m@ne}{0\p@}{2em}}
\def\l@section{\@dottedtocline{1}{2em}{2.5em}}

\def\partnumberline#1{\hb@xt@\@tempdima{\bfseries\itshape#1\hfil}}

% #1 = level
% #2 = indent
% #3 = numwidth
% #4 = title
% #5 = page number

\def\@partdottedtocline#1#2#3#4#5{%
    \ifnum #1>\c@tocdepth \else
        \goodbreak
        \vskip3\p@
        \begingroup
            \leftskip\z@ % #2\relax
            \rightskip \@tocrmarg
            \parfillskip -\rightskip
            \parindent #2\relax
            \@afterindenttrue
            \interlinepenalty\@M
            \leavevmode
            \@tempdima #3\relax
            \advance\leftskip \@tempdima
            \null
            \nobreak
            \hskip -\leftskip
            \rule{\titlewidth}{2pt}\par
            \vspace*{4pt}\par
            \hskip -\leftskip
            {\Large\bfseries\itshape#4\par}%
        \endgroup
        \vskip3pt
    \fi
}

\def\chapternumberline#1{\hb@xt@\@tempdima{\bfseries#1\hfil}}

\def\@chapterdottedtocline#1#2#3#4#5{%
    \ifnum #1>\c@tocdepth \else
        \vskip3\p@
        \begingroup
            \leftskip\z@ % #2\relax
            \rightskip \@tocrmarg
            \parfillskip -\rightskip
            \parindent #2\relax
            \@afterindenttrue
            \interlinepenalty\@M
            \leavevmode
            \@tempdima #3\relax
            \advance\leftskip \@tempdima
            \null
            \nobreak
            \raggedright
            \hskip -\leftskip
            {\large\bfseries#4\quad{\itshape#5}\par}%
        \endgroup
    \fi
    \vskip3pt
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                  %%
%%                          PAGE HEADINGS                           %%
%%                                                                  %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\headingfont}{\fontsize{9}{11}\selectfont\itshape}

\def\ps@headings{%
    \let\@oddfoot\@empty
    \let\@evenfoot\@empty
    \def\@oddhead{%
        \headingfont
        \rlap{\rightmark\vphantom{y}}%
        \hfill
        \thepage
    }%
    \def\@evenhead{%
        \headingfont
        \rlap{\leftmark\vphantom{y}}%
        \rlap{\hspace*{-\titlehang}\thepage}%
    }%
    \let\@mkboth\markboth
    \def\partmark##1{%
        \markboth{{Part \thepart\quad##1}}{{Part \thepart\quad##1}}%
    }
    \def\chaptermark##1{%
      \markboth{%
        \ifnum \c@secnumdepth >\m@ne
          \if@mainmatter
            \@chapapp\ \thechapter\quad
          \fi
        \fi
        ##1}{}}%
    \def\sectionmark##1{%
      \markright{%
        \ifnum \c@secnumdepth >\z@
          \thesection. \ %
        \fi
        ##1}}%
}

\def\ps@pet{%
    \let\@oddfoot\@empty
    \let\@evenfoot\@empty
    \def\@oddhead{%
        \headingfont
        \rlap{\rightmark\vphantom{y}}%
        \rlap{\hspace*{-\titlehang}\thepage}%
    }%
    \def\@evenhead{%
        \headingfont
        \rlap{\rightmark\vphantom{y}}%
        \rlap{\hspace*{-\titlehang}\thepage}%
    }%
    \let\@mkboth\markboth%
    \def\chaptermark##1{\markboth{{##1}}{{##1}}}%
    \def\chaptermark##1{\markright{{##1}}}%
}

\def\ps@plain{%
    \let\@oddfoot\@empty
    \let\@evenfoot\@empty
    \let\@oddhead\@empty
    \let\@evenhead\@empty
}

\ps@headings

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                  %%
%%                 TEXT/MATH ALIASES AND SHORTCUTS                  %%
%%                                                                  %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\XasWideAsY}[2]{%
    \begingroup
        \setbox\@tempboxa=\hbox{#2}%
        \hbox to \wd\@tempboxa{\hss#1\hss}%
    \endgroup
}

% \renewcommand{\eqref}[1]{Equation~\ref{#1}}

\newcommand{\stirling}{%
    \@ifstar{\@stirling()}{\@stirling\@empty\@empty}%
}

\newcommand{\@stirling}[3]{%
    \sqrt{2\pi #1#3#2} \paren{\frac{#3}{e}}^{#3}
}

\newenvironment{series}{%
    \vcenter\bgroup\centering
        \tabskip0pt
        \halign\bgroup
            \hfil $##$&${}##{}$&&\hfil $##$\hfil &${}##{}$\cr
}{%
        \crcr
        \egroup
    \egroup
}

%% This def gives better spacing.  We're going to get rid of it
%% anyway.

% \newcommand{\mfigure}[3]{%
%     \begin{figure}[h]
%         \resizebox{#1}{#2}{\includegraphics{#3}}
%     \end{figure}
% }

%  text highlighting

\RequirePackage[leftbars]{changebar}

\setlength{\changebarwidth}{10pt}
\setlength{\changebarsep}{0pt}
\setcounter{changebargrey}{75}

\def\nocentering{%
    \rightskip\z@
    \leftskip\z@
    \parindent 1em
    \parfillskip\@flushglue
    \let\\\@normalcr
}

\newenvironment{pagesidebar}[1][]{%
    \vbox#1\bgroup
        \nocentering
        \cbstart
}{%
        \cbend
        \vfill
    \egroup
}

\newenvironment{inlinesidebar}[1][]{%
        \cbstart
        \if###1##
            \medskip
        \else
            \noindent\textbf{\Large#1}\par
            \smallskip
        \fi
}{%
        \medskip
        \cbend
}



\newcounter{lowerroman}
\newenvironment{romanlist}
{\begin{list}{\roman{lowerroman}.}{\usecounter{lowerroman}}}
{\end{list}}

\newcommand{\floatingtextbox}[1]{%
  \begin{figure}[htbp]\redrawntrue
    \textbox{#1}
  \end{figure}%
}

\newcommand{\textbox}[1]{%
    \begin{trivlist}
        \item
        \advance\textwidth-2\fboxrule
        \advance\textwidth-2\fboxsep
        \linewidth\textwidth
        \fbox{%
            \vbox{%
                \hsize\textwidth
%                \setlength{\parindent}{3ex}
%                \setlength{\parskip}{\medskipamount}
                \vspace{0.5ex}%
                \ignorespaces#1\par%
                \vspace{0.5ex}%
            }%
        }%
    \end{trivlist}
}

\newcommand{\textboxtitle}[1]{%
    \begingroup
        \flushleft
        \mathversion{bold}%
        \textbf{\Large #1}%
        \medskip
    \endgroup
    \@afterindentfalse
    \@afterheading
}
 
\newcommand{\textboxheader}[1]{%
    \par
    \noindent{\reset@font\normalsize\bfseries#1\par}%
    \@afterindentfalse
    \@afterheading
    \medskip
}
 
%%% Ugly box of red text that we can't ignore for too long :) 

\newcommand{\TBA}[1]{\fbox{\textcolor{red}{\bf TBA - #1}}}

\DeclareRobustCommand{\term}{%
    \@ifstar\emph\idx@term
}

\newcommand{\idx@term}[1]{%
    \emph{\index{#1|textbf}#1}%
}

\newcommand{\SET}[1]{\textsc{#1}}
\newcommand{\STR}[1]{\texttt{#1}}
\newcommand{\CMD}[1]{\textsc{\bf#1}}

% Reverted from en-dash to em-dash under duress.

\ifftlbranch
    \newcommand{\edge}[2]{\{#1, #2\}}
\else
    \newcommand{\edge}[2]{\ang{#1\text{---}#2}}
\fi

%\newcommand{\edge}[2]{\{#1, #2\}}

\newcommand{\diredge}[2]{\ang{#1\! \to\! #2}}
\newcommand{\vertices}[1]{V(#1)}
\newcommand{\edges}[1]{E(#1)}
\newcommand{\leftbi}[1]{L(#1)}
\newcommand{\rightbi}[1]{R(#1)}
%\newcommand{\walkv}[1]{\vec{\mathbf{#1}}}
\newcommand{\walkv}[1]{\mathbf{#1}}
%\newcommand{\catv}[3]{#1\ang{#2}#3}
\newcommand{\catv}[3]{#1\:\widehat{#2}\: #3}
\newcommand{\merge}[2]{#1\;\widehat{\ }\: #2}
\newcommand{\gprod}[2]{#1 \mathbin{\Box} #2}
\newcommand{\conntd}[1]{\kappa(#1)}

%% Text -- Abbreviations

% \newcommand{\ie}{\emph{i.e.},\xspace}  %avoid
% \newcommand{\eg}{\emph{e.g.},\xspace}  %avoid

\newcommand{\ie}{that is,\xspace}
\newcommand{\eg}{for example,\xspace}

\newcommand{\etc}{etc.\@\xspace}

\newcommand{\IQ}{\text{IQ\@\xspace}}

%% Text -- Constructs

\newcommand{\hint}{\emph{Hint: }}
\newcommand{\brule}[1]{\underline{\hspace{#1}}}
%\newenvironment{optional}[1]{\small [Optional] #1}{}
\newenvironment{optional}[1]{\footnotesize [Optional] #1}{}
%\newenvironment{optional}{\begin{quotation}\small [Optional]}{\end{quotation}}
\newcommand{\smiley}{\texttt{:-)}}


%% Math -- General

\newcommand{\paren}[1]{\left(#1\right)}
\newcommand{\ang}[1]{\left\langle#1\right\rangle}
\newcommand{\brac}[1]{\left[#1\right]}
\newcommand{\mean}[1]{[\![#1]\!]}
\newcommand{\subst}[3]{#1[#2 := #3]}
\newcommand{\patch}[3]{#1[#2 \leftarrow #3]}

\newcommand{\sequence}[1]{\langle#1\rangle}

% A special-case of the use of angle brackets surrounding English
% text.  Cf. relations.tex.

\newcommand{\meta}[1]{%
    \ensuremath{\langle\text{#1}\rangle}%
}

\newcommand{\suchthat}{\mid}
\newcommand{\eqdef}{\mathbin{::=}}

%% This is ugly, but we'll argue about it later.

\renewcommand{\bar}[1]{\overline{#1}}

\newcommand{\setcomp}{}
\let\setcomp\bar

\newcommand{\mop}[1]{\mathop{#1}}
\newcommand{\mbin}[1]{\mathbin{#1}}
\newcommand{\mrel}[1]{\mathrel{#1}}
\newcommand{\mopt}[1]{\ensuremath{\mathop{\mathrm{#1}}}}
\newcommand{\mbint}[1]{\ensuremath{\mathbin{\mathrm{#1}}}}
\newcommand{\mrelt}[1]{\ensuremath{\mathrel{\mathrm{#1}}}}
\newcommand{\mtt}[1]{\mathtt{#1}}

%% Math -- Logic

\newcommand{\true}{\ensuremath{\mathbf{T}}}
\newcommand{\false}{\ensuremath{\mathbf{F}}}

\newcommand{\lgtrue}{\ensuremath{\mbox{\Large\textbf{T}}}}
\newcommand{\lgfalse}{\ensuremath{\mbox{\Large\textbf{F}}}}

\newcommand{\True}{\ensuremath{\mathbf{True}}}
\newcommand{\False}{\ensuremath{\mathbf{False}}}

\renewcommand{\And}{\wedge}
\newcommand{\conj}{\And}
\newcommand{\smand}{\And}
\newcommand{\AND}{\bigwedge}
\newcommand{\Land}{\AND}
\newcommand{\lgand}{\AND}

\newcommand{\Or}{\vee}
\newcommand{\disj}{\Or}
\newcommand{\smor}{\Or}
\newcommand{\OR}{\bigvee}
\newcommand{\Lor}{\OR} 
\newcommand{\lgor}{\OR}
\newcommand{\xor}{\oplus}

\renewcommand{\implies}{\longrightarrow}
\renewcommand{\iff}{\longleftrightarrow}
\newcommand{\bicond}{\longleftrightarrow}
\newcommand{\equivalent}{\Longleftrightarrow}
\newcommand{\qiff}{\quad \text{iff} \quad}
\newcommand{\qimplies}{\quad \text{implies} \quad}

\newcommand{\QOR}{\mbint{\textsc{or}}}
\newcommand{\LGQOR}{\mbint{\text{OR}}}
\newcommand{\QXOR}{\mbint{\textsc{xor}}}
\newcommand{\QAND}{\mbint{\textsc{and}}}
\newcommand{\LGQAND}{\mbint{\text{AND}}}
\newcommand{\QIMPLIES}{\mrelt{\textsc{implies}}}
\newcommand{\QIMP}{\QIMPLIES}
\newcommand{\QIFF}{\mbint{\textsc{iff}}}
\newcommand{\QNOT}{\mopt{\textsc{not}}}
\newcommand{\QNAND}{\mopt{\textsc{nand}}}
\newcommand{\QNOR}{\mopt{\textsc{nor}}}

\newcommand{\nand}{\mathbin{\mid}}

\newcommand{\Rule}[2]{%
    \[
        \begin{array}{c}
            #1 \\ \hline
            #2%
        \end{array}
    \]
}

\newcommand{\LabelRule}[3]{%
    \[
        \begin{array}{cr}
              #1 \\ \hline
            & \text{#3}\\
              #2
        \end{array}
    \]
}

\newcommand{\ruleref}[1]{Rule \ref{#1}}

%% Math -- Set theory

\newcommand{\set}[1]{\{ #1 \}}
\newcommand{\Set}[1]{\left\{ #1 \right\}}

\newcommand{\card}[1]{| #1 |}
\newcommand{\Card}[1]{\left| #1 \right|}

\newcommand{\lnth}[1]{|#1|}
\newcommand{\Lnth}[1]{right| #1 \right|}
\newcommand{\ident}[1]{\text{Id}_{#1}}

\newcommand{\union}{\cup}
\newcommand{\lgunion}{\bigcup}
\newcommand{\intersect}{\cap}
\newcommand{\lgintersect}{\bigcap}
\newcommand{\cross}{\times}
\newcommand{\compose}{\circ}
\newcommand{\composition}{\circ} 
%\newcommand{\power}{\mathcal{P}}
\newcommand{\power}{\mopt{pow}}
\newcommand{\restrict}{\upharpoonright}

\newcommand{\embed}[1]{\mathcal{#1}}

\newcommand{\bin}{\operatorname{bin}}

\let\by\times

\newcommand{\range}[1]{\operatorname{range}(#1)}
\newcommand{\domain}[1]{\operatorname{domain}(#1)}
\newcommand{\codomain}[1]{\operatorname{codomain}(#1)}
\newcommand{\graph}[1]{\operatorname{graph}(#1)}
\newcommand{\neighbors}[1]{\operatorname{N}(#1)}

%% Graph notation

%% Removed the \left and \right around the parens because they
%% introduce extra space, and no current uses need the larger
%% delimiters anyway.

\newcommand{\degr}[1]{\operatorname{deg}(#1)}
\newcommand{\indegr}[1]{\operatorname{indeg}(#1)}
\newcommand{\outdegr}[1]{\operatorname{outdeg}(#1)}

\newcommand{\dist}{\operatorname{dist}}
\newcommand{\dstuv}[3][]{\operatorname{\text{dist}_{#1}}\left(#2,#3\right)}
\newcommand{\minplusop}{\!\!\negthickspace\underset{\text{min+}}{\cdot}\negthickspace\!\!}
\newcommand{\minplus}{\text{min+}}

\newcommand{\dpth}[1]{\operatorname{depth}\left(#1\right)}

\newcommand{\weight}[1]{\operatorname{wgt}\left(#1\right)}


%% Math -- Languages

\newcommand{\emptystring}{\lambda}
\newcommand{\bins}{\ensuremath{\set{0,1}^*}}

%% Math -- Famous sets

\newcommand{\naturals}{\mathbb{N}}
\newcommand{\integers}{\mathbb{Z}}
\newcommand{\Zmod}[1]{\mathbb{Z}_{#1}}
\newcommand{\rationals}{\mathbb{Q}}
\newcommand{\reals}{\mathbb{R}}
\newcommand{\complexes}{\mathbb{C}}
\newcommand{\posints}{\integers^+}
\newcommand{\finbin}{\strings{\set{0,1}}}
\newcommand{\binw}{\infstrings{\set{0,1}}}
\newcommand{\twdone}{\mathbb{F}}

%% Math -- Arithmetic

\newcommand{\abs}[1]{\left|#1\right|}
\newcommand{\floor}[1]{\left\lfloor#1\right\rfloor}
\newcommand{\ceil}[1]{\left\lceil#1\right\rceil}
%\newcommand{\divides}{\mathbin{|}}
\newcommand{\divides}{\mid}
\newcommand{\ndivides}{\nmid}

\newcommand{\rem}[2]{\operatorname{rem}(#1,\ #2)}
\newcommand{\qcnt}[2]{\operatorname{qcnt}(#1,#2)}
%\newcommand{\pring}[1]{\Zmod{#1}}
\newcommand{\inzmod}[1]{\quad (\Zmod{#1})}
%\newcommand{\powermod}[3]{{#1}^{#2} \inzmod{#3}}
%\newcommand{\relpr}[1]{\operatorname{gcd1}\set{#1}}
\newcommand{\relpr}[1]{\Zmod{#1}^*}
\newcommand{\ordmod}[2]{\operatorname{ord}(#1,#2)}
\newcommand{\expof}[2]{\nu_#1(#2)}

\newcommand{\remainder}{\mopt{remainder}}
\newcommand{\quotient}{\mopt{quotient}}
\newcommand{\lcm}{\mopt{lcm}}

\newcommand{\fac}{\operatorname{fac}}
\newcommand{\fib}{\operatorname{fib}}

\newcommand{\GCD}{\operatorname{GCD}}
\newcommand{\Even}{\operatorname{Even}}

%% Misc. - taken from ln and cp to avoid multiply def'd ref's

%% Ick. [dmj]

\newcommand{\corresp}{\ \longleftrightarrow\ }
\newcommand{\prq}{\rightarrow}  %prerequisite
%\newcommand{\movesto}{\mathrel{\longrightarrow}}  %state machine transition
%\newcommand{\prns}{\set{\, \mtt{)},\, \mtt{(}\,}^*}

\def\sg{\text{Sg}}   %fictitious currency: Strong's
\newcommand{\mcents}{\text{\textcent}}

\newcommand{\strings}[1]{#1^*}
\newcommand{\infstrings}[1]{#1^\omega}
\newcommand{\brkts}{\strings{\set{\rhtbrk, \lefbrk}}}    %{\text{brkts}}
\newcommand{\cnt}[2]{\#_{#1}(#2)}
\newcommand{\rev}[1]{\operatorname{rev}(#1)}

\if@usecolor@
    \newcommand{\lefbrk}{\text{\textbf{\large \textcolor{red}{[\,}}}}
    \newcommand{\rhtbrk}{\text{\textbf{\large \textcolor{blue}{]\,}}}}
\else
    \newcommand{\lefbrk}{\text{\textbf{\large [\,}}}
    \newcommand{\rhtbrk}{\text{\textbf{\large ]\,}}}
\fi

\def\GC{\text{GoodCount}}
\def\RM{\text{RecMatch}}
\def\AM{\text{AmbRecMatch}}
\def\ES{\text{Erasable}}

\newcommand{\prns}{\text{prns}}

\newcommand{\aexp}{\text{Aexp}}

\newcommand{\meval}[2]{\mopt{eval}(#1,#2)}  %if changed, also update \text{eval}'s in text
\newcommand{\msubst}[2]{\mopt{subst}(#1,#2)}  %#2[x \leftarrow #1]}

\newcommand{\prodsym}{\ast}
\newcommand{\minussym}{\ensuremath{\mathop{\mathrm{\textbf{-}}}}}
\newcommand{\sumsym}{\ensuremath{\mathbin{\mathrm{\textbf{+}}}}}

\newcommand{\btg}{\text{binary-2PTG}}
\newcommand{\tg}{\text{2PTG}}
\newcommand{\ms}[1]{\operatorname{#1}}

\providecommand{\sg}{\ms{sg}}
\providecommand{\ide}{\ms{id}}
\providecommand{\EF}{\text{F18}}
%\providecommand{\T}{\ms{ST}}

\newcommand{\binnum}[1]{\operatorname{num}\left(#1\right)}
\newcommand{\binnumt}[1]{\operatorname{num}\left(\mathtt{#1}\right)}

\def\lexle{\mathrel{\preceq_{\text{lex}}}}
\newcommand{\lexls}{\mathrel{\prec_{\text{lex}}}}
\newcommand{\lexgr}{\mathrel{\succ_{\text{lex}}}}
\def\lex<{\mathrel{\prec_{\text{lex}}}}
\def\coordle{\mathrel{\preceq_{\text{c}}}}
\def\coord<{\mathrel{\prec_{\text{c}}}}

\newcommand{\inv}[1]{#1^{-1}}

\newcommand{\surj}{\mrelt{surj}}
\newcommand{\inj}{\mrelt{inj}}
\newcommand{\bij}{\mrelt{bij}}
\newcommand{\strict}{\mrelt{strict}}

\iffalse
\newcommand{\ms}[1]{\text{#1}}
\newcommand{\tg}{\text{2PTG}}
\newcommand{\fstlist}{\text{list-first}}
\newcommand{\rstlist}{\text{list-rest}}
\newcommand{\nillist}{\text{()}}
\newcommand{\nillistq}{\text{list-nil?}}
\newcommand{\List}{\text{List}}
\newcommand{\mklist}{\text{makelist}}

\newcommand{\mktree}{\text{maketree}}
\newcommand{\subtrees}{\text{subtrees}}
\newcommand{\mkleaf}{\text{makeleaf}}
\newcommand{\leafv}{\text{leaf-value}}
\newcommand{\leafq}{\text{leaf?}}
\fi

%% Math -- Probability

%% Parameters/Variables

\newcommand{\sspace}{\mathcal{S}}

\newcommand{\tails}{\mathtt{T}}
\newcommand{\heads}{\mathtt{H}}

\newcommand{\prob}[1]{\Pr[#1]}
%\newcommand{\prsub}[2]{\Pr_{#2}[#1]}
\newcommand{\prsub}[2]{\mathop{\textup{Pr}}_{#2}\nolimits\left\[#1\right\]}
%\newcommand{\prsub}[2]{\mathop{\text{Pr}}_{#2}\nolimits\left\[#1\right\]}

\let\pr\prob

\newcommand{\Prob}[1]{\Pr\left[\strut#1\right]}
\newcommand{\Prsub}[2]{\Pr_{#2}\left[#1\right]}

\newlength{\strutheight}

\newcommand{\prcond}[2]{%
    \ifinner
        \settoheight{\strutheight}{$#1 #2$}%
    \else
        \settoheight{\strutheight}{$\displaystyle#1 #2$}%
     \fi
    \Prob{
        #1\,\left|\protect\rule{0cm}{\strutheight}\right.\,#2
    }%
}

\newcommand{\Ex}{\operatorname{Ex}}

\newcommand{\expect}[1]{\Ex[#1]}
\newcommand{\expectsq}[1]{\Ex^2[#1]}

\newcommand{\Expect}[1]{\Ex\left[\strut#1\right]}
\newcommand{\Expectsq}[1]{\Ex^2\left[#1\right]}

\newcommand{\expcond}[2]{\expect{#1\mid#2}}

\newcommand{\Var}{\operatorname{Var}}

\newcommand{\variance}[1]{\Var[#1]}
\newcommand{\varsq}[1]{\Var^2[#1]}

\newcommand{\Variance}[1]{\Var\left[#1\right]}
\newcommand{\Varsq}[1]{\Var^2\left[#1\right]}

\newcommand{\Cov}{\operatorname{Cov}}

\newcommand{\covar}[1]{\Cov[#1]}
\newcommand{\covariance}[2]{\Cov[#1,#2]}

\newcommand{\Covar}[1]{\Cov\left[#1\right]}
\newcommand{\Covariance}[2]{\Cov\left[#1,#2\right]}

\newcommand{\pdf}{\textsc{PDF}}
\newcommand{\cdf}{\textsc{CDF}}

%% Miscellaneous

% counting.tex
\newcommand{\spa}{\spadesuit}
\newcommand{\hea}{\heartsuit}
\newcommand{\dia}{\diamondsuit}
\newcommand{\clu}{\clubsuit}

% induction.tex
\newcommand{\paexp}{\text{Aexp-parse-tree}}

% propositions.tex
\newcommand{\solves}{\text{Solves}}
\newcommand{\probs}{\text{Probs}}
\newcommand{\even}{\text{Evens}}
\newcommand{\primes}{\text{Primes}}

%% State machines

\def\movesto{\longrightarrow}
\newcommand{\while}{\text{\textbf{while}}}
\newcommand{\docomm}{\text{\textbf{do}}}
\newcommand{\odcomm}{\text{\textbf{od}}}
\newcommand{\wloop}[2]{\while\ #1\ \docomm\ #2\ \odcomm}
%\newcommand{\wpr}{\while\text{ program}}
\newcommand{\assigned}{\mathbin{\mathtt{:=}}}
\newcommand{\condif}{\text{\textbf{if}}}
\newcommand{\condthen}{\text{\textbf{then}}}
\newcommand{\condelse}{\text{\textbf{else}}}
\newcommand{\condcomm}[3]{\condif\ #1\ \condthen\ #2\ \condelse\ #3}
\newcommand{\seqcomm}[2]{#1\mathbf{;}#2}
\newcommand{\Env}{\text{Env}}
\newcommand{\halt}{\text{\textbf{Done}}}
\newcommand{\state}[2]{\ang{#1,\, #2}}
\newcommand{\step}[4]{\state{#1}{#2} \movesto \state{#3}{#4}}
\newcommand{\haltswith}[3]{\state{#1}{#2}\movesto^*  \state{\halt}{#3}}
\newcommand{\after}[3]{#1 \> \set{#2}\> #3}

\newcommand{\prcef}[3]%
{\textbf{action}: #1\\
\textbf{precondition}: #2\\
\textbf{effect}: #3}

% \newcommand{\iocode}[2]%
% {\textbf{IOCode}\\
% \textbf{group 1}: #1\\
% \textbf{group 2}: #2}

%% Chess notation

\RequirePackage{chessboard}

\setchessboard{smallboard,showmover=false}

\newcommand{\PAWN}{\ensuremath{P}}
\newcommand{\BISHOP}{\ensuremath{B}}
\newcommand{\KNIGHT}{\ensuremath{N}}
\newcommand{\ROOK}{\ensuremath{R}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                  %%
%%                              LISTS                               %%
%%                                                                  %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\compactlist{%
    \parskip\z@
    \itemsep\z@
}

%%  %% Change hierarchy of enumerate labels: use lowercase roman numerals
%%  %% for top-level.  We should not use more than two levels.
%%  
%%  \renewcommand\theenumi{\@roman\c@enumi}
%%  \renewcommand\theenumii{\@alph\c@enumii}
%%  
%%  \renewcommand\labelenumi{\theenumi\textup)}
%%  \renewcommand\labelenumii{\textup(\theenumii\textup)}
%%  
%%  
%%  % \renewcommand\theenumiii{\@Alph\c@enumiii}
%%  % \renewcommand\theenumiv{\@arabic\c@enumiv}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                  %%
%%                             FIGURES                              %%
%%                                                                  %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newif\ifredrawn
\redrawnfalse

\newif\if@hascaption
\@hascaptionfalse

\let\@figure@filename\@empty

\newcommand{\graphic}[2][]{%
    \begingroup
        \gdef\@figure@filename{#2.pdf}%
        \@tempswafalse
        \IfFileExists{figures/final/\@figure@filename}{%
            \redrawn
            \global\redrawntrue
            \@tempswatrue
        }{%
            \IfFileExists{\@figure@filename}{%
                \redrawn[\textcolor{red}{Undredrawn}]%
                \@tempswatrue
            }{}%
        }%
    \if@tempswa
        \includegraphics[#1]{#2}%
    \else
        \includegraphics{missing}%
    \fi
    \endgroup
}

\let\@figure@instruction\@empty

\newcommand{\gnote}[1]{%
    \def\@figure@instruction{#1}%
}

\let\@redrawn@message\@empty

\newcommand{\redrawn}[1][Redrawn]{%
    \def\@redrawn@message{#1}%
}

%% Center contents of figures by default.

\renewenvironment{figure}[1][tbp]{%
    \@float{figure}[#1]%
    \global\@hascaptionfalse
    \global\redrawnfalse
    \let\@redrawn@message\@empty
    \let\@figure@instruction\@empty
    \let\@figure@filename\@empty
    \centering
}{%
    \if@hascaption\else
        \fakecaption\@captype
    \fi
    \end@float
}

\long\def\fakecaption#1{%
    \par
    \addcontentsline{\csname ext@#1\endcsname}{#1}{%
        \protect\numberline{%
            \ifredrawn\else
                \protect\textcolor{red}%
            \fi
            {???}%
        }{Uncaptioned figure}%
    }%
}

\long\def\@caption#1[#2]#3{%
    \par
    \global\@hascaptiontrue
    \addcontentsline{\csname ext@#1\endcsname}{#1}%
        {%
            \protect\numberline{%
                \ifredrawn\else
                    \protect\textcolor{red}%
                \fi
                {\csname the#1\endcsname}%
            }{\ignorespaces #2}%
        }%
    \begingroup
        \@parboxrestore
        \if@minipage
            \@setminipage
        \fi
        \normalsize
        \@makecaption{\csname fnum@#1\endcsname}{\ignorespaces #3}\par
    \endgroup
}

\long\def\@makecaption#1#2{%
    \vskip\abovecaptionskip
    \sbox\@tempboxa{\textbf{#1}\quad #2}%
    \ifdim \wd\@tempboxa >\hsize
        \textbf{#1}\quad#2\par
    \else
        \global \@minipagefalse
        \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
    \fi
    \vskip\belowcaptionskip
}

\renewcommand\listoffigures{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\listfigurename}%
      \@mkboth{\MakeUppercase\listfigurename}%
              {\MakeUppercase\listfigurename}%

    \begin{quote}\color{red}
        Graphics with red numbers have \emph{not} been redrawn yet.
    \end{quote}
    \@starttoc{lof}%
    \if@restonecol\twocolumn\fi
    }


% \let\real@includegraphics\includegraphics
% 
% \renewcommand{\includegraphics}[2][]{%
%     \real@includegraphics[#1]{#2}%
%     \begingroup
%         \par
%         \centering
%         \edef\@tempa{#2}%
%         \fbox{\texttt{filename: \expandafter\strip@prefix\meaning\@tempa}}%
%     \endgroup
% }

\newbox\@figuresextra

\def\Gin@setfile#1#2#3{%
    \ifx\\#2\\\Gread@false\fi
    \ifGin@bbox\else
        \ifGread@
            \csname Gread@%
                \expandafter\ifx\csname Gread@#1\endcsname\relax
                    eps%
                \else
                    #1%
                \fi
            \endcsname{\Gin@base#2}%
        \else
            \Gin@nosize{#3}%
        \fi
    \fi
    \Gin@viewport@code
    \Gin@nat@height\Gin@ury bp%
    \advance\Gin@nat@height-\Gin@lly bp%
    \Gin@nat@width\Gin@urx bp%
    \advance\Gin@nat@width-\Gin@llx bp%
    \Gin@req@sizes
    \expandafter\ifx\csname Ginclude@#1\endcsname\relax
        \Gin@drafttrue
        \expandafter\ifx\csname Gread@#1\endcsname\relax
            \@latex@error{Can not include graphics of type: #1}\@ehc
            \global\expandafter\let\csname Gread@#1\endcsname\@empty
        \fi
    \fi
    \leavevmode
    \ifGin@draft
        \hb@xt@\Gin@req@width{%
            \vrule\hss
            \vbox to \Gin@req@height{%
                \hrule \@width \Gin@req@width
                \vss
                \ifx\@figure@filename\@empty
                    \edef\@tempa{#3}%
                \else
                    \edef\@tempa{\@figure@filename}%
                \fi
                \rlap{ \ttfamily\expandafter\strip@prefix\meaning\@tempa}%
                \vss
                \hrule
            }%
            \hss
            \vrule
        }%
    \else
        \@addtofilelist{#3}%
        \ProvidesFile{#3}[Graphic file (type #1)]%
        \setbox\z@\hbox{\csname Ginclude@#1\endcsname{#3}}%
        \dp\z@\z@
        \ht\z@\Gin@req@height
        \wd\z@\Gin@req@width
        \if@figuredraft@
            \@tempdima\textwidth
            \advance\@tempdima-\wd\z@
            \divide\@tempdima by 2
            \setbox\@figuresextra\hbox{%
                \vbox to \ht\z@{%
                    \hsize=2in
                    \raggedleft
                    \parskip10pt
                    \parindent\z@
                    \if@show@figure@fname@
                        \ifx\@figure@filename\@empty
                            \edef\@tempa{#3}%
                        \else
                            \edef\@tempa{\@figure@filename}%
                        \fi
                        {\ttfamily\expandafter\strip@prefix\meaning\@tempa}\par
                    \fi
                    \ifx\@redrawn@message\@empty\else
                        \begingroup
                            \color{green}\@redrawn@message\par
                            \global\let\@redrawn@message\@empty
                        \endgroup
                    \fi
                    \ifx\@figure@instruction\@empty\else
                        \begingroup
                            \color{red}\@figure@instruction\par
                            \global\let\@figure@instruction\@empty
                        \endgroup
                    \fi
                    \vss
                }%
                \hskip\@tempdima
            }%
            \ifvoid\@figuresextra\else
                \setbox\z@\hbox{\llap{\box\@figuresextra}\box\z@}%
            \fi
        \fi
        \box\z@
    \fi
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                  %%
%%                          THEOREMS, ETC.                          %%
%%                                                                  %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Due to an apparent bug in amsthm.sty, something like this
%%
%%    \begin{problem}
%%        \begin{lemma}
%%        \end{lemma}
%%    \end{problem}
%%
%% where problem has a custom head specification and lemma doesn't,
%% causes lemma to inherit the custom head specification from problem.
%% This patches the three standard theorem styles to fix that problem.

\def\th@plain{%
    \let\thmhead\thmhead@plain
    \itshape % body font
}

\def\th@definition{%
    \let\thmhead\thmhead@plain
    \normalfont % body font
}

\def\th@remark{%
    \let\thmhead\thmhead@plain
    \thm@headfont{\itshape}%
    \normalfont % body font
    \thm@preskip\topsep \divide\thm@preskip\tw@
    \thm@postskip\thm@preskip
}

%% THEOREM-LIKE

\theoremstyle{plain}

\newtheorem{theorem}{Theorem}[section]
\newtheorem*{theorem*}{Theorem}

\newtheorem{falsethm}[theorem]{False Theorem}
\newtheorem*{falsethm*}{False Theorem}

\newtheorem{lemma}[theorem]{Lemma}
\newtheorem*{lemma*}{Lemma}

\newtheorem{proposition}[theorem]{Proposition}
\newtheorem*{proposition*}{Proposition}

\newtheorem{corollary}[theorem]{Corollary}
\newtheorem*{corollary*}{Corollary}

\newtheorem{claim}[theorem]{Claim}
\newtheorem*{claim*}{Claim}

\newtheorem{falseclm}[theorem]{False Claim}
\newtheorem*{falseclm*}{False Claim}

\newtheorem{rul}[theorem]{Rule}
\newtheorem*{rul*}{Rule}

\newtheorem*{nonrul*}{Non-Rule}

\newtheorem{mathrule}{Rule}
\newtheorem*{mathrule*}{Rule}

\newtheorem{algorithm}{Algorithm}

\newtheorem*{cont_hypo*}{Cantor's Continuum Hypothesis}

%% DEFINITION-LIKE

\theoremstyle{definition}

\newtheorem{definition}[theorem]{Definition}
\newtheorem*{definition*}{Definition}

\newtheorem{fact}[theorem]{Fact}
\newtheorem*{fact*}{Fact}

\newtheorem{axiom}[theorem]{Axiom}
\newtheorem*{axiom*}{Axiom}

\newtheorem*{caveat}{Caveat}

%% REMARK-LIKE

\theoremstyle{remark}

\newtheorem{remark}[theorem]{Remark}
\newtheorem*{remark*}{Remark}

\newtheorem{example}[theorem]{Example}
\newtheorem*{example*}{Example}

\newtheorem{xample}[theorem]{Example}
\newtheorem*{xample*}{Example}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                  %%
%%                              PROOFS                              %%
%%                                                                  %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Copy the amsthm proof environment and add code to set the
%% \if@just@ended@proof@ flag to communicate with an enclosing
%% solution environment.

%% Use a black square instead of an open square for the QED symbol.

\def\qedsymbol{\ensuremath{\blacksquare}}

\newif\if@just@ended@proof@

\newcommand{\noqed}{%
    \begingroup
        \let\qed\relax
        \qedhere
    \endgroup
}

\renewenvironment{proof}[1][\proofname]{%
    \par
    \pushQED{\qed}%
    \normalfont
    \topsep6\p@\@plus6\p@\relax
    \trivlist
        \item[\hskip\labelsep \itshape #1\@addpunct{.}]\ignorespaces
}{%
        \popQED
    \endtrivlist
    \global\@just@ended@proof@true
    \global\everypar{\global\@just@ended@proof@false}%
    \@endpefalse
}

\newenvironment{falseproof}{%
    \proof[False proof]%
}{%
    \endproof
}

\newenvironment{bogusproof}{%
    \proof[Bogus proof]%
}{%
    \endproof
}

\def\inductioncase{\par\medskip\noindent\textbf}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                  %%
%%                             PROBLEMS                             %%
%%                                                                  %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\problemsection{\section{Problems}}

% %% This is based on the verbatimwrite environment from verbatim.dtx.

\newenvironment{problems}{%
    \@bsphack
    \let\do\@makeother\dospecials
    \catcode`\^^M\active
    \def\verbatim@processline{%
        \immediate\write\@chapprobs{\the\verbatim@line}%
    }%
    % \immediate\write\@chapprobs{\noexpand\begin{realproblems}}%
    \immediate\write\@chapprobs{\noexpand\section*{Problems for
        Section\noexpand~\thesection}}%
    \verbatim@start
}{%
    % \immediate\write\@chapprobs{\noexpand\end{realproblems}}%
    \@esphack
}

\newenvironment{realproblems}{%
    \section{Problems}%
}{}
\newcommand{\practiceproblems}{\subsection*{Practice Problems}}
\newcommand{\classproblems}{\subsection*{Class Problems}}
\newcommand{\homeworkproblems}{\subsection*{Homework Problems}}
\newcommand{\examproblems}{\subsection*{Exam Problems}}

%% pcomments is an itemized list environment that shows up only when
%% the standalone version of the problem is compiled.

\let\pcomments\comment
\let\endpcomments\endcomment

%% pkeywords attaches a string of whitespace-delimited (including newline) 
%%  keywords to problems and prints out the list when the standalone version 
%%  of the problem is compiled.
%%
%% Usage: \pkeywords{keyword_1 keyword_2 keyword_3}
%%

\newcommand{\pkeywords}{\gobble@text}

\define@key{mcsprob}{points}{\def\mcsprob@points{#1}}
\define@key{mcsprob}{title}{\def\mcsprob@title{#1}}

\def\mcsprob@points{0}
\let\mcsprob@title\@empty
\let\mcsprob@filename\@empty

\newif\if@optional@problem
\@optional@problemfalse

%% Input a problem.

\newcommand{\pinput}{%
    \begingroup
        \@optional@problemfalse
        \@ifstar{\@optional@problemtrue\@pinput}\@pinput
}

\newcommand{\@pinput}[2][]{%
        \def\mcsprob@filename{#2}%
        \let\mcsprob@points\z@
        \let\mcsprob@title\@empty
        \setkeys{mcsprob}{#1}%
        \IfFileExists{\mcsprob@filename}{%
            \input{\mcsprob@filename}%
        }{%
            \ClassWarning{mcs}{Can't find problem `\mcsprob@filename'}%
        }%
    \endgroup
}

\def\mcs@thm@psolution#1#2{%
    \def\@tempa{#1}%
    \ifx\@empty\@tempa
        \def\@tempa{\@oparg{\@begintheorem{#2}{}}[]}%
    \else
        \@ifundefined{r@\jobname}{%
            \refstepcounter{#1}%
            \def\@tempb{\csname the#1\endcsname}%
            \def\mcs@thm@type{#2}%
        }{%
            \edef\@tempb{%
                \@nx\protected@edef\@nx\@tempb{%
                    \@nx\mcs@get@label\csname r@\jobname\endcsname \@nx\@nil
                }%
            }%
            \@tempb
            \protected@edef\@currentlabel{\@tempb}%
        }%
    \def\@tempa{%
        \@oparg{\@begintheorem{\mcs@thm@type}{\@tempb}}[]%
    }%
    \fi
    \@tempa
}

\def\fake@begin#1{%
    \@ignorefalse
    \begingroup
        \@endpefalse
        \def\@currenvir{#1}%
        \edef\@currenvline{\on@line}%
}

\def\fake@end#1{%
%        \@checkend{#1}%
    \expandafter\endgroup
    \if@endpe\@doendpe\fi
    \if@ignore\@ignorefalse\ignorespaces\fi
}

\newcommand{\psolution}[1]{%
    \begingroup
        \let\mcs@thm\mcs@thm@psolution
        \let\problem\problem@psolution
        \let\endproblem\endproblem@psolution
        \def\solution{\solution@psolution{#1}}%
        \let\endsolution\endsolution@psolution
        \let\problemparts\problemparts@psolution
        \let\endproblemparts\endproblemparts@psolution
        \def\ppart{\stepcounter{problempart}}%
        \setcounter{problempart}{-1}%
    \@pinput{#1}%
}

\def\problem@psolution{%
    \setbox\@tempboxa\vbox\bgroup
}

\def\solution@psolution#1{%
        \endgroup   % closes \begin's \begingroup, closing
                    % solution
    \egroup     % closes \vbox and discards typeset
                % non-solution text
    \fake@begin{solution}% reopen solution
        \format@solution[Solution to \ref{#1}%
            \ifnum\c@problempart > 0 \labelproblempart\fi
        ]%
}

\def\endsolution@psolution{%
        \endformat@solution
    \fake@end{solution}% close reopened solution
    \def\@currenvir{solution}%
        \setbox\@tempboxa\vbox\bgroup
            \begingroup % matches \end{solution}'s \endgroup
}

\def\endproblem@psolution{%
        \egroup % matches \vbox from last \end{solution}
    \def\@currenvir{problem}%
}

\def\problemparts@psolution{%
        \endgroup   % closes \begin's \begingroup, closing
                    % solution
        \egroup     % closes \vbox and discards typeset
                    % non-solution text
    \fake@begin{problemparts}% reopen problemparts
        \setcounter{problempart}{0}%
        \setbox\@tempboxa\vbox\bgroup
}

\def\endproblemparts@psolution{%
        \egroup
    \fake@end{problemparts}%
    \def\@currenvir{problemparts}%
        \setbox\@tempboxa\vbox\bgroup
            \begingroup % matches \end{problemparts}'s \endgroup
}

%% The basic problem environment.

\newlength{\standardproblemsep}
\newlength{\standardproblempartsep}

\newlength{\problemsep}
\newlength{\problempartsep}

\setlength{\standardproblemsep}{0.5cm}
\setlength{\standardproblempartsep}{1ex}

\setlength{\problemsep}{\standardproblemsep}
\setlength{\problempartsep}{\standardproblempartsep}

\newcommand{\theoremsunderproblems}{%
    \renewcommand{\thetheorem}{\theproblem.\arabic{theorem}}%
}

\def\pdf@problem@bookmark{%
    \pdfbookmark[1]{Problem~\@currentlabel}{Problem \@currentlabel}%
}

\newtheoremstyle{problem}
                {\problemsep}               % preskip
                {\problemsep}               % postskip
                {\normalfont}               % body style
                {0pt}                       % indent
                {\bfseries}                 % head style
                {.}                         % post-head punct
                {\newline}                  % post-head space
                {\mcs@problem@heading{#1}{#2}{#3}}% custom head-spec

\theoremstyle{problem}

\newtheorem{problem}{Problem}[chapter]
\newtheorem*{problem*}{Problem}

\def\format@problem{%
    \mcs@thm{\let\thm@swap\@gobble\th@problem}{problem}{Problem}%
}

\let\problem\format@problem

\def\mcs@get@label#1#2\@nil{#1}

\def\mcs@thm#1#2#3{%
    \def\mcs@thm@type{#3}%
    \ifhmode\unskip\unskip\par\fi
    \normalfont
    \trivlist
    \let\thmheadnl\relax
    \let\thm@swap\@gobble
    \thm@notefont{\fontseries\mddefault\upshape}%
    \thm@headpunct{.}% add period after heading
    \thm@headsep 5\p@ plus\p@ minus\p@\relax
    \thm@space@setup
    #1% style overrides
    \@topsep \thm@preskip               % used by thm head
    \@topsepadd \thm@postskip           % used by \@endparenv
    \mcs@thm@{#2}{#3}%
}

\def\mcs@thm@#1#2{%
    \def\@tempa{#1}%
    \ifx\@empty\@tempa
        \def\@tempa{\@oparg{\mcs@begintheorem{#2}{}}[]}%
    \else
        \refstepcounter{#1}%
        \ifx\mcsprob@filename\@empty\else
            \label\mcsprob@filename
        \fi
        \def\@tempa{\@oparg{\mcs@begintheorem{#2}{\csname the#1\endcsname}}[]}%
    \fi
    \@tempa
}

\def\mcs@begintheorem#1#2[#3]{%
    \ifx\mcsprob@title\@empty
        \@begintheorem{#1}{#2}[#3]%
    \else
        \@begintheorem{#1}{#2}[\mcsprob@title]%
    \fi
}

\def\mcs@problem@heading#1#2#3{%
    \thmname{#1}%
    \thmnumber{\@ifnotempty{#1}{\pdf@problem@bookmark\space}\@upn{#2}}%
    \thmnote{ {\the\thm@notefont(#3)}}%
}

\def\print@points#1#2{%
    \begingroup
        \def\@tempa{#1}%
        \def\@tempb{#2}%
        \afterassignment\print@points@
        \@tempcnta=
}

\def\print@points@{%
        \ifnum\@tempcnta = \z@\else
            \@tempa
            \the\@tempcnta\ point\ifnum\@tempcnta=\@ne\else s\fi
            \@tempb
        \fi
    \endgroup
}

%%% Notes problems %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Very similar to the ``simpleproblem'' environment.  Difference is that
% the pdf bookmarks are suppressed, so that they don't mess up with
% the standard section bookmarking.  Also, there is no extra space added
% before the problem.

\newtheoremstyle{notesproblem}
                {\problemsep}               % preskip
                {\problemsep}               % postskip
                {\normalfont}               % body style
                {0pt}                       % indent
                {\bfseries}                 % head style
                {:}                         % post-head punct
                { }                         % post-head space
                {}                          % custom head-spec

\theoremstyle{notesproblem}

\newtheorem*{notesproblem}{Quick Exercise}

%% subproblems

\newcounter{problempart}[problem]
\renewcommand{\theproblempart}{\alph{problempart}}
\newcommand{\labelproblempart}{(\theproblempart)}

\newenvironment{problemparts}{%
    \list{\textbf{\labelproblempart}}{%
        \@nmbrlisttrue
        \def\@listctr{problempart}%
        \settowidth{\labelwidth}{\textbf{(m)}}%
        \setlength{\labelsep}{1ex}%
        \setlength{\leftmargin}{0pt}%
        \setlength{\itemindent}{\labelwidth}%
        \addtolength{\itemindent}{\labelsep}%
        \setlength{\rightmargin}{0pt}%
        \setlength{\listparindent}{0pt}%
        \setlength{\itemsep}{\problempartsep}%
        \topsep\z@
    }%
}{%
    \endlist
}

% \newcommand{\problempartbookmark}{%
%     \pdfbookmark[2]{(\theproblempart)}{Problem\theproblem\theproblempart}%
% }

% \newcommand{\problempart}[1][0]{\item\problempartbookmark}

\newcommand{\problempart}[1][0]{\item}%

\newcommand{\pref}[1]{(\ref{#1})}
\newcommand{\ppref}[2]{\ref{#1}(\ref{#2})}

\newcommand{\bparts}{\begin{problemparts}}
\newcommand{\eparts}{\end{problemparts}}
\newcommand{\ppart}{\problempart}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                  %%
%%                            SOLUTIONS                             %%
%%                                                                  %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Copy the amsthm proof environment, with 3 changes:
%% a) Default label is ``Solution'', not ``Proof''
%% b) label is typeset in bold, not italics
%% c) Suppress the normal QED mark if \if@just@ended@proof@ is true
%%    (see proof environment above).

\def\eatQED@elt#1#2\relax{\gdef\QED@stack{#2}}

\newenvironment{format@solution}[1][Solution]{%
    \par
    \global\@just@ended@proof@false
    \pushQED{\qed}%
    \normalfont
    \topsep6\p@\@plus6\p@\relax
    \trivlist
        \item[\hskip\labelsep\bfseries#1\@addpunct{.}]%
        \ignorespaces
}{%
        \if@just@ended@proof@
            \let\popQED@elt\eatQED@elt
        \fi
    \popQED
    \endtrivlist
    \@endpefalse
}

\let\solution\format@solution
\let\endsolution\endformat@solution

\newenvironment{staffnotes}{%
    \trivlist
        \item[\hskip\labelsep \textbf{\textcolor{red}{STAFF NOTE}}:]\ignorespaces
}{%
    \textcolor{red}{\qed}
    \endtrivlist
}

\newenvironment{editingnotes}{%
    %% Don't number sections or put them into the TOC
    \c@secnumdepth=\m@ne
    \c@tocdepth=\m@ne
    \color{ForestGreen}%
    \trivlist
        \item[\hskip\labelsep \textbf{\textcolor{red}{EDITING NOTE}}:]\ignorespaces
    %%
    %%  This \leavemode forces extra vertical space, but it's
    %%  necessary to keep something like
    %%
    %%      \section{a}
    %%      \begin{editingnotes}
    %%      \section{b}
    %%
    %%  from causing a ``missing \item'' error.
    %%
    \leavevmode
}{%
    \textcolor{red}{\qed}
    \endtrivlist
}

\AtBeginDocument{%
    \ifshowproblems
        \typeout{^^JProblems *INCLUDED*.^^J}%
    \else
        \typeout{^^JProblems *NOT INCLUDED*.^^J}%
        \let\problems\comment
        \let\endproblems\endcomment
        \def\problemsection{\clearpage\endinput}%
    \fi
    \ifshowsolutions
        \typeout{^^JSolutions *INCLUDED*.^^J}%
        \let\insolutions\@firstofone
        \let\instatements\gobble@text
        \problemsep2\standardproblemsep
    \else
        \typeout{^^JSolutions *NOT INCLUDED*.^^J}%
        \let\insolutions\gobble@text
        \let\instatements\@firstofone
        \let\solution\comment
        \let\endsolution\endcomment
    \fi
    \ifshowstaffnotes
        \typeout{^^JStaff notes *INCLUDED*.^^J}%
    \else
        \typeout{^^JStaff notes *NOT INCLUDED*.^^J}%
        \let\staffnotes\comment
        \let\endstaffnotes\endcomment
    \fi
    \ifshoweditingnotes
        \typeout{^^JEditing notes *INCLUDED*.^^J}%
    \else
        \typeout{^^JEditing notes *NOT INCLUDED*.^^J}%
        \let\editingnotes\comment
        \let\endeditingnotes\endcomment
    \fi
}

\newcommand{\askaboutsolutions}{%
    \typeout{}
    \typein[\answer]{Include solutions? (y/n) }%
    \if y\answer
        \global\showsolutionstrue
    \else
        \global\showsolutionsfalse
    \fi
}

\newcommand{\decideaboutsolutions}{%
    \askaboutsolutions
%    \theoremsunderproblems
}

\newcommand{\showsolutions}{%
    \showsolutionstrue
    \showstaffnotesfalse
    \let\askaboutsolutions\@empty
}

\newcommand{\staffsolutions}{%
    \showsolutionstrue
    \showstaffnotestrue
    \let\askaboutsolutions\@empty
}

\newcommand{\hidesolutions}{%
    \showsolutionsfalse
    \showstaffnotesfalse
    \let\askaboutsolutions\@empty
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                  %%
%%                              EXAMS                               %%
%%                                                                  %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% \examspace produces vertical space only in handouts without solutions. 
%%   If no optional argument is passed then it starts a new page,
%%   otherwise inserts \vspace{arg}.  e.g. \examspace[1in]

\newcommand{\examspace}[1][]{}

\newcommand{\@examspace}[1][]{%
    \ifshowsolutions\else
        \ifcat###1##%
            \newpage
        \else
            \vspace{#1}%
        \fi
    \fi
}

%% \examrule creates a \brule only in handouts without solutions.  If
%%   no argument is passed then the default \hspace is 0.5in
\newcommand{\examrule}[1][]{}

\newcommand{\@examrule}[1][0.5in]{\inhandout{\instatements{\brule{#1}}}}

%% \exambox{W}{H}{D} creates a \fbox having width W, height H 
%%   and at distance D from the bottom of the current line (only in 
%%   handouts without solutions). 

\newcommand{\exambox}[3]{}

\newcommand{\@exambox}[3]{\inhandout{\instatements{
  \fbox{\rule{#1}{0in}\rule[#3]{0in}{#2}}}}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Mini pages %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Generates a _framed_ minipage with its width as an optional argument.
% If the width is not specified, \linewidth is used. 
%
% Usage  :  \begin{fminibox}{width} ... \end{fminibox}
% Example:  \begin{fminibox}{3in}  blah, blah... \end{fminibox}
%

\newsavebox{\fminibox}
\newlength{\fminilength}

\newenvironment{fminipage}[1][\linewidth]{%
    \setlength{\fminilength}{#1}
    \addtolength{\fminilength}{-2\fboxsep}
    \addtolength{\fminilength}{-2\fboxrule}
    \begin{lrbox}{\fminibox}\begin{minipage}{\fminilength}%
}{%
    \end{minipage}\end{lrbox}\noindent\fbox{\usebox{\fminibox}}%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Formatting the top/bottom matter%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
% Formats the title, given the paper supertitle, paper title, and
% release date. (Typically, the only papers that have a supertitle are
% lectures notes: the _supertitle_ is something like ``Lecture Notes
% 7'', while the _title_ is the actual title of the notes, like
% ``Induction''. All other documents have no supertitle at all.)
%       The optional argument allows for revision info: if used, the
% specified revision info is printed; if not, the \stamp info is
% printed.  
%
% Usage  : \formattitle[revision info]{supertitle}{title}{date out}
% Example: \formattitle[v1.1]{}{Tutorial 13}{Fri, Nov 13} 
%
%       The commands \courseinstitute, \coursetitle, \coursenumber,
% \courseprofessors are used, meant to be renewed by the user (in
% 00course.dat, once at the beginning of the term) to contain the
% appropriate info. The current definitions are just informative
% warnings. Here is an example of how the commands are meant to be
% renewed:  
%
% \renewcommand{\courseinstitute}{
%   \href{http://web.mit.edu/}{Massachusetts Institute of Technology}}
% \renewcommand{\coursetitle}{Mathematics for Computer Science}
% \renewcommand{\coursenumber}{
%   \href{http://theory.lcs.mit.edu/classes/6.042/spring02}
%   {6.042J/18.062J, Spring~'02}}
% \renewcommand{\courseprofessors}{
%   \href{http://theory.lcs.mit.edu/~meyer/}{Professor Albert Meyer} 
%   and
%   \href{http://www.swiss.ai.mit.edu/users/radhi/}{Dr.~Radhika Nagpal}}
%

\newcommand{\formattitle}[4][\stamp]{%
  \mbox{}\vspace*{-\headheight}\mbox{}\vspace*{-\headsep}\mbox{}\newline
  \noindent
  \parbox{\textwidth}{
    \courseinstitute             \hfill          #2 \newline%
    \coursenumber : \coursetitle \hfill          #4 \newline%
    \courseprofessors            \hfill          #1 \\[-1ex]%
    \mbox{}\hrulefill\mbox{}}
  \mbox{}                                           \newline%
  \bigskip
  \begin{center}       {\Large\textbf{#3}}  \end{center}
  \coursecopyright
%  \begin{center}       {\Large\textbf{#3}}  \coursecopyright      \end{center}
}

\newcommand{\stamp}{%
  {\scriptsize{revised \today, \currenttime}}}

\newcommand{\Stamp}{%
  revised \today, \currenttime}

\let\courseurl\@empty

\AtBeginDocument{%
    \ifx\courseurl\@empty
        \message{^^JCourse URL/link *INCORRECT*.^^J^^J}%
    \fi
}

\newcommand{\courseinstitute}{%
  \href{http://web.mit.edu/}{University of Somewhere}%
  \message{^^JInstitute name/link *INCORRECT*.^^J^^J}}
\newcommand{\coursetitle}{%
  \href{http://web.mit.edu/}{Advanced Something}%
  \message{^^JCourse name/link *INCORRECT*.^^J^^J}}
\newcommand{\coursenumber}{%
  \href{http://web.mit.edu/}{B747}%
  \message{^^JCourse number/link *INCORRECT*.^^J^^J}}
\newcommand{\courseprofessors}{%
  \href{http://web.mit.edu/}{Prof.~Somebody}%
  \message{^^JProfessor name/link *INCORRECT*.^^J^^J}}


\iffalse
%%THE PROBLEM%%   \coursecopyright

\newcommand{\coursecopyright}{%
  \renewcommand{\thefootnote}{}%
  \footnotetext{%
    Copyright~\copyright~\coursecopyrightyear, 
    \coursecopyrightnames. All rights reserved.}%
  \renewcommand{\thefootnote}{\arabic{footnote}}}
\fi

\long\def\symbolfootnote[#1]#2{\begingroup%
\def\thefootnote{\fnsymbol{footnote}}\footnote[#1]{#2}\endgroup}

\newcommand{\coursecopyright}{%
    \symbolfootnote[0]{\resizebox{!}{0.15in}{\href{http://creativecommons.org/licenses/by-sa/3.0/}{\includegraphics{by-sa}}}~\coursecopyrightyear,
  \coursecopyrightnames.  This work is available under the terms of the
  \href{http://creativecommons.org/licenses/by-sa/3.0/}{Creative
    Commons Attribution-ShareAlike 3.0 license}.}
    % \symbolfootnote[0]{Illustrations by Geoffrey Allen Hyche.}%
}


\iffalse
\newcommand{\coursecopyright}{\resizebox{!}{0.15in}{\href{http://creativecommons.org/licenses/by-sa/3.0/}{\includegraphics{by-sa}}}~\coursecopyrightyear,
  \coursecopyrightnames.  This work is available under the terms of the
  \href{http://creativecommons.org/licenses/by-sa/3.0/}{Creative
    Commons Attribution-ShareAlike 3.0 license}.}
\fi


\newcommand{\coursecopyrightyear}{%
  \message{^^JCopyright year is *INCORRECT*.^^J^^J}}

\renewcommand{\coursecopyrightyear}{2014}

\newcommand{\coursecopyrightnames}{%
  \message{^^JCopyright names are *INCORRECT*.^^J^^J}}

\renewcommand{\coursecopyrightnames}{Eric Lehman, F Tom Leighton, \href{http://people.csail.mit.edu/meyer}{Albert R~Meyer}}


% Formats the top matter (title+headers), given the paper supertitle,
% paper title, and release date. 
%       The optional argument allows for revision info: if used, the
% specified revision info is printed; if not, the \stamp info is
% printed. 
%
% Usage  : \formatpages[revision info]{supertitle}{title}{date out}
% Example: \formatpages[v1.1]{}{Tutorial 13}{Fri, Nov 13}
%
\newcommand{\formatpages}[4][\stamp]{%
  \thispagestyle{empty}
  \markboth{\@ifnotempty{#2}{#2: }#3}{\@ifnotempty{#2}{#2: }#3}
  \pagestyle{myheadings}
  \formattitle[#1]{#2}{#3}{#4}
}

% Formats the top matter (title+headers) appropriately for an exam
% paper, given the paper title and release date.  
%       The optional argument allows for revision info: if used, the
% specified revision info is printed; if not, the \stamp info is
% printed. 
%
% Usage  : \formatexampages[rev info]{title}{date out}
% Example: \formatexampages[v1.1]{Quiz 13}{Fri, Nov 13}
%
%       The command \exampreamble is used, meant to be renewed by the
% user: it contains the introductory coments for the exam. The current
% definition is an informative warning. Here is an example of how the
% command is meant to be renewed: 
%
%\renewcommand{\exampreamble}{
%  \textbf{Circle your Tutorial Instructor}:
%  \begin{center}
%  \renewcommand{\arraystretch}{1.5}
%  \begin{tabular}{llll}
%  Yu-Han    & Christos & Nikos & Ashish \\
%  Thien-Loc & Jaime    & Tina  & Tong   
%  \end{tabular}
%  \end{center}
%  \begin{itemize}
%  \item 
%  This quiz is \textbf{closed book}.  There is an Appendix giving the 
%  definitions of some standard operations on relations.
%  \item 
%  There are four (4) problems totaling 100 points.  Problems are
%  labeled with their point values.
%  \item 
%  Put your name on the top of {\bf every} page -- \emph{these
%  pages may be separated for grading}.
%  \item 
%  Write your solutions in the space provided.  If you need more
%  space, write on the back of the sheet containing the problem.
%  Please keep your entire answer to a problem on that problem's page.
%  \item 
%  You may assume any of the results presented in class or in the
%  lecture notes.
%  \item  
%  \textbf{Be neat and write legibly}.  You will be graded not only on
%  the correctness of your answer, but also on the clarity with which
%  you express it.
%  \item 
%  GOOD LUCK!
%  \end{itemize}}
%
\newcommand{\formatexampages}[3][\stamp]{%
  \thispagestyle{empty}
  \markboth{\hspace{2em}Your name:\hrulefill{}\hfill#2}
           {#2\hfill{}Your name:\hrulefill\hspace{2em}}
  \pagestyle{myheadings}
  \formattitle[#1]{}{#2}{#3}
  \bigskip\bigskip\textbf{Your name:}\hrulefill\par\bigskip
    \exampreamble
  \vfill
%    \newpage  %%inserted for F07
  \hrule\smallskip  %%commented out for F07
  \centerline{\textbf{DO NOT WRITE BELOW THIS LINE}}
  \smallskip\hrule\bigskip
    \examtable
  \clearpage}

\newcommand{\exampreamble}{
  \vfill\noindent
  You have to renew $\backslash$\texttt{exampreamble} in the preamble
  of your paper to have something printed in this space! For example, 
  \begin{center}
  \texttt{%
    $\backslash$renewcommand$\{\backslash$exampreamble$\}$
      $\{\backslash$vfill GOOD LUCK FOLKS! $\backslash$vfill$\}$}
  \end{center}
  See also \texttt{course.sty} for a longer example.%
  \message{^^JExam preamble is *INCORRECT*.^^J^^J}
  \vfill}

\newcommand{\useStandardMiniquizPreamble}{
\renewcommand{\exampreamble}{   % !! renew \exampreamble
  \begin{tabular}{l}
%    \textbf{Circle your TA/LA}: &  \courseassistants\\[.35cm] 
    \textbf{Write your}:  \teaminfo
  \end{tabular}

  \begin{itemize}

  \item
   This exam is \textbf{closed book}, except for a one-sided crib
   sheet.  Total time is \miniqtime.

\iffalse

  \item
   Write your solutions in the space provided.  If you need more
   space, write on the back of the sheet containing the problem.
   Please keep your entire answer to a problem on that problem's page.

 \item
   You may use any of the results from class or text without proof.

 \item
   GOOD LUCK!
\fi
  \end{itemize}}}


\newcommand{\examtable}{%
    \ifx\examtablecontents\@empty
        \vfill
        \begin{center}
        This is where the grades table is supposed to be printed. Compile
        the paper once more to get it right. See \texttt{course.sty} for
        details.
        \end{center}
        \message{^^JGrades table was *NOT PRINTED*.^^J^^J}
        \vfill
    \else
        \print@examtable
    \fi
}


\def\print@exam@line#1#2{%
    \global\advance\@tempcnta #2\relax
    #1&#2&&\\\hline
}

\def\print@examtable{%
    \begin{center}
        \let\@elt\print@exam@line
        \@tempcnta\z@
        \renewcommand{\arraystretch}{1.5}
        \begin{tabular}{|c|c|c|c|}
            \hline
            Problem & Points & Grade  & Grader \\\hline\hline
            \examtablecontents                   \hline
            Total   & \the\@tempcnta & &        \\\hline
        \end{tabular}
    \end{center}
}


% Formats the cover sheet (for the student's solutions) provided at
% the end of every problem set, given the problem set number. 
%
% Usage  : \coversheet{problem set number}
% Example: \coversheet{13}
%
%       The commands \courseassistants and \collaborationnote
% are used, meant to be renewed by the user (in 00course.dat, once at
% the beginning of the term) to contain the appropriate info. The
% current definitions are just informative warnings. Here is an
% example of how the commands are meant to be renewed:  
%
% \renewcommand{\courseassistants}{   
%        Ashish\hspace{.7em}    Carole\hspace{.7em} 
%        Christos\hspace{.7em}  Eric\hspace{.7em}
%        George\hspace{.7em}    Jack\hspace{.7em}   
%        Nick\hspace{.7em}      Tina }
% \renewcommand{\collaborationnote}{%
%   \textbf{Collaboration statement:} 
%   Circle one of the two choices and provide all pertinent info.
%   \begin{enumerate}
%   \item[1.] I worked alone and only with course materials.
%   \item[2.] I collaborated on this assignment with:
%   \item[]   got help from:\footnote{People other than course staff.}
%   \item[]   and referred to:\footnote{Give citations to texts and
%             material other than the class texts, handouts, and last
%             term's bible.}  
%   \end{enumerate}} 
%
\newcommand{\coversheet}[1]{%
  \cleardoublepage
  \setcounter{footnote}{0}
  \formatpages[]
    {Solutions cover sheet}
    {Student's Solutions to Problem Set~#1}
    {\releasedateofpaper{ps#1}}
  \bigskip
  \begin{fminipage}
  \vspace{.35cm}
  \begin{tabular}{ll}
    \textbf{Your name:}       &                       \\[.35cm]
    \textbf{Due date:}        & \duedateofpaper{ps#1} \\[.35cm]
    \textbf{Submission date:} &                       \\[.35cm] 
%    \textbf{Circle your TA}:  & \courseassistants\\[.35cm] 
    \textbf{Write your}:      & \teaminfo
  \end{tabular}
  \vspace{.35cm}
  \end{fminipage}
  \bigskip\par
  \collaborationnote
  \vfill
  \bigskip\hrule\smallskip
  \centerline{\textbf{DO NOT WRITE BELOW THIS LINE}}
  \smallskip\hrule\bigskip
  \begin{center}
      \newcounter{rowcounter}
      \newcommand{\tablerows}{}
      \loop
         \ifnum\value{rowcounter}<\value{problem}
         \g@addto@macro\tablerows{%
             \addtocounter{rowcounter}{1}
             \therowcounter&\\\hline}
         \addtocounter{rowcounter}{1}
      \repeat 
      \setcounter{rowcounter}{0}
  \renewcommand{\arraystretch}{1.2}
  \begin{tabular}{|c|c|} \hline
    Problem &  Score \\ \hline
    \tablerows
    Total   &        \\ \hline
  \end{tabular}
  \end{center}}

\newcommand{\examtime}{%
  Renew $\backslash$\texttt{examtime} to get the time here!!%  
  \message{^^JExam time *INCORRECT*.^^J^^J}}

\newcommand{\miniqtime}{%
  Renew $\backslash$\texttt{miniqtime} to get the time here!!%  
  \message{^^JMiniquiz time *INCORRECT*.^^J^^J}}

\newcommand{\midtermtime}{%
  Renew $\backslash$\texttt{examtime} to get the time here!!%  
  \message{^^JMidterm time *INCORRECT*.^^J^^J}}

\newcommand{\courseassistants}{%
  Renew $\backslash$\texttt{courseassistants} to get 
  the TAs' names here!%  
  \message{^^JCourse assistants list *INCORRECT*.^^J^^J}}
\newcommand{\teaminfo}{%
  Renew $\backslash$\texttt{teaminfo} to get 
  Team info here!%  
  \message{^^JTeam info list *INCORRECT*.^^J^^J}}
\newcommand{\collaborationnote}{%
  You have to renew $\backslash$\texttt{collaborationnote} in
  \texttt{00course.dat} to have a collaboration statement form printed 
  in this space!
  \message{^^JCollaboration statement form *INCORRECT*.^^J^^J}}

%%% Exam problems %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% In any of the exam papers (quiz, final, practicequiz), use
% environment ``examproblem'' to define a problem along with its grade
% points; for example:
%      \begin{examproblem}{25}
%      Prove that you are a nice guy.
%      \end{examproblem}
% prints a problem that counts for 25 points. This causes the string
% ``(25 points)'' to appear next to the problem label.  
%   In addition, the points from all examproblems are collected and
% the grading table for the front page of the exam is formatted: just
% define each problem as an examproblem along with its points, then
% compile the paper twice; the second time the correct grades table
% will appear on the front page of the exam.
%
\let\examtablecontents\@empty

\newcommand{\examtableupdate}{%
    \begingroup
        \afterassignment\examtableupdate@
        \@tempcnta=
}

\newcommand{\examtableupdate@}{%
        \let\@elt\relax
        \protected@write\@auxout{}{%
            \protect\g@addto@macro\protect\examtablecontents{%
                 \protect\@elt{\theproblem}{\the\@tempcnta}%
             }%
         }%
    \endgroup
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Starting a paper %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Starts any paper (that has been defined in 00course.dat), given the
% paper's id, supertitle, and title.
%       The optional argument allows for revision info: if used, the 
% specified revision info is printed; if not, the \stamp info is
% printed. 
%
% Usage  : \paper[revision info]{paper id}{supertitle}{title}
% Example: Assuming the definition 
%               \newpaper{ln1}{Sep 5, 2001}{}
%          in 00course.dat, the command
%               \paper[v1.1]{ln1}{Lecture Notes~1}{Proofs}
%          starts v1.1 of the first lecture notes, titled ``Proofs''. 
%
% [ The command is the Same as \formatpages, but the paper release
% date is communicated via the paper id. ]  

\newcommand{\paper}[4][\stamp]{%
  \formatpages[#1]{#3}{#4}{\releasedateofpaper{#2}}}

% Starts an exam paper (that has been defined in 00course.dat), given the
% paper's id and title.
%       The optional argument allows for revision info: if used, the 
% specified revision info is printed; if not, the \stamp info is
% printed. 
%
% Usage  : \exam[revision info]{paper id}{paper title}
% Example: Assuming the definition 
%               \newpaper{ex1}{Sep 31, 2001}{}
%          in 00course.dat, the command
%               \exampaper[v1.1]{ex1}{Surprise Exam 1}
%          starts v1.1 of the first surprise exam. 
%
% [ The command is the Same as \formatexampages, but the paper's
% release is communicated via the paper id. ]  
%

\newcommand{\exampaper}[3][\stamp]{%
    \formatexampages[#1]{#3}{\releasedateofpaper{#2}}%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Starting lecture notes %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Starts lecture notes, given the lecture notes number and title. The
% corresponding paper must have been defined in 00course.dat, with id:
%       ln<number>
% The optional argument allows for revision info: if used, the
% specified revision info is printed; if not, the \stamp info is
% printed.  
%
% Usage  : \lecturenotes[revision info]{number}{title}
% Example: \lecturenotes[v1.1]{1}{Proofs}

\newcommand{\lecturenotes}[3][\stamp]{%
  \usenotesproblems
  \paper[#1]{ln#2}{Course Notes, Week~#2}{#3}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Starting a problem list %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Starts a Problem Set, given its number. Asks whether solutions
% should be included. If the answer is yes, the corresponding
% solutions paper is started. (Use \showsolutions or \hidesolutions
% to preselect the answer before the query ---and skip the query). The
% corresponding papers must have been defined in 00course.dat, with ids:   
%       ps<number>      (for the problem statements only), 
%       pss<number>     (for the solutions).
% The optional argument allows for revision info: if used, the
% specified revision info is printed; if not, the \stamp info is
% printed.  
%
% Usage  : \problemset[revision info]{number}
% Example: \problemset[v1.1]{13}   % for Problem Set #13, v1.1

\newcommand{\problemset}[2][\stamp]{%
  \theoremsunderproblems
    \ifshowstaffnotes
    \paper[#1]{pss#2}{}{Staff Solutions to Problem Set #2}
    \readingnote
    \else
    \ifshowsolutions
    \paper[#1]{pss#2}{}{Solutions to Problem Set #2}
    \readingnote
    \else
    \paper[#1]{ps#2}{}{Problem Set #2}
    \centerline{\emph{Due}: \duedateofpaper{ps#2}}
    \bigskip
    \readingnote 
%    \AtEndDocument{\coversheet{#2}}
    \fi
    \fi}

% Prints the reading note that appears on the first page of a problem
% set, right after the title. The \reading command should be redefined
% every week, to reflect the new reading.

\newcommand{\readingnote}{\par\noindent\textbf{Reading:} \reading}

\newcommand{\reading}{%
  Redefine the $\backslash$\texttt{reading} command to get this week's 
  reading assignment here!%
  \message{^^JReading assignment *INCORRECT*.^^J^^J}}

% Starts a In-Class Problems paper, given its code (week & day). Asks 
% whether solutions should be included. If the answer is yes, the
% corresponding solutions paper is started. (Use \showsolutions or
% \hidesolutions to preselect the answer before the query ---and skip
% the query). The corresponding papers must have been defined in
% 00course.dat, with ids:    
%       cp<code>      (for the statements only), 
%       cps<code>     (for the solutions).
% The optional argument allows for revision info: if used, the
% specified revision info is printed; if not, the \stamp info is
% printed.  
%
% Usage  : \inclassproblems[revision info]{code}
% Example: \inclassproblems[v1.1]{3W} % for Class Problems 3-W, v1.1 
%

\newcommand{\inclassproblems}[2][\stamp]{%
  \theoremsunderproblems
    \ifshowstaffnotes
    \paper[#1]{cps#2}{}{Staff Solutions to In-Class Problems Week #2}
    \else
    \ifshowsolutions
    \paper[#1]{cps#2}{}{Solutions to In-Class Problems Week #2}
    \else
    \paper[#1]{cp#2}{}{In-Class Problems Week #2}
    \fi  
    \fi}

\newcommand{\recitationproblems}[2][\stamp]{%
    \theoremsunderproblems
  \ifshowsolutions
    \paper[#1]{recs#2}{}{Solutions to Recitation Problems Week #2}
  \else
    \paper[#1]{rec#2}{}{Recitation Problems Week #2}
  \fi}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Starting an exam %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Starts a Quiz, given its number. Asks whether solutions
% should be included. If the answer is yes, the corresponding
% solutions paper is started. (Use \showsolutions or \hidesolutions
% to preselect the answer before the query ---and skip the query). The
% corresponding papers must have been defined in 00course.dat, with ids:   
%       qu<number>      (for the problem statements only), 
%       qus<number>     (for the solutions).
% The optional argument allows for revision info: if used, the
% specified revision info is printed; if not, the \stamp info is
% printed.  
%
% Usage  : \quiz[revision info]{number}
% Example: \quiz[v1.1]{3}   % for Quiz #3, v1.1
%

\newcommand{\quiz}[2][\stamp]{%
    \theoremsunderproblems
  %\useexamproblems
    \ifshowstaffnotes
    \paper[#1]{mqus#2}{}{Staff Solutions to Quiz #2}
    \ifshowsolutions
    \paper[#1]{qus#2}{}{Solutions to Quiz #2}
    \else
    \exampaper[#1]{qu#2}{Quiz #2}
  \fi}

\newcommand{\spotcheck}[2][\stamp]{%
  \theoremsunderproblems
  \ifshowsolutions
  \paper[#1]{spchs#2}{}{Solutions to Spotcheck #2}
  \else
  \paper[#1]{spch#2}{}{Spot Check #2}
  \fi}

\iffalse
\newcommand{\microquiz}[2][\stamp]{%
  \theoremsunderproblems
  \ifshowsolutions
  \paper[#1]{micros#2}{}{Solutions to Microquiz Week #2}
  \else
  \paper[#1]{micro#2}{}{Microquiz Week #2}
  \fi}

\newcommand{\prepcheck}[2][\stamp]{%
  \theoremsunderproblems
  \ifshowsolutions
  \paper[#1]{micros#2}{}{Solutions to Preparation Check #2}
  \else
  \paper[#1]{micro#2}{}{Preparation Check #2}
  \fi}
\fi

\newcommand{\topics}[2][\stamp]{%
  \theoremsunderproblems
  \ifshowsolutions
  \paper[#1]{tpcs#2}{}{Topic Solutions for Week #2}
  \else
  \paper[#1]{tpc#2}{}{Topics for Week #2}
  \fi}

\newcommand{\miniquiz}[2][\stamp]{%
    \theoremsunderproblems
    \ifshowstaffnotes
    \paper[#1]{mqus#2}{}{Staff Solutions to Mini-Quiz #2}
    \else
    \ifshowsolutions
    \paper[#1]{mqus#2}{}{Solutions to Mini-Quiz #2}
    \else
%        \exampaper[#1]{mqu#2}{Mini-Quiz #2}
    \paper[#1]{mqu#2}{}{Mini-Quiz #2}
    \fi
    \fi}

\newcommand{\midterm}[2][\stamp]{%
    \theoremsunderproblems
    \ifshowstaffnotes
    \paper[#1]{midtrms#2}{}{Staff Solutions to Midterm Exam #2}
    \else
    \ifshowsolutions
        \paper[#1]{midtrms#2}{}{Solutions to Midterm Exam #2}
    \else
        \exampaper[#1]{midtrm#2}{Midterm Exam #2}
    \fi
    \fi}

% Starts a Practice Quiz, given its number. Asks whether solutions
% should be included. If the answer is yes, the corresponding
% solutions paper is started. (Use \showsolutions or \hidesolutions
% to preselect the answer before the query ---and skip the query). The
% corresponding papers must have been defined in 00course.dat, with ids:   
%       pq<number>      (for the problem statements only), 
%       pqs<number>     (for the solutions).
% The optional argument allows for revision info: if used, the
% specified revision info is printed; if not, the \stamp info is
% printed.  
%
% Usage  : \practicequiz[revision info]{number}
% Example: \practicequiz[v1.1]{3}   % for Practice Quiz #3, v1.1
%
\newcommand{\practicequiz}[2][\stamp]{%
    \theoremsunderproblems
  %\useexamproblems
  \ifshowsolutions
    \paper[#1]{pqs#2}{}{Solutions to Practice Quiz #2}
  \else
    \exampaper[#1]{pq#2}{Practice Quiz #2}
  \fi}

% Starts a Final Exam. Asks whether solutions should be included. If
% the answer is yes, the corresponding solutions paper is
% started. (Use \showsolutions or \hidesolutions to preselect the
% answer before the query ---and skip the query). The corresponding
% papers must have been defined in 00course.dat, with ids:    
%       fe      (for the problem statements only), 
%       fes     (for the solutions).
% The optional argument allows for revision info: if used, the
% specified revision info is printed; if not, the \stamp info is
% printed.  
%
% Usage  : \final[revision info]
% Example: \final[v1.1]  % for v1.1 of the Final Exam

\newcommand{\final}[1][\stamp]{%
  \theoremsunderproblems
  %\useexamproblems
  \ifshowstaffnotes
  \paper[#1]{fes}{}{Staff Solutions to Final Exam}
  \else
  \ifshowsolutions
  \paper[#1]{fes}{}{Solutions to the Final Examination}
  \else
  \exampaper[#1]{fe}{Final Examination}
  \fi
  \fi
   }

\newcommand{\conflictfinalone}[1][\stamp]{%
  \theoremsunderproblems
  %\useexamproblems
  \ifshowstaffnotes
  \paper[#1]{cfes1}{}{Staff Solutions to Conflict Final 1}
  \else
  \ifshowsolutions
  \paper[#1]{cfes1}{}{Solutions to Conflict Final 1}
  \else
  \exampaper[#1]{cfe1}{Conflict Final 1}
  \fi
  \fi
}

\newcommand{\conflictfinaltwo}[1][\stamp]{%
  \theoremsunderproblems
  %\useexamproblems
  \ifshowstaffnotes
  \paper[#1]{cfes2}{}{Staff Solutions to Conflict Final 2}
  \else
  \ifshowsolutions
  \paper[#1]{cfes2}{}{Solutions to Conflict Final 2}
  \else
  \exampaper[#1]{cfe2}{Conflict Final 2}
  \fi
  \fi
}

\iffalse   %FIX
\newcommand{\makeupfinal}[2][\stamp]{%
  \theoremsunderproblems
  \ifshowstaffnotes
  \paper[#1]{mfes#2}{}{Staff Solutions to Makeup Final Exam#2}
  \else
  \ifshowsolutions
  \paper[#1]{mfes#2}{}{Solutions to Makeup Final Exam#2}
  \else
  \exampaper[#1]{mfe#2}{Makeup Final Exam#2}
  \fi
  \fi}

\fi

% Starts a Practice (Final) Exam, given its number. Asks whether
% solutions should be included. If the answer is yes, the
% corresponding solutions paper is started. (Use \showsolutions or
% \hidesolutions to preselect the answer before the query ---and skip
% the query). The corresponding papers must have been defined in
% 00course.dat, with ids:    
%       pe<number>      (for the problem statements only), 
%       pes<number>     (for the solutions).
% The optional argument allows for revision info: if used, the
% specified revision info is printed; if not, the \stamp info is
% printed.  
%
% Usage  : \practiceexam[revision info]{number}
% Example: \practiceexam[v1.1]{3}   % for Practice Exam #3, v1.1
%
\newcommand{\practiceexam}[2][\stamp]{%
    \theoremsunderproblems
  %\useexamproblems
  \ifshowsolutions
    \paper[#1]{pes#2}{}{Solutions to Practice Exam #2}
  \else
    \exampaper[#1]{pe#2}{Practice Exam #2}
  \fi}

\newcommand{\examappendix}[2][\stamp]{%
  \ifshowsolutions
    \paper[#1]{pes#2}{}{Solutions to Practice Exam #2}
  \else
    \exampaper[#1]{pe#2}{Practice Exam #2}
  \fi}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%
%%% COURSE PARAMETERS (NAMES & NUMBERS)
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Defines a new paper, given the paper's id, release date, and due
% date (if any). That is, 
%    \newpaper{id}{release date}{due date}
% For example:
%    \newpaper{ln1}{September  5, 2001}{ }
% defines the first Lecture Notes. They are out on Sep 5, 2001. There
% is no due date. Similarly,
%    \newpaper{ps2}{September 21, 2001}{September 28, 2001} 
% defines the 2nd Problem Set, released on Sep 21, 2001, and due on
% Sep 28, 2001. 
%
\newcommand{\newpaper}[3]{
  \global\expandafter\def\csname @paper@#1@out\endcsname{#2}
  \global\expandafter\def\csname @paper@#1@due\endcsname{#3}}

% Returns the releasedate/due date of a paper, given the
% paper's id. For example, given the definitions of the examples
% above, \releasedateofpaper{ln1} returns ``September 5, 2001'', and 
% \duedateofpaper{ps2} returns ``September 28, 2001''.
%
\newcommand{\releasedateofpaper}[1]{%
    \@ifundefined{@paper@#1@out}{%
        \ClassWarning{mcs}{Undefined paper id `#1'}%
    }{%
        \@nameuse{@paper@#1@out}%
    }%
}

\newcommand{\duedateofpaper}[1]{%
    \@ifundefined{@paper@#1@due}{%
        \ClassWarning{mcs}{Undefined paper id `#1'}%
    }{%
        \@nameuse{@paper@#1@due}%
    }%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                  %%
%%                           PAGE LAYOUT                            %%
%%                                                                  %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage[%
    includehead=true,
    paperwidth=8in,
    paperheight=9in,
    lmargin=2in,
    textwidth=5in,
    tmargin=24pt,
    bmargin=54pt
]{geometry}

\RequirePackage[frame,letter,center]{crop}

\parindent 1em

\newlength\titlehang
\titlehang=1in

\newlength\titlewidth
\titlewidth\textwidth
\advance\titlewidth\titlehang

%% \hoffset = -1.0 in
%% \voffset = -1.0 in
%% 
%% %% Based on "Cormen.cls" "CorA" option (8x9 trim size)
%% 
%% \paperwidth = 8 true in
%% \paperheight = 9 true in
%% \textwidth = 32pc
%% \parindent = 1em
%% 
%% \marginparwidth = 6pc
%% \setlength{\marginparsep}{0\p@}
%% \setlength{\marginparpush}{5\p@}
%% 
%% \pdfpagewidth=\paperwidth
%% \pdfpageheight=\paperheight
%% 
%% \setlength{\headheight}{8.28\p@}
%% \setlength{\topmargin}{45\p@}
%% 
%% \setlength{\headsep}{30.47\p@}
%% 
%% \setlength{\footskip}{21.9\p@}
%% 
%% \textheight = 37\baselineskip
%% 
%% % \textheight = \paperheight
%% % \advance\textheight -1 true in
%% % \addtolength{\textheight}{-\topmargin}
%% % \addtolength{\textheight}{-\headheight}
%% % \addtolength{\textheight}{-\headsep}
%% % \addtolength{\textheight}{-\footskip}
%% 
%% \evensidemargin\paperwidth
%% \advance\evensidemargin by -\textwidth
%% \divide\evensidemargin by 2
%% \oddsidemargin\evensidemargin
%% %\advance\oddsidemargin -1 true in

% % An indent of 1/8" (9pt) is far too little.  For this textwidth, you
% % want a minimum of 1em (10pt) and something approaching 2em wouldn't
% % be out of the question.  The LaTeX default of 15pt is pretty good.
% 
% %\setlength{\parindent}{0.125in}
% \setlength{\parskip}{0in}            
% \paperheight    =  9.0 in
% \paperwidth     =  7.0 in
% \topmargin      = 0.375 in
% \headheight     = 3\baselineskip
% \headsep        = 2\baselineskip
% \footskip       = 0.3 in
% 
% \textheight     = \paperheight
% \addtolength{\textheight}{-\topmargin}
% \addtolength{\textheight}{-\headheight}
% \addtolength{\textheight}{-\headsep}
% \addtolength{\textheight}{-\footskip}
% 
% \textwidth      = \paperwidth
% \oddsidemargin  = 1.0 in
% \evensidemargin = 1.0 in
% \addtolength{\textwidth}{-\oddsidemargin}
% \addtolength{\textwidth}{-\evensidemargin}

%% \newcommand{\printlayout}{%
%%   \typeout{----------------------- LaTeX Page Layout Parameters}
%%   \typeout{\string\paperwidth\space\space\the\paperwidth}
%%   \typeout{\string\paperheight\space\the\paperheight}
%%   \typeout{\string\textwidth\space\space\the\textwidth}
%%   \typeout{\string\textheight\space\the\textheight}
%%   \typeout{\string\oddsidemargin\space\space\the\oddsidemargin}
%%   \typeout{\string\evensidemargin\space\the\evensidemargin}
%%   \typeout{\string\topmargin\space\space\the\topmargin}
%%   \typeout{\string\headheight\space\the\headheight}
%%   \typeout{\string\headsep\space\the\headsep}
%%   \typeout{\string\footskip\space\space\space\the\footskip}
%%   \typeout{\string\marginparwidth\space\the\marginparwidth}
%%   \typeout{\string\marginparsep\space\space\space\the\marginparsep}
%%   \typeout{\string\hoffset\space\the\hoffset}
%%   \typeout{\string\voffset\space\the\voffset}
%%   \typeout{(1in=72.27pt, 1cm=28.45pt)}
%%   \typeout{-----------------------------------------}%
%% }

% Loads the definitions of all papers for the current term. This data
% file (00course.dat) should be kept in semester-specific directory.

\IfFileExists{00course.dat}{%
    \input{00course.dat}%
}{%
    \IfFileExists{\currentsemester/00course.dat}{%
        \input{\currentsemester/00course.dat}%
    }{}%
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%                                                                  %%
%%                      LOADING CLASS OPTIONS                       %%
%%                                                                  %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ifx\@class@option@file\@empty\else
    \input{\@class@option@file.clo}
\fi

%% Sticky solutions policy: If it exists, .solutionspolicy will
%% contain either \showsolutions or \hidesolutions.

\IfFileExists{.solutionspolicy}{%
    \input{.solutionspolicy}%
}{}

\IfFileExists{.editnotepolicy}{%
    \input{.editnotepolicy}%
}{}

\IfFileExists{.problemspolicy}{%
    \input{.problemspolicy}%
}{}

%% Don't let the trunk's .problemspolicy override ftlbranch

\ifftlbranch\showproblemsfalse\fi

\AtBeginDocument\decideaboutsolutions

%\flushbottom

\raggedbottom

\pagestyle{headings}

\endinput
