(* 
  This MMA code is part of the MondoSCF suite of 
  linear scaling electronic structure codes.  

  Matt Challacombe
  Los Alamos National Laboratory
  Copywrite 2000, The University of California
*)

(* GET THE MAX ANGULAR SYMMETRY TO BE USED *)

MondoHome=Environment["MONDO_HOME"];
If[MondoHome==$FAILED,
   Print["COULD NOT FIND $MONDO_HOME! CHECK YOUR .cshrc "];
   Abort[];
  ];
EllFile = StringJoin[MondoHome,"/Includes/Ell.m"];
Get[EllFile];

(* INDEXING OF SP ARRAY ELEMENTS: NOTE WE START FROM 0 NOT 1*)

SPDex[L_,M_]:=Binomial[L+1,2]+M;
LSP[L_]:=L*(L+3)/2;   

(* LOAD OPTIMIZING AND FORMATING ROUTINES FOR MMA AND SET ASSOCIATED OPTIONS *)

Get[StringJoin[MondoHome,"/MMA/FixedNumberForm.m"]];
Get[StringJoin[MondoHome,"/MMA/Format.m"]];
Get[StringJoin[MondoHome,"/MMA/Optimize.m"]];

SetOptions[FortranAssign,AssignOptimize->False,AssignMaxSize->500,
                         AssignBreak->{132," & \n          "},AssignTemporary->{W,Array}]
SetOptions[Optimize,OptimizeVar)iable->{R,Sequence},OptimizeFunction->False]
SetOptions[OpenWrite, PageWidth -> 800];

(* GLOBAL FORMATING FUNCTIONS *)

FF[x_] := ToString[FixedNumberForm[SetPrecision[N[x,32],32], 16, 2]];
WS[String_]:=WriteString[FileName,"      ",String,"\n"];
WC[String_]:=WriteString[FileName,"!     ",String,"\n"];

(* LOAD MODULE FOR WRITING EXPLICIT SOURCE FOR COMPUTATION OF IRREGULAR HARMONICS *)

<<IrRegular.m; 
<<Contract.m;

FileName=StringJoin[MondoHome,"/QCTC/IrRegulars.Inc"]; 
Print[" Openned ",FileName];
OpenWrite[FileName];
WS["SELECT CASE(Ell)"]
Do[
   ldx=ToString[l];
   WS[StringJoin["CASE(",ldx,")"]];
   IrRegular[FileName,l];
  ,{l,0,HGEll+SPEll}]
WS["END SELECT"]
Close[FileName];
Print[" Closed ",FileName];

FileName=StringJoin[MondoHome,"/QCTC/CTraX.Inc"]; 
Print[" Openned ",FileName];
OpenWrite[FileName];
WS["SELECT CASE(LCode)"]
Do[Do[
      ldx=ToString[LHG*100+LSP];
      WS[StringJoin["CASE(",ldx,")"]];
      Contract[FileName,LHG,LSP];
,{LSP,0,SPEll}]
,{LHG,0,HGEll}];
WS["END SELECT"]
Close[FileName];
Print[" Closed ",FileName];

