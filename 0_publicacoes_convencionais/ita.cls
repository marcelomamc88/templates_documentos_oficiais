%==============================================================================
% This is the ITA LateX class - classe de documento com padrões do ITA
% written by
%              Fábio Fagundes Silveira   -  ffs [at] ita [dot] br
%
%              Benedito C. O. Maciel     -  bcmaciel [at] ita [dot] br
%              Giovani Volnei Meinertz   -  giovani [at] ita [dot] br
%              Tarcisio A. B. Gripp      -  tarcisio.gripp [at] gmail [dot] com
%
% last updated: 
%        $Id: ita.cls 42 2015-04-08$
%        $HeadURL: http://www.apgita.org.br/apgita/teses-e-latex.php $
%
%
% Copyright (C) 2004-2008 ITALUS - ITA LaTeX Users Group "Society"  :-)
%
% This program is free software; you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation; either version 2 of the License, or
% (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with this program; if not, write to the Free Software
% Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
%
% ITALUS
% Instituto Tecnologico de Aeronautica --- ITA
% Sao Jose dos Campos, Brazil
% HomePages:        http://www.comp.ita.br/italus
%                   http://groups.yahoo.com/group/italus/
% Discussion list: italus {at} yahoogroups.com
%==============================================================================

%==============================================================================
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
%\ProvidesClass{ita}[2006/03/10 v2.0 Classe de documento com padrões do ITA]
\ProvidesClass{ita}[]

% % --------------------------------------------------------------------
% %  Verificação se alvo será gerado pelo PDFLaTeX ou não
% % --------------------------------------------------------------------
\IfFileExists{ifpdf.sty}{\RequirePackage{ifpdf}}{\newif\ifpdf}
%\newif\ifpdf
%  \ifx\pdfoutput\undefined
 %     \pdffalse
  %\else
   %   \pdfoutput=1
    %  \pdftrue
 %\fi

%==============================================================================
%%% Declaracao das opcoes
%==============================================================================
\DeclareOption{defaults}{
  \input{defaults.def}
}
% Mestrado
\DeclareOption{msc}{
  \input{msc.def}
}
% Mestra
\DeclareOption{mscfem}{
  \input{mscfem.def}
}
% Doutorado
\DeclareOption{dsc}{
  \input{dsc.def}  
}

% Versao em ingles
\newif\if@eng
\DeclareOption{eng}{
    \@engtrue
}
\DeclareOption{classic}{

    \newcommand{\itaformatworktitle}[1]{\Large \textbf{#1}}
    \newcommand{\itaformatauthorname}[1]{\large \textbf{#1}}
    \newcommand{\itaformattitletext}[1]{\large{#1}}
    \newcommand{\itaformatadvisorword}[1]{#1}

    \renewcommand{\itaspacing}{1.5}
}

%==============================================================================
%%% dv: 'draft version': imprime ´Versao Preliminar´ + data da impressao
%==============================================================================
\newif\if@dv
\DeclareOption{dv}{
    \@dvtrue
}

\ExecuteOptions{defaults,classic}
\ProcessOptions
\AtEndOfPackage{
    \renewcommand{\baselinestretch}{\itaspacing}
}
 
  
%==============================================================================
%%% Heranca e Pacotes ...
%==============================================================================
\LoadClass[12pt,oneside]{book} %Retirei o a4paper,
\RequirePackage{calc}
\RequirePackage{ifthen}

\if@eng
   \RequirePackage[english]{babel}
\else
   \RequirePackage[english,brazil]{babel}
\fi

 \if@eng
   \input{itaeng.babel}
 \else
   \input{itabr.babel}
 \fi

\RequirePackage[utf8]{inputenc}
\RequirePackage{setspace}
\RequirePackage{fancyhdr}
\RequirePackage{amsfonts}                 % Fontes p/ conjuntos: R,Z,H,...
\RequirePackage{lastpage}
\RequirePackage{indentfirst}
%ajustando fonte das legendas. Se quiser aumentar um pouco as legendas, troque footnotesize por small
%\RequirePackage[labelsep=endash,font=footnotesize]{caption}
\RequirePackage[labelsep=endash]{caption}
\RequirePackage{longtable}
\RequirePackage{array}
\RequirePackage{tabularx}
\RequirePackage{ragged2e} % PERMITE TEXTO JUSTIFICADO COM "\justifying"
\RequirePackage{enumitem} %  ITEMIZE STYLE
\RequirePackage{tocloft}    % TABLE OF CONTENTS SUMÁRIO

%==============================================================================
% PACOTES PARA A CENTRALIZAÇÃO DA ASSINATURA DA AUTORIDADE QUE APROVA
\RequirePackage{varwidth}   
\RequirePackage{titlecaps}   
\Addlcwords{do da em na no de}  % PREPOSIÇÕES NÃO CAPITALIZÁVEIS
%==============================================================================



%==============================================================================
% CRIAÇÃO DA TABELA ESTILO NA CAPA
\RequirePackage{tabularray}
\NewColumnType{M}[1]{Q[m,c,#1]}
%==============================================================================
% REMOVER APOS AJUSTE DA CAPA E FRONT DE ACORDO COM NSCA
\RequirePackage{transparent} 
\RequirePackage{eso-pic}
%==============================================================================



%==============================================================================
%% opcoes de cores
%% linkcolor=blue,citecolor=gray,urlcolor=cyan
\RequirePackage{color}        %% aplicar cores no texto
\RequirePackage{hyphenat}     %% hifenização
\RequirePackage{makeidx}      %% ÍNDICE

%==============================================================================
%%% Hyperref
\definecolor{gray}{rgb}{0.4,0.4,0.4}
\definecolor{bblue}{rgb}{0,0,.8} %% tom azul mais escuro

%\RequirePackage[debug,a4paper,pagebackref=true,breaklinks,bookmarksopen=true,colorlinks=true,linkcolor=bblue,citecolor=bblue,urlcolor=bblue,bookmarksnumbered=true,hyperindex=true,verbose=true]{hyperref} %% essencial %% gera pdf/dvi com links

%% LINKS ALTERADOS PARA COR PRETA
\RequirePackage[debug,pagebackref=true,breaklinks,bookmarksopen=true,colorlinks=true,linkcolor=black,citecolor=black,urlcolor=black,bookmarksnumbered=true,hyperindex=true,verbose=true]{hyperref} %Retirei o a4paper,

%%% Glossário
%\usepackage{makeglo}
\RequirePackage[acronym]{glossaries} %alteração
%\renewcommand{\glspagelistwidth}{\hspace{3cm}}
%\renewcommand{\glossmaxlabelwidth}{\hspace{3cm}}

%\setglossarystyle{super} %alteração 
%\setglossarystyle{long}
%==============================================================================

\ifpdf
  \RequirePackage{mathptmx} %% FONTE TIMES NEW ROMAN
  \RequirePackage[pdftex]{graphicx}
  \RequirePackage[pdftex]{geometry}
\else
  \RequirePackage[T1]{fontenc}
  \RequirePackage[dvips]{graphicx}
  \RequirePackage[dvips]{geometry}
\fi

% dimensoes das paginas
\geometry{
    a4paper,    % PÁGINA A4 SEGUNDO NSCA 5-1/2011
    twoside,
    left=3cm,
    right=2cm,
    top=3cm,
    bottom=2cm,
    verbose,
    headheight=2cm, 
    footskip=3pt,
    includehead=false}

\newif\ifhyperref
\@ifpackageloaded{hyperref}{\hyperreftrue}{\hyperreffalse}

%==============================================================================
%%% ABNTeX ...
\RequirePackage[alf,abnt-emphasize=bf,abnt-etal-cite=1,abnt-etal-list=3,abnt-etal-text=it]{abntcite}
%abnt-repeated-author-omit=yes
%\RequirePackage{cite} %alteração
%\RequirePackage{abntex2cite} %alteração
%\RequirePackage{natbib}

%==============================================================================
% ALTERAR TAMANHO DA FONTE DOS TÍTULOS
%\RequirePackage{titlesec} %alterar tamanho da fonte
%\titleformat{\section}
% {\large\bfseries}{\thesection}{0.5em}{}
%\titleformat{\subsection}
% {\normalsize\bfseries}{\thesubsection}{0.5em}{}	
%\titleformat{\subsubsection}
% {\normalsize\bfseries}{\thesubsubsection}{0.5em}{}	
%\titleformat{\paragraph} % para 4o nivel
% {\normalsize\bfseries}{\theparagraph}{0.5em}{}	

%==============================================================================
% Redefinição da data (para ter dia, mês e ano separados)
%==============================================================================
\renewcommand{\date}[3]{
        \gdef\@publday{#1}
        \gdef\@publmonth{#2}
        \gdef\@publyear{#3}
}
\date{\dayname}{\monthname}{\number\year}

%==============================================================================
%%% Novas Fontes
%==============================================================================
%--------------------------------{TAMANHO}{ESPAÇAMENTO}---------------------
\newcommand{\FonteOnzeCapa}{\fontsize{11}{11}\selectfont}
\newcommand{\FonteDozeCapa}{\fontsize{14.2}{14.2}\selectfont}
\newcommand{\FonteDezesseteCapa}{\fontsize{16}{16}\selectfont}
\newcommand{\FonteDezenoveCapa}{\fontsize{17.5}{17.5}\selectfont}
\newcommand{\FonteCorpoDoze}{\fontsize{12}{12}\selectfont}


%==============================================================================
%%% Novos comandos: \author, \authoraddress, \advisor, \coadvisor,
%%% \boss, etc ...  ;-)
%==============================================================================
% Comando - Fonte 17 - \FonteDezesseteCapa
\newcommand{\comando}[1]{
  \gdef\@comando{#1}
}

% Comando - Fonte 12 - \FonteDozeCapa
\newcommand{\omelaboradora}[1]{
  \gdef\@omelaboradora{#1}
}

% Assunto Básico - Fonte 19 - \FonteDezenoveCapa
\newcommand{\assuntobasico}[1]{
  \gdef\@assuntobasico{#1}
}

% Sigla da Espécie da Publicação - Fonte 11
\newcommand{\siglaespecie}[1]{
  \gdef\@siglaespecie{#1}
}

% Número Básico e Secundário da Publicação - Fonte 11
\newcommand{\numerobasicosecundario}[1]{
  \gdef\@numerobasicosecundario{#1}
}

% Título da Publicação - Fonte 11
\newcommand{\titulo}[1]{
  \gdef\@titulo{#1}
}

% Ano de Aprovação do Ato - Fonte 11
\newcommand{\anoaprovacao}[1]{
  \gdef\@anoaprovacao{#1}
}

% Órgão Superior que aprovou a Legislação - Fonte 12 - \FonteCorpoDoze
\newcommand{\orgaoaprovador}[1]{
  \gdef\@orgaoaprovador{#1}
}

% Portaria ou outro ato de aprovação da Legislação - Fonte 12 - \FonteCorpoDoze
\newcommand{\publicacaoDeAprovacao}[1]{
  \gdef\@publicacaoDeAprovacao{#1}
}

% Número de Protocolo do Ato de Aprovação - Fonte 12 - \FonteCorpoDoze
\newcommand{\nupAprovacao}[1]{
  \gdef\@nupAprovacao{#1}
}

% Preâmbulo do Ato de Aprovação - Fonte 12 - \FonteCorpoDoze
\newcommand{\preTxtAto}[1]{
  \gdef\@preTxtAto{#1}
}

% Posto da autoridade que aprova - Fonte 12 - \FonteCorpoDoze
\newcommand{\postoAutoridade}[1]{
  \gdef\@postoAutoridade{#1}
}

% Nome da autoridade que aprova - Fonte 12 - \FonteCorpoDoze
\newcommand{\nomeAutoridade}[1]{
  \gdef\@nomeAutoridade{#1}
}

\RequirePackage{etoolbox}
% Gênero da Autoridade que aprova para os artigos - Fonte 12 - \FonteCorpoDoze
\newcommand{\generoAutoridade}[1]{
  \gdef\@generoAutoridade
    {\ifstrequal{#1}{m}{O}
    {\ifstrequal{#1}{f}{A}
    {\PackageError{generoAutoridade}{Gênero da autoridadenão definido corretamente}{}}}}
}


% Cargo da autoridade que aprova - Fonte 12 - \FonteCorpoDoze
\newcommand{\cargoAutoridade}[1]{
  \gdef\@cargoAutoridade{#1}
}

% Texto do ato de aprovação - Fonte 12 - \FonteCorpoDoze
\newcommand{\txtAprovacao}[1]{
  \gdef\@txtAprovacao{#1}
}

% Impressão de Artigos no texto de aprocação - Fonte 12 - \FonteCorpoDoze
\newcommand{\artTxTAprova}[1]{
  \gdef\@artTxTAprova{
    \begin{enumerate}[leftmargin=0pt, %AONDE COMEÇA O BOX DO PARÁGRAFO
                labelindent=10pt, %IDENT DO LABEL PARA TRÁS
                labelwidth=10pt, %TAMANHO DO LABEL PARA TRÁS
                labelsep=5pt, %SEPARAÇÃO LABEL DO TEXTO DO ITEM
                itemindent=85pt, %IDENT DO TEXTO DO ITEM
                parsep=5pt, %SEPARAÇÃO ENTRE PARAGRAFOS INTERNOS
                itemsep=10pt, %SEPARAÇÃO ENTRE ITENS
                listparindent=20pt, %ESPAÇO DE TAB DOS PARÁGRAFOS
                font=Art\hspace{2pt},
                label=\arabic*\textsuperscript{o}
                ] 
        #1
    \end{enumerate}
  }
}

% Data publicação ato de aprovação - Fonte 12 - \FonteCorpoDoze
\newcommand{\dateAprovacao}[1]{
  \gdef\@dateAprovacao{#1}
}

% Autor...
\renewcommand{\author}[2]{%               % Nome, Sobrenome
  \gdef\@authorfirst{#1}
  \gdef\@authorlast{#2}
}
% Endereco do Autor (utilizado no verso da folha de rosto
\renewcommand{\itaauthoraddress}[3]{%
  \gdef\@itaauthoraddress{#1}
  \gdef\@itaauthorcep{#2}
  \gdef\@itaauthorcity{#3}
}
% Orientador...
\newcommand{\advisor}[4][\itaadvisorwordbabel]{     % [word] ,title, name
  \renewcommand{\itaadvisorname}{#3}
  \renewcommand{\itaadvisortitle}{#2}
	\gdef\@itaadvisorinst{#4}
  \renewcommand{\itaadvisorword}{#1}
  \gdef\@advisortg{#1 \\ #2~#3 (#4)}
  \gdef\@advisor{#2~#3 \\ #1}
  \gdef\itaadvisorwordbabelll{#1}
}
% Coorientador...  (opcional)
\newcommand{\coadvisor}[4][\itacoadvisorwordbabel]{%
  \gdef\@itacoadvisorname{#3}
  \gdef\@itacoadvisortitle{#2}
  \gdef\@itacoadvisorinst{#4}
  \gdef\@coadvisortg{#1 \\ #2~#3 (#4)}
  \gdef\@coadvisor{#2~#3 \\ #1}
  \gdef\itacoadvisorwordbabelll{#1}
}
% Pro-Reitor de Pos-Graduacao e Pesquisa...
\newcommand{\boss}[3][\itabosswordbabel]{      %[word] ,title, name
  \renewcommand{\itabossname}{#3}
  \renewcommand{\itabosstitle}{#2}
  \renewcommand{\itabossword}{#1}
  \gdef\@boss {#2~#3 \\ #1}
}
% Coordenador do respectivo curso de graduação...
\newcommand{\bosscourse}[3][\itabosscoursewordbabel]{      %[word] ,title, name
  \renewcommand{\itabosscoursename}{#3}
  \renewcommand{\itabosscoursetitle}{#2}
  \renewcommand{\itabosscourseword}{#1}
  \gdef\@bosscourse {#2~#3 \\ #1}
}
% Curso de Graduação/Programa de Pós-Graduação...
\newcommand{\course}[1]{
  \renewcommand{\itaworkcourse}{#1}
}
% Area do Curso...
\newcommand{\area}[1]{
  \renewcommand{\itaworkarea}{#1}
}
% Número de CDU...
\newcommand{\cdu}[1]{
  \renewcommand{\cdunumber}{#1}
}
% Sexo do autor...
\newcommand{\authorgender}[1]{
  \renewcommand{\authorgendermf}{#1}
}
% Sexo do orientador...
\newcommand{\advisorgender}[1]{
  \renewcommand{\advisorgendermf}{#1}
}
% Sexo do coorientador...
\newcommand{\coadvisorgender}[1]{
   \renewcommand{\coadvisorgendermf}{#1}
}
% Sexo do Pró-reitor da Pós-graduação...
\newcommand{\bossgender}[1]{
  \renewcommand{\bossgendermf}{#1}
}
% Sexo do Coordenador do curso no caso de TG...
\newcommand{\bosscoursegender}[1]{
  \renewcommand{\bosscoursegendermf}{#1}
}
%==============================================================================
%%% Hack: Pagina de Rosto para Teses
%==============================================================================
\newcommand{\itatitletext}{\itatitletextbabel}

\renewcommand{\maketitle}{%
   \begin{titlepage}					
			\pdfbookmark[0]{\nametitlepage}{titulo}
      \thethesistitlepage
      \makefrontispicio
      \makeatoaprovacao
   \end{titlepage}
   \setcounter{page}{0}
							
}

%==============================================================================
% Legislações Oficiais da Força Aérea Brasileira
%==============================================================================
\newcommand{\thethesistitlepage}{%
  
  %================================================
  % CAPA
  %================================================
  
% IMAGEM DE REFERÊNCIA PARA AJUSTES DA CAPA. REMOVER APÓS OS AJUSTES CONFORME NSCA 5-1
%\AddToShipoutPicture*{
%    \put(0,0){
%        \parbox[b][\paperheight]{\paperwidth}{%
%            \vfill
%            \centering
%            {\transparent{.5}\hspace{-6pt}\includegraphics[\textwidth]{0_publicacoes_convencionais/_imagens/capa.png}}%
%            \vfill
%        }
%    }
%}

  
  \center
  \begin{minipage}[t][3.55cm][b]{\textwidth}
    \centering
    \MakeUppercase{\FonteDezesseteCapa \textbf{\ministeriodefesa}}
    \\
    \MakeUppercase{\FonteDezesseteCapa \textbf{\@comando}}  
  \end{minipage}
  
    \vspace{2cm}   

  \begin{minipage}[t][5cm][c]{\textwidth}
    \centering
    \includegraphics[width=7cm]{_imagens/BRASAO_FAB.png}
  \end{minipage}

   
  \begin{minipage}[t][3.26cm][c]{\textwidth}
    \centering
    \MakeUppercase{\FonteDezenoveCapa \textbf{\@assuntobasico}} 
  \end{minipage}

  \thispagestyle{empty} 
  \framebox(10cm,5cm){
    \centering
    \begin{tblr}[t]{colspec={M{9cm}},row{1}={0.5cm}, row{2}={3.5cm}, row{3}={0.5cm}}
        \FonteOnzeCapa 
        \textbf{\@siglaespecie}\;\textbf{\@numerobasicosecundario}
        \\
        \FonteOnzeCapa 
        \textbf{\MakeUppercase{\@titulo}}
        \\
        \FonteOnzeCapa 
        \textbf{\@anoaprovacao}\\
        \\
    \end{tblr}
  }
  \vfill
  
}

%==============================================================================
% Frontispício
%============================================================================== 
\newcommand{\makefrontispicio}{%
  \newpage
  
% IMAGEM DE REFERÊNCIA PARA AJUSTES DO FRONTISPÍCIO AJUSTES CONFORME NSCA 5-1
%\AddToShipoutPicture*{\put(0,0){\parbox[b][\paperheight]{\paperwidth}{\vfill\centering
%{\transparent{.5}\hspace{-14pt}\includegraphics[\textwidth]{0_publicacoes_convencionais/_imagens/frontspicio.png}}\vfill}}}

  \center
  \begin{minipage}[t][3.5cm][b]{\textwidth}
    \centering
    \MakeUppercase{\FonteDezesseteCapa \textbf{\ministeriodefesa}}
    \\
    \MakeUppercase{\FonteDezesseteCapa \textbf{\@comando}} 
  \end{minipage}
  \\[3pt]
  \begin{minipage}[t][1.67cm][t]{\textwidth}
    \centering
    \MakeUppercase{\FonteDozeCapa \@omelaboradora}
  \end{minipage}


  \begin{minipage}[t][5cm][c]{\textwidth}
    \centering
    \includegraphics[width=7cm]{_imagens/BRASAO_FAB.png}
  \end{minipage}
   
  \begin{minipage}[t][3.26cm][c]{\textwidth}
    \centering
    \MakeUppercase{\FonteDezenoveCapa \textbf{\@assuntobasico}} 
  \end{minipage}

  \thispagestyle{empty}         		
  \framebox(10cm,5cm){
    \centering
    \begin{tblr}[t]{colspec={M{9cm}},row{1}={0.5cm}, row{2}={3.5cm}, row{3}={0.5cm}}
        \FonteOnzeCapa 
        \textbf{\@siglaespecie}\;\textbf{\@numerobasicosecundario}
        \\
        \FonteOnzeCapa 
        \textbf{\MakeUppercase{\@titulo}}
        \\
        \FonteOnzeCapa 
        \textbf{\@anoaprovacao}\\
        \\
    \end{tblr}
  }
  \vfill
  
 }

%==============================================================================
% Ato de Aprovação
%============================================================================== 
\newcommand{\makeatoaprovacao}{%
  \newpage
  \pagestyle{empty}
% IMAGEM DE REFERÊNCIA PARA AJUSTES Do front. REMOVER APÓS OS AJUSTES CONFORME NSCA 5-1
%\AddToShipoutPicture*{\put(-4,-1){\parbox[b][\paperheight]{\paperwidth}{\vfill\centering
%{\transparent{.7}\includegraphics{0_publicacoes_convencionais/_imagens/ato_aprovacao.png}}\vfill}}}
    
    \begin{minipage}[t][4.3cm][t]{\textwidth}
        \centering
        \vspace{-1.4cm}
        \includegraphics[scale=0.246]{0_publicacoes_convencionais/_imagens/BARSAO_REPUBLICA.png}
        \\
        \MakeUppercase{\FonteCorpoDoze \textbf{\ministeriodefesa}}
        \\[-4pt]
        \MakeUppercase{\FonteCorpoDoze \textbf{\@comando}} 
        \\[-4pt]
        \MakeUppercase{\FonteCorpoDoze \@orgaoaprovador}
        \\[1.31cm]
        \MakeUppercase{\FonteCorpoDoze \@publicacaoDeAprovacao}
    \end{minipage}
    
    \begin{minipage}[t][.85cm][t]{\textwidth}
        {
            \parindent=0pt\relax
            \FonteCorpoDoze \@nupAprovacao
        }
    \end{minipage}
    
    \begin{flushright}
        \parbox{8cm}{\FonteCorpoDoze \@preTxtAto}
        \\[1.1cm]
    \end{flushright}
    
    \justifying
    \FonteCorpoDoze
    \textbf{\MakeUppercase{\@generoAutoridade\hspace{3pt}\@cargoAutoridade}},\hspace{3pt}\@txtAprovacao
    
    \justifying
    \@artTxTAprova
    
    %   ASSINATURA AUTORIDADE
    \begin{minipage}[t][2.3cm][b]{\textwidth}
        \begin{flushright}
            \begin{varwidth}{\linewidth}
                \centering
                \FonteCorpoDoze
                \titlecap{\@postoAutoridade} \MakeUppercase{\@nomeAutoridade}
                \\
                \titlecap{\@cargoAutoridade}
            \end{varwidth}
        \end{flushright}
    \end{minipage}
    
    \vfill
    
    {
        \parindent=0pt\relax
        \FonteCorpoDoze \@dateAprovacao
    }

}


%==============================================================================
%%% Banca Examinadora...
%==============================================================================
\newcommand{\@listexaminators}
{
   \newpage
   \pdfbookmark[0]{\namepageexaminersbookmark}{aprovacao}
   \thispagestyle{empty}

   \noindent
   
	 \ifthenelse{\equal{\itaoptionlevel}{tg}}
	     {
			 \begin{spacing}{1.0}
       \begin{center}
         \itaformatworktitle{\MakeUppercase{\@title}}
         \vfill
         \small{\itathesisapprovedmemberstg}
				 \vspace*{\stretch{3}}
			 		 
			 	 \hspace{3cm}\hrulefill\hspace{3cm}
				 \par 
				 \small{\@authorfirst\ \@authorlast
				 \par
				 \@authorword\ifthenelse{\equal{\authorgendermf}{masc}}{}{\if@eng \else a\fi}}
				 \vspace*{\stretch{1}}
			 		 
			 	 \hspace{3cm}\hrulefill\hspace{3cm}
				 \par 
				 \small{\itaadvisorname\ (\@itaadvisorinst )
				 \par
				 \itaadvisorwordbabelll}
         \vspace*{\stretch{1}}
			 		
				 \@ifundefined{@coadvisor}{}{      % Co-advisor eh opcional
			 	 \hspace{3cm}\hrulefill\hspace{3cm}
				 \par 
				 \small{\@itacoadvisorname\ (\@itacoadvisorinst )
				 \par
				 \itacoadvisorwordbabelll}
				 \vspace*{\stretch{1}}
				 }
				
			 	 \hspace{3cm}\hrulefill\hspace{3cm}
				 \par 
				 \small{\@bosscourse}
				 \vspace*{\stretch{2}}
				
				 \if@eng
						\small{S{\~a}o Jos{\'e} dos Campos: \@publmonth\ \@publday, \@publyear.}
				 \else
						\small{S{\~a}o Jos{\'e} dos Campos, \@publday\ de \@publmonth\ de \@publyear.}
				 \fi
				
			 \end{center}
			 \end{spacing}
			 
			 } 
	     {	
	     \begin{spacing}{1.0}
       \begin{center}
         \itaformatworktitle{\MakeUppercase{\@title}}
         \vfill
         \itaformatauthorname{\@authorfirst\ \@authorlast}
				 \vfill
			 \end{center}
			
			 \raggedright{\normalsize{\namepageexaminers}}
       \vfill
    
       \raggedright\@memberslist
        
       \end{spacing}
       \vfill
       \center
       \large\textbf{ITA}
       }
}

%==============================================================================
%%% Dedicatória...
%==============================================================================
\newenvironment{itadedication}
{\thispagestyle{empty}%
  \pdfbookmark[0]{\namededicatory}{dedication}
  \begin{flushright}%
  \null\vfil \@beginparpenalty\@lowpenalty
  \vspace{120mm}
  \hspace{80mm}
  \begin{minipage}[b]{0.45\textwidth}\begin{spacing}{1.5}}
{\end{spacing}\end{minipage}\end{flushright}\par\vfil\null\newpage}

%==============================================================================
%%% Agradecimentos...
%==============================================================================
%%alterado em 09/01/2015: retirado o alinhamento do texto à direta 
%\newenvironment{itathanks}[1][\nameacknowledgment]
%{
% \chapter*{#1}
% \pdfbookmark[0]{\nameacknowledgment}{acknowledgment}
% \begin{flushright}\begin{spacing}{1.5}}
% {\end{spacing}\end{flushright} \par\vfil\null\newpage}

\newenvironment{itathanks}[1][\nameacknowledgment]
{
 \chapter*{#1}
 \pdfbookmark[0]{\nameacknowledgment}{acknowledgment}
 }
 {\par\vfil\null\newpage}

%==============================================================================
%%% Resumo ...
%==============================================================================
\newenvironment{abstract}
{\chapter*{\nameabstract}
 \pdfbookmark[0]{\nameabstract}{resumo}\noindent}{}

%==============================================================================
%%% Abstract ...
%==============================================================================
\newenvironment{englishabstract}
{\chapter*{\nameengabstract}
 \pdfbookmark[0]{\nameengabstract}{abstract}\noindent}{}

%==============================================================================
%%% Redefinicao de chapter
%==============================================================================
\renewcommand\chapter{\if@openright\cleardoublepage\else\clearpage\fi
                    \thispagestyle{empty}%
                    \global\@topnum\z@
                    \@afterindenttrue
                    \secdef\@chapter\@schapter}
% Redefinicao do espaco entre paragrafos
\setlength{\parskip}{.5em}

%==============================================================================
%%% Hack: Adicionando Bibliografia, Lista de Figuras, Lista de Tabelas,
%%% Lista de Simbolos e Lista de Abreviaturas ao Sumario
%==============================================================================
% Bibliografia
\renewenvironment{thebibliography}[1]
     {\chapter*{\bibname
      \refstepcounter{chapter}
      \addcontentsline{toc}{chapter}{\bibname}   % Thanks to D.Farfan
      \@mkboth{\MakeUppercase{\bibname}}%
              {\MakeUppercase{\bibname}}}%       % Thanks to ffs :-)
      \singlespacing			
			\flushleft				
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
}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}

% Lista de figuras...
\renewcommand\listoffigures{%
    %\begin{spacing}{1.5}   %ita
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\listfigurename
      \@mkboth{\MakeUppercase{\listfigurename}}%
              {\MakeUppercase{\listfigurename}}}      % Thanks to Reinaldo Fortes
    %\addcontentsline{toc}{chapter}{\listfigurename}   % Thanks to D.Farfan
		\pdfbookmark[0]{\listfigurename}{listafiguras}
    \@starttoc{lof}%
    \if@restonecol\twocolumn\fi
    %\end{spacing}   %ita
    }

% Lista de tabelas...
\renewcommand\listoftables{%
    %\begin{spacing}{1.5}   %ita
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\listtablename
      \@mkboth{\MakeUppercase{\listtablename}}%
               {\MakeUppercase{\listtablename}}}     % Thanks to Reinaldo Fortes
%    \addcontentsline{toc}{chapter}{\listtablename}   % Thanks do D.Farfan
		\pdfbookmark[0]{\listtablename}{listatabelas}
    \@starttoc{lot}%
    \if@restonecol\twocolumn\fi
    %\end{spacing}   %ita
    }

% Redefinicao do Sumário...
\renewcommand\tableofcontents{
\cftsetindents{chapter}{0em}{2em}
\cftsetindents{section}{2em}{3em}
\cftsetindents{subsection}{5em}{4.2em}
\cftsetindents{subsubsection}{9.2em}{5em}
}
\renewcommand{\cftpartfont}{\sffamily\bfseries\LARGE}
\renewcommand{\cftchapfont}{\sffamily\bfseries\Large}
\renewcommand{\cftsecfont}{\sffamily\bfseries}
\renewcommand{\cftsubsecfont}{\sffamily\bfseries}

%\renewcommand\tableofcontents{% 
    %\begin{spacing}{1.5}   %ita
 %   \if@twocolumn
 %     \@restonecoltrue\onecolumn
 %   \else
 %     \@restonecolfalse
 %   \fi
 %   \chapter*{\MakeUppercase{\contentsname}
 %       \pdfbookmark[0]{\namecontents}{contents}
 %       \@mkboth{\MakeUppercase{\contentsname}}%
 %                {\MakeUppercase{\contentsname}}}       % Thanks to Reinaldo Fortes
 %    \@starttoc{toc}%
 %   \if@restonecol\twocolumn\fi
    %\end{spacing}   %ita
 %   }

% Lista de Símbolos...
\newcommand\listofsymbols{%
    %\begin{spacing}{1.5}   %ita
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\listofsymbolsname
      \@mkboth{\MakeUppercase{\listofsymbolsname}}%
              {\MakeUppercase{\listofsymbolsname}}}%         Thanks to Reinaldo Fortes
%    \addcontentsline{toc}{chapter}{\listofsymbolsname}%      Thanks to ffs  :-)
		\pdfbookmark[0]{\listofsymbolsname}{listasimbolos}
    \@starttoc{lof}%
    \if@restonecol\twocolumn\fi
    %\end{spacing}   %ita
    }

% Lista de Abreviaturas...
\newcommand\listofabbreviations[2]{%
    %\begin{spacing}{1.5}   %ita
		\begin{flushleft}
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{{\listofabbreviationsname}
      \@mkboth{\MakeUppercase{\listofabbreviationsname}}%       Thanks to Reinaldo Fortes
              {\MakeUppercase{\listofabbreviationsname}}}%

		\pdfbookmark[0]{\listofabbreviationsname}{listaabreviaturas}
    \@starttoc{lof}%
    \if@restonecol\twocolumn\fi
    \end{flushleft}
		%\end{spacing}   %ita

    %Thanks to Ten QOAP ANS Marcelo Conceição and Cap AV Oswaldo Neto
    \glssetwidest{#2} 
    \printglossary[type=\acronymtype, nonumberlist, style=#1]
    }


    \newcommand\printgtt[1]{ %Thanks to Ten QOAP ANS Marcelo Conceição and Cap AV Oswaldo Neto
    \chapter{\centering \glossarytechnicalterms}
    \setglossarysection{subsection}
    \printglossary[nonumberlist, style=#1]
  }



%==============================================================================
%%% Cabecalhos e Rodapés
%==============================================================================
\RequirePackage{lastpage}
\pagestyle{fancy}
\fancyfoot{} 
\fancyhf{}
\fancyhead[LO,RE]{\textbf{\@siglaespecie \hspace{1pt} \@numerobasicosecundario/\@anoaprovacao}}
\fancyhead[RO,LE]{\textbf{\thepage/\pageref{LastPage}}}
%\lhead{\textbf{\@siglaespecie \hspace{1pt} \@numerobasicosecundario/\@anoaprovacao}}
\chead{}
%\rhead{\textbf{\thepage/\pageref{LastPage}}}
\lfoot{}\cfoot{}\rfoot{}
\renewcommand{\headrulewidth}{0pt} % REMOVE LINHA DO HEADDER
\renewcommand{\footrulewidth}{0pt} % REMOVE LINHA DO FOOTER
% Imprimir rodape com versao preliminar?
  \if@dv
     \rfoot{\emph{\itadvnamebabel\ \today }}
  \fi

%==============================================================================
%%% Membros da banca examinadora
%==============================================================================
\newcounter{mecounter}
\newcommand{\examiner}[4]{
        \addtocounter{mecounter}{1}
        \expandafter\gdef\csname metitle\alph{mecounter}\endcsname{#1}
        \expandafter\gdef\csname mename\alph{mecounter}\endcsname{#2}
        \expandafter\gdef\csname merole\alph{mecounter}\endcsname{#3}
        \expandafter\gdef\csname meinst\alph{mecounter}\endcsname{#4}
}

\newcommand{\@memberslist}{%
   \begin{tabular}{l l l l}
      \@ifundefined{metitlea}{}    {\metitlea\@         & \menamea\@       & \hspace{1cm} \merolea\@ & - \hspace{0.5cm} \meinsta\@ } \\
                                 \itaadvisortitle   & \itaadvisorname  & \hspace{1cm} \itaadvisorwordbabelll & - \hspace{0.5cm} \@itaadvisorinst       

      \@ifundefined{@coadvisor}{}  {\\ \@itacoadvisortitle   & \@itacoadvisorname  & \hspace{1cm} \itacoadvisorwordbabelll & - \hspace{0.5cm} \@itacoadvisorinst }
      \@ifundefined{metitleb}{}    {\\ \metitleb\@ & \menameb\@ & \hspace{1cm} \meroleb\@ & - \hspace{0.5cm} \meinstb\@ } \\
      \@ifundefined{metitlec}{}    {\metitlec\@ & \menamec\@ & \hspace{1cm} \merolec\@ & - \hspace{0.5cm} \meinstc\@ } \\
      \@ifundefined{metitled}{}    {\metitled\@ & \menamed\@ & \hspace{1cm} \meroled\@ & - \hspace{0.5cm} \meinstd\@ } \\
      \@ifundefined{metitlee}{}    {\metitlee\@ & \menamee\@ & \hspace{1cm} \merolee\@ & - \hspace{0.5cm} \meinste\@ } \\
      \@ifundefined{metitlef}{}    {\metitlef\@ & \menamef\@ & \hspace{1cm} \merolef\@ & - \hspace{0.5cm} \meinstf\@ } \\
      \@ifundefined{metitleg}{}    {\metitleg\@ & \menameg\@ & \hspace{1cm} \meroleg\@ & - \hspace{0.5cm} \meinstg\@ } \\
      \@ifundefined{metitleh}{}    {\metitleh\@ & \menameh\@ & \hspace{1cm} \meroleh\@ & - \hspace{0.5cm} \meinsth\@ }
        \end{tabular}
}

%==============================================================================
%%% Palavras-chave
%==============================================================================
\newcommand{\keywords}[1]{%
    \vfill \noindent\textbf{Palavras Chave:} #1%
}

%==============================================================================
%%% Keywords
%==============================================================================
\newcommand{\englishkeywords}[1]{%
    \vfill \noindent\textbf{Keywords:} #1
}

%==============================================================================
% Definição das palavras-chave para CIP (informado pela Biblioteca)
%==============================================================================
\newcounter{kwcipcounter}
\newcommand{\kwcip}[1]{
        \addtocounter{kwcipcounter}{1}
        \expandafter\gdef\csname kwcip\alph{kwcipcounter}\endcsname{#1}
}
\newcommand{\@cipkw}{%
        \@ifundefined{kwcipa}{}{1.~\expandafter\MakeUppercase\kwcipa\@. }%
        \@ifundefined{kwcipb}{}{2.~\expandafter\MakeUppercase\kwcipb\@. }%
        \@ifundefined{kwcipc}{}{3.~\expandafter\MakeUppercase\kwcipc\@. }%
        \@ifundefined{kwcipd}{}{4.~\expandafter\MakeUppercase\kwcipd\@. }%
        \@ifundefined{kwcipe}{}{5.~\expandafter\MakeUppercase\kwcipe\@. }%
        \@ifundefined{kwcipf}{}{6.~\expandafter\MakeUppercase\kwcipf\@. }%
        \@ifundefined{kwcipg}{}{7.~\expandafter\MakeUppercase\kwcipg\@. }%
        \@ifundefined{kwciph}{}{8.~\expandafter\MakeUppercase\kwciph\@. }%
        \@ifundefined{kwcipi}{}{9.~\expandafter\MakeUppercase\kwcipi\@. }%
        \@ifundefined{kwcipj}{}{10.~\expandafter\MakeUppercase\kwcipj\@. }%
}

%==============================================================================
%%% Hack: Centralizando \chapter*
%%% \@makeschapterhead é chamado por \chapter*
%==============================================================================
\def\@makeschapterhead#1{%
  \vspace*{50\p@}%
  {\parindent \z@ \centering
    \normalfont
    \interlinepenalty\@M
    \Huge \bfseries  #1\par\nobreak
    \vskip 40\p@
  }}

%==============================================================================
%%% Redefinicao do comando \appendix para mostrar 'Apêndice' ou 'Anexo'
%%% no Sumario
%==============================================================================
\renewcommand{\appendix}{%
  \cleardoublepage
  \providecommand\anexoautorefname{appendix}
	\setcounter{chapter}{0}%
	\setcounter{section}{0}%
	\def\Hy@appendixstring{appendix}% %%novo string no *.toc, para fazer o hyperlink funcionar
	\def\anexo{%
  \@ifundefined{chapter}%
    {\gdef\theHsection{\Alph{section}}}%
    {\gdef\theHchapter{\Alph{chapter}}}%
  \xdef\Hy@chapapp{\Hy@appendixstring}%

  \gdef\@chapapp{\appendixname}%
  \addtocontents{toc}{\SetAppendixTocName{\appendixname}}%
  \gdef\thechapter{\@Alph\c@chapter}%
  }
  \anexo
}

%==============================================================================
%%% Acrescenta o comando SetappendixTocName ao toc
%==============================================================================
\DeclareRobustCommand{\SetAppendixTocName}[1]{\gdef\AppendixTocName{#1}}

%==============================================================================
%%% Novo comando: \annex
%==============================================================================
\newcommand{\annex}{%
  \cleardoublepage
  \providecommand\anexoautorefname{annex}
	\setcounter{chapter}{0}%
	\setcounter{section}{0}%
	\def\Hy@appendixstring{annex}% %%novo string no *.toc, para fazer o hyperlink funcionar
	\def\anexo{%
  \@ifundefined{chapter}%
    {\gdef\theHsection{\alph{section}}}%
    {\gdef\theHchapter{\alph{chapter}}}%
  \xdef\Hy@chapapp{\Hy@appendixstring}%

  \gdef\@chapapp{\nameannex}%
  \addtocontents{toc}{\SetAppendixTocName{\nameannex}}%
  \gdef\thechapter{\@Alph\c@chapter}%
  }
  \anexo
}


%==============================================================================
%%% Redefinicao de mainmatter para numeracao continua de paginas
%==============================================================================
\renewcommand\mainmatter{%
  \cleardoublepage
  \@mainmattertrue
  \renewcommand{\thepage}{\arabic{page}} }

%==============================================================================
%%% 'Desligar' hifenacao...
%==============================================================================
\newlanguage\nohyphen
\newcommand\nh[1]{{\language\nohyphen #1}}

%==============================================================================
%%% Redefinicao de l@chapter, l@section e l@subsection para acrescentar
%%% a palavra 'Anexo' ou 'Apendice' no toc e ajustar identacao para
%%% "nada identado" ... :-)
%==============================================================================
\renewcommand*\l@chapter[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    \vskip -3ex \@plus\p@
    \setlength\@tempdima{1.5em}%
    \begingroup
    \ifx\AppendixTocName\undefined\else
       \renewcommand{\numberline}[1]{\AppendixTocName~##1~~--~~}%
    \fi
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode \bfseries
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      \@dottedtocline{0}{0em}{1.8em}{\normalfont\scshape\large{#1}}{#2}
      \penalty\@highpenalty
    \endgroup
  \fi}

% l@section
\renewcommand*{\l@section}[2]{%
\@dottedtocline{1}{0.5cm}{2.8em}{\textbf{#1}}{\hss #2}}

% l@subsection
\renewcommand*{\l@subsection}{\@dottedtocline{2}{1cm}{3.7em}}

%==============================================================================
%%% Numerar o subsubsection conforme definido anteriormente
%==============================================================================
\setcounter{secnumdepth}{4}

%==============================================================================
%%% Glossario
%==============================================================================
\newcommand{\itaglossary}{
\cleardoublepage
\thispagestyle{empty}%
\@mkboth{\MakeUppercase{\itaglossarynamebabel}}%
        {\MakeUppercase{\itaglossarynamebabel}}%
\gdef\glossaryname{\itaglossarynamebabel}
\refstepcounter{chapter}
}

%==============================================================================
% %%% Centralizar e ajustar os espacamentos dos captions das figuras e tabelas 
%==============================================================================
\def\fnum@figure{\centering\MakeUppercase{\figurename}\nobreakspace\thefigure}
\def\fnum@table{\centering\MakeUppercase{\tablename}\nobreakspace\thetable}
\setlength\abovecaptionskip{6\p@}
\setlength\belowcaptionskip{4\p@}

% Redefinicao do caracter que separa o label Figura ou Tabela do texto
%\renewcommand*\captionlabeldelim{\ --}

%==============================================================================
% %%% Indentar a segunda linha de captions longos das listas 
%     de figuras e tabelas
%==============================================================================
\renewcommand*{\l@figure}{\@dottedtocline{1}{0cm}{1cm}}
\def\FigureITA@dottedtocline#1#2#3#4#5{\begingroup
  \def\numberline##1{\hb@xt@\@tempdima{\itafigurenamebabel~##1 --\hfil}}%
  \@dottedtocline{#1}{#2}{#3}{#4}{#5}%
\endgroup}
\def\TableITA@dottedtocline#1#2#3#4#5{\begingroup
  \def\numberline##1{\hb@xt@\@tempdima{\itatablenamebabel~##1 --\hfil}}%
  \@dottedtocline{#1}{#2}{#3}{#4}{#5}%
\endgroup}
% faz a lista de figuras e de tabelas usarem as novas versoes dos \dottedtocline
\renewcommand*\l@figure{\FigureITA@dottedtocline{1}{0cm}{2.8cm}}
\renewcommand*\l@table{\TableITA@dottedtocline{1}{0cm}{2.8cm}}



%==============================================================================
%%% Hack: Retirando a palavra Capitulo mas mantendo Anexo e Apendice...
%%% \@makechapterhead é chamado por \chapter
%==============================================================================
\def\@makechapterhead#1{%
  \vspace*{50\p@}%
  {\parindent \z@ \raggedright \normalfont
    \ifnum \c@secnumdepth >\m@ne
      \if@mainmatter
          % se "anexo" nao foi definido, altera cabecalho do capitulo..
	  % senao, mantem a palavra Anexo ou Apendice
          \@ifundefined{anexo}      
		{\huge\bfseries \thechapter\space}
		{\huge\bfseries \@chapapp\space \thechapter \space -}
      \fi
    \fi
    \interlinepenalty\@M
    \Huge \bfseries #1\par\nobreak
    \vskip 40\p@
  }}
  

